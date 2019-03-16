
var int nigel_itemsgiven_chapter_1;
var int nigel_itemsgiven_chapter_2;
var int nigel_itemsgiven_chapter_3;
var int nigel_itemsgiven_chapter_4;
var int nigel_itemsgiven_chapter_5;
var int nigel_itemsgiven_masterguild;

func void b_givetradeinv_nigel(var C_Npc slf)
{
	if((Kapitel >= 1) && (NIGEL_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Apple,2);
		CreateInvItems(slf,ItFo_Water,3);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItFo_Milk,5);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Perm_Health,1);
		CreateInvItems(slf,ItMi_Pitch,5);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		NIGEL_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (NIGEL_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFoMutton,3);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Milk,3);
		CreateInvItems(slf,ItFo_Water,4);
		CreateInvItems(slf,ItFo_Wine,4);
		CreateInvItems(slf,itfo_wineberrys,2);
		CreateInvItems(slf,ItFo_Beer,4);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		NIGEL_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (NIGEL_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Bacon,2);
		CreateInvItems(slf,ItFoMutton,3);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItFo_Sausage,3);
		CreateInvItems(slf,ItFo_Milk,5);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		NIGEL_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (NIGEL_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Speed,4);
		CreateInvItems(slf,ItLsTorch,10);
		NIGEL_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (NIGEL_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		NIGEL_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

func void b_givetradeinv_nigel_guild(var C_Npc slf)
{
	if((MASTERTRADEGUILD == TRUE) && (NIGEL_ITEMSGIVEN_MASTERGUILD == FALSE))
	{
		CreateInvItems(slf,ItAt_DragonScale,2);
		CreateInvItems(slf,ItAm_Prot_Fire_01,1);
		CreateInvItems(slf,ItMi_DarkPearl,3);
		CreateInvItems(slf,ItAt_ShadowHorn,2);
		NIGEL_ITEMSGIVEN_MASTERGUILD = TRUE;
	};
};