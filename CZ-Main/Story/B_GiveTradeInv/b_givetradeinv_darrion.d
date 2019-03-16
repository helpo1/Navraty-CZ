
var int darrion_itemsgiven_chapter_1;
var int darrion_itemsgiven_chapter_2;
var int darrion_itemsgiven_chapter_3;
var int darrion_itemsgiven_chapter_4;
var int darrion_itemsgiven_chapter_5;

func void b_givetradeinv_darrion(var C_Npc slf)
{
	if((Kapitel >= 1) && (DARRION_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMi_IronStuck,1);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		DARRION_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (DARRION_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,250);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMi_IronStuck,1);
		DARRION_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (DARRION_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,450);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMi_IronStuck,1);
		DARRION_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (DARRION_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,700);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMi_IronStuck,1);
		DARRION_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (DARRION_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,1100);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMi_IronStuck,1);
		DARRION_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};