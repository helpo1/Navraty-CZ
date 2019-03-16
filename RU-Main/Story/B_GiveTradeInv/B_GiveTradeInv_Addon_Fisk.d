
var int Fisk_ItemsGiven_Chapter_1;
var int Fisk_ItemsGiven_Chapter_2;
var int Fisk_ItemsGiven_Chapter_3;
var int Fisk_ItemsGiven_Chapter_4;
var int Fisk_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Fisk(var C_Npc slf)
{
	if((Kapitel >= 1) && (Fisk_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,itfo_wineberrys,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,itmi_quicksilver,1);
		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItMi_Pitch,5);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItRi_Prot_Edge_02,1);
		CreateInvItems(slf,ItMi_Bottle_Empty,5);
		CreateInvItems(slf,ItKE_lockpick,30);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItWr_Alcohol_Grog,1);
		CreateInvItems(slf,ItMi_Chopper,2);
		CreateInvItems(slf,ItMw_1H_Axe_WoodChoppin,1);
		Fisk_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Fisk_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Fisk_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Fisk_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Beet,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItAt_Sting,5);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		CreateInvItems(slf,ItMiSwordraw,2);
		Fisk_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Fisk_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Fisk_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Fisk_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,10);
		CreateInvItems(slf,ItPl_Health_Herb_03,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Fisk_ItemsGiven_Chapter_5 = TRUE;
	};
};