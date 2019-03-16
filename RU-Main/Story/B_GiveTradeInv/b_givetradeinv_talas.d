
var int talas_itemsgiven_chapter_1;
var int talas_itemsgiven_chapter_2;
var int talas_itemsgiven_chapter_3;
var int talas_itemsgiven_chapter_4;
var int talas_itemsgiven_chapter_5;

func void b_givetradeinv_talas(var C_Npc slf)
{
	if((Kapitel >= 1) && (TALAS_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItMi_Joint,5);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItPl_SwampHerb,10);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		TALAS_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (TALAS_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItPl_SwampHerb,7);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItPl_Health_Herb_02,5);
		CreateInvItems(slf,ItPl_Health_Herb_03,2);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		TALAS_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (TALAS_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPo_Speed,2);
		CreateInvItems(slf,itpo_speed_02,1);
		CreateInvItems(slf,ItPl_SwampHerb,5);
		CreateInvItems(slf,ItPl_Mushroom_01,3);
		CreateInvItems(slf,ItPl_Temp_Herb,2);
		CreateInvItems(slf,ItPl_Health_Herb_02,5);
		CreateInvItems(slf,ItPl_Health_Herb_03,3);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		TALAS_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (TALAS_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPo_Speed,2);
		CreateInvItems(slf,itpo_speed_02,1);
		CreateInvItems(slf,ItPl_SwampHerb,3);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,5);
		CreateInvItems(slf,ItPl_Health_Herb_03,3);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		TALAS_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (TALAS_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,ItPo_Speed,2);
		CreateInvItems(slf,itpo_speed_02,1);
		CreateInvItems(slf,ItPl_SwampHerb,2);
		CreateInvItems(slf,ItPl_Mushroom_01,2);
		CreateInvItems(slf,ItPl_Temp_Herb,2);
		CreateInvItems(slf,ItPl_Health_Herb_02,5);
		CreateInvItems(slf,ItPl_Health_Herb_03,3);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		TALAS_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

