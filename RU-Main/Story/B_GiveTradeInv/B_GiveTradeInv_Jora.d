
var int Jora_ItemsGiven_Chapter_1;
var int Jora_ItemsGiven_Chapter_2;
var int Jora_ItemsGiven_Chapter_3;
var int Jora_ItemsGiven_Chapter_4;
var int Jora_ItemsGiven_Chapter_5;
var int jora_itemsgiven_masterguild;

func void B_GiveTradeInv_Jora(var C_Npc slf)
{
	if((Kapitel >= 1) && (Jora_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_MeetKnife,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,2);
		CreateInvItems(slf,ItPl_Mushroom_01,3);
		CreateInvItems(slf,itfo_wineberrys,1);
		CreateInvItems(slf,ItMi_Salt,1);
		CreateInvItems(slf,ItFoMutton,8);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItAm_Prot_Point_01,1);
		Jora_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Jora_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMiSwordraw,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,3);
		CreateInvItems(slf,ItPl_Mushroom_02,2);
		CreateInvItems(slf,ItFo_FishSoup,3);
		CreateInvItems(slf,ItMi_Salt,2);
		CreateInvItems(slf,ItRw_Arrow,60);
		CreateInvItems(slf,ItRw_Bolt,60);
		Jora_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Jora_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Wine,1);
		CreateInvItems(slf,ItPl_Mana_Herb_01,4);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);
		CreateInvItems(slf,ItMi_Salt,1);
		CreateInvItems(slf,ItRw_Arrow,60);
		CreateInvItems(slf,ItRw_Bolt,60);
		Jora_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Jora_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItPl_Mana_Herb_02,4);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItRw_Arrow,60);
		CreateInvItems(slf,ItRw_Bolt,60);
		CreateInvItems(slf,ItBe_Addon_STR_10,1);
		Jora_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Jora_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,2);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItRw_Arrow,160);
		CreateInvItems(slf,ItRw_Bolt,160);
		Jora_ItemsGiven_Chapter_5 = TRUE;
	};
};

func void b_givetradeinv_jora_guild(var C_Npc slf)
{
	if((MASTERTRADEGUILD == TRUE) && (JORA_ITEMSGIVEN_MASTERGUILD == FALSE))
	{
		CreateInvItems(slf,itat_crawlerqueen,2);
		CreateInvItems(slf,ItMi_Zeitspalt_Addon,1);
		CreateInvItems(slf,ItMi_Sextant,1);
		JORA_ITEMSGIVEN_MASTERGUILD = TRUE;
	};
};