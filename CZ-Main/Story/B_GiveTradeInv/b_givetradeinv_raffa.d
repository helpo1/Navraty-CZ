
var int raffa_itemsgiven_chapter_1;
var int raffa_itemsgiven_chapter_2;
var int raffa_itemsgiven_chapter_3;
var int raffa_itemsgiven_chapter_4;
var int raffa_itemsgiven_chapter_5;

func void b_givetradeinv_raffa(var C_Npc slf)
{
	if((Kapitel >= 1) && (RAFFA_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItMi_CutKnife,2);
		CreateInvItems(slf,ItMi_Pitch,5);
		CreateInvItems(slf,ItMi_MeetKnife,1);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bow_M_01,1);
		CreateInvItems(slf,ItRw_Bow_M_02,1);
		CreateInvItems(slf,ItRw_Bow_M_03,1);
		CreateInvItems(slf,ItRw_Bow_M_04,1);
		RAFFA_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (RAFFA_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,100);
		RAFFA_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (RAFFA_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItRw_Arrow,150);
		RAFFA_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (RAFFA_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItRw_Arrow,200);
		RAFFA_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (RAFFA_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,250);
		CreateInvItems(slf,ItRw_Arrow,250);
		RAFFA_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};