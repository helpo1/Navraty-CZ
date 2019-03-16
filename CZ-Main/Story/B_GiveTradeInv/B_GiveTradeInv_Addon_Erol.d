
var int Erol_ItemsGiven_Chapter_1;
var int Erol_ItemsGiven_Chapter_2;
var int Erol_ItemsGiven_Chapter_3;
var int Erol_ItemsGiven_Chapter_4;
var int Erol_ItemsGiven_Chapter_5;
var int erol_itemsgiven_masterguild;

func void B_GiveTradeInv_Addon_Erol(var C_Npc slf)
{
	if((Kapitel >= 1) && (Erol_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMw_Schwert3,1);
		CreateInvItems(slf,ItMw_Schwert2,1);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Bread,3);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,1);
		CreateInvItems(slf,ItPl_Health_Herb_02,2);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItRi_Prot_Edge_01,1);
		CreateInvItems(slf,ItAm_Strg_01,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		Erol_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Erol_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Water,1);
		CreateInvItems(slf,ItFo_Bread,2);
		CreateInvItems(slf,ItFo_Cheese,3);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);
		CreateInvItems(slf,ItPl_Temp_Herb,2);
		CreateInvItems(slf,ItMiSwordraw,2);
		Erol_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Erol_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItMiSwordraw,5);
		Erol_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Erol_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Cheese,1);
		CreateInvItems(slf,ItFoMutton,2);
		CreateInvItems(slf,ItFo_Stew,3);
		CreateInvItems(slf,ItFo_FishSoup,4);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);
		CreateInvItems(slf,ItPl_Temp_Herb,4);
		Erol_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Erol_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Health_Herb_02,3);
		CreateInvItems(slf,ItPl_Temp_Herb,5);
		CreateInvItems(slf,ItPo_Perm_Health,1);
		Erol_ItemsGiven_Chapter_5 = TRUE;
	};
};

func void b_givetradeinv_addon_erol_guild(var C_Npc slf)
{
	if((MASTERTRADEGUILD == TRUE) && (EROL_ITEMSGIVEN_MASTERGUILD == FALSE))
	{
		CreateInvItems(slf,ItPo_Perm_STR,1);
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,itmiswordblade_1,3);
		CreateInvItems(slf,ItAt_ShadowHorn,2);
		EROL_ITEMSGIVEN_MASTERGUILD = TRUE;
	};
};