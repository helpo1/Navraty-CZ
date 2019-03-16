var int valeran_itemsgiven_chapter_1;
var int valeran_itemsgiven_chapter_2;
var int valeran_itemsgiven_chapter_3;
var int valeran_itemsgiven_chapter_4;

func void b_givetradeinv_valeran(var C_Npc slf)
{
	if((Kapitel >= 1) && (VALERAN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItRw_Bow_M_04,1);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,2);
		CreateInvItems(slf,ItMi_HolyWater,1);
		CreateInvItems(slf,ItPo_Mana_01,3);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItSc_Light,5);
		CreateInvItems(slf,ItSc_LightHeal,5);
		VALERAN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (VALERAN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itwr_protfall,1);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,2);
		CreateInvItems(slf,ItMi_HolyWater,1);
		VALERAN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (VALERAN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,itfo_wineberrys,1);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,2);
		CreateInvItems(slf,ItMi_HolyWater,1);
		CreateInvItems(slf,ItPo_Health_01,7);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_02,7);
		VALERAN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (VALERAN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,2);
		CreateInvItems(slf,ItMi_HolyWater,1);
		VALERAN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
};

var int Fregeal_itemsgiven_chapter_1;
var int Fregeal_itemsgiven_chapter_2;
var int Fregeal_itemsgiven_chapter_3;
var int Fregeal_itemsgiven_chapter_4;
var int Fregeal_itemsgiven_chapter_5;

func void b_givetradeinv_Fregeal(var C_Npc slf)
{
	if((Kapitel >= 1) && (Fregeal_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItPl_SwampHerb,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		CreateInvItems(slf,ItPl_Mana_Herb_01,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Dex_Herb_01,1);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,10);
		CreateInvItems(slf,ItPl_Blueplant,30);
		CreateInvItems(slf,ItPl_Forestberry,10);
		CreateInvItems(slf,ItPl_Planeberry,10);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItFo_Water,5);
		Fregeal_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (Fregeal_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItPl_SwampHerb,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		CreateInvItems(slf,ItPl_Mana_Herb_01,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Speed_Herb_01,10);
		CreateInvItems(slf,ItPl_Blueplant,40);
		CreateInvItems(slf,ItPl_Forestberry,10);
		CreateInvItems(slf,ItPl_Planeberry,10);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItFo_Water,5);
		Fregeal_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (Fregeal_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItPl_SwampHerb,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		CreateInvItems(slf,ItPl_Mana_Herb_01,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Dex_Herb_01,1);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,10);
		CreateInvItems(slf,ItPl_Blueplant,50);
		CreateInvItems(slf,ItPl_Forestberry,10);
		CreateInvItems(slf,ItPl_Planeberry,10);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItFo_Water,5);
		Fregeal_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (Fregeal_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItPl_SwampHerb,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		CreateInvItems(slf,ItPl_Mana_Herb_01,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Speed_Herb_01,10);
		CreateInvItems(slf,ItPl_Blueplant,60);
		CreateInvItems(slf,ItPl_Forestberry,10);
		CreateInvItems(slf,ItPl_Planeberry,10);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItFo_Water,5);
		Fregeal_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (Fregeal_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItPl_SwampHerb,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,5);
		CreateInvItems(slf,ItPl_Mana_Herb_01,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Dex_Herb_01,2);
		CreateInvItems(slf,ItPl_Strength_Herb_01,2);
		CreateInvItems(slf,ItPl_Speed_Herb_01,10);
		CreateInvItems(slf,ItPl_Blueplant,70);
		CreateInvItems(slf,ItPl_Forestberry,10);
		CreateInvItems(slf,ItPl_Planeberry,10);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItPl_Perm_Herb,2);
		CreateInvItems(slf,ItFo_Water,5);
		Fregeal_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};