
var int ramirez_itemsgiven_chapter_1;
var int ramirez_itemsgiven_chapter_2;
var int ramirez_itemsgiven_chapter_3;
var int ramirez_itemsgiven_chapter_4;
var int ramirez_itemsgiven_chapter_5;

func void b_givetradeinv_ramirez(var C_Npc slf)
{
	if(RAMIREZ_ITEMSGIVEN_CHAPTER_1 == FALSE)
	{
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItMi_Addon_WhitePearl,2);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_Aquamarine,1);
		CreateInvItems(slf,ItMi_Coal,5);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItBe_Addon_Thief_01,1);
		CreateInvItems(slf,ItMi_ZharpStone,1);
		CreateInvItems(slf,ItKE_lockpick,15);
		RAMIREZ_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (RAMIREZ_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItMi_Addon_WhitePearl,2);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_Aquamarine,1);
		CreateInvItems(slf,ItMi_Coal,5);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItBe_Addon_Thief_02,1);
		CreateInvItems(slf,ItKE_lockpick,15);
		RAMIREZ_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (RAMIREZ_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItMi_Addon_WhitePearl,2);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_Aquamarine,1);
		CreateInvItems(slf,ItMi_Coal,5);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItBe_Addon_Thief_03,1);
		CreateInvItems(slf,ItKE_lockpick,15);
		RAMIREZ_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (RAMIREZ_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItMi_Addon_WhitePearl,2);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_Aquamarine,1);
		CreateInvItems(slf,ItMi_Coal,5);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItKE_lockpick,15);
		RAMIREZ_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (RAMIREZ_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItKE_lockpick,15);
		RAMIREZ_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};