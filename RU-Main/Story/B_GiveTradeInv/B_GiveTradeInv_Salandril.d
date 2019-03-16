
var int Salandril_ItemsGiven_Chapter_1;
var int Salandril_ItemsGiven_Chapter_2;
var int Salandril_ItemsGiven_Chapter_3;
var int Salandril_ItemsGiven_Chapter_4;
var int Salandril_ItemsGiven_Chapter_5;
var int salandril_itemsgiven_masterguild;

func void B_GiveTradeInv_Salandril(var C_Npc slf)
{
	if((Kapitel >= 1) && (Salandril_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPl_Blueplant,10);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_02,5);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItPo_Health_02,5);
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItMi_Salt,4);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItMi_Flask,50);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItAm_Prot_Fire_01,1);
		CreateInvItems(slf,astronomie,1);
		CreateInvItems(slf,ItSc_OrcHeal,1);
		CreateInvItems(slf,rezepturen2,1);
		CreateInvItems(slf,ITPO_ANPOIS,15);
		CreateInvItems(slf,ItWr_Alchemy_01,1);
		CreateInvItems(slf,itmi_plazma,1);
		Salandril_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Salandril_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,itwr_fullhealth_02,1);
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_02,7);
		CreateInvItems(slf,ItPo_Health_02,5);
		CreateInvItems(slf,ItMi_Salt,3);
		CreateInvItems(slf,ItPo_Mana_03,3);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Salandril_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Salandril_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_02,8);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Health_02,5);
		CreateInvItems(slf,ItPo_Mana_03,4);
		CreateInvItems(slf,ItMi_Salt,4);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Salandril_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Salandril_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_03,7);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPo_Health_03,5);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Salandril_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Salandril_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,300);
		CreateInvItems(slf,ItPo_Mana_02,12);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItPo_Mana_03,15);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPo_Health_03,5);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Salandril_ItemsGiven_Chapter_5 = TRUE;
	};
};

func void b_givetradeinv_salandril_guild(var C_Npc slf)
{
	if((MASTERTRADEGUILD == TRUE) && (SALANDRIL_ITEMSGIVEN_MASTERGUILD == FALSE))
	{
		CreateInvItems(slf,ItPo_Perm_Mana,2);
		CreateInvItems(slf,itpo_speed_02,4);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPo_Health_Addon_04,5);
		CreateInvItems(slf,ItPo_Mana_Addon_04,5);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		SALANDRIL_ITEMSGIVEN_MASTERGUILD = TRUE;
	};
};

