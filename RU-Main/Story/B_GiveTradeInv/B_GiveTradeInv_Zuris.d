
var int Zuris_ItemsGiven_Chapter_1;
var int Zuris_ItemsGiven_Chapter_2;
var int Zuris_ItemsGiven_Chapter_3;
var int Zuris_ItemsGiven_Chapter_4;
var int Zuris_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Zuris(var C_Npc slf)
{
	if((Kapitel >= 1) && (Zuris_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPl_Blueplant,5);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Health_01,30);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItMi_ApfelTabak,2);
		CreateInvItems(slf,ItMi_Flask,50);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItWr_Astronomy_Mis,1);
		CreateInvItems(slf,ItFo_Addon_Pfeffer_01,1);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItBe_Addon_Prot_MAGIC,1);
		CreateInvItems(slf,ItAm_Hp_Mana_01,1);
		CreateInvItems(slf,ItMi_Bottle_Empty,5);
		CreateInvItems(slf,ItMi_Wax,1);
		CreateInvItems(slf,ItBg_Alchemy,1);
		Zuris_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Zuris_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,60);
		CreateInvItems(slf,ItPl_Blueplant,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_01,25);
		CreateInvItems(slf,ItPo_Mana_02,40);
		CreateInvItems(slf,ItMi_Salt,5);
		CreateInvItems(slf,ItPo_Health_01,15);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItPo_Health_02,12);
		CreateInvItems(slf,itpo_stamina,15);
		CreateInvItems(slf,ItMi_ApfelTabak,5);
		CreateInvItems(slf,ItPo_Perm_STR,1);
		CreateInvItems(slf,ItMi_Bottle_Empty,5);
		Zuris_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Zuris_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,120);
		CreateInvItems(slf,ItPl_Blueplant,15);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_01,25);
		CreateInvItems(slf,ItPo_Mana_02,40);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItMi_Salt,5);
		CreateInvItems(slf,ItPo_Mana_03,5);
		CreateInvItems(slf,ItPo_Health_01,25);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,itpo_stamina,15);
		CreateInvItems(slf,ItPo_Speed,1);
		Zuris_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Zuris_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,220);
		CreateInvItems(slf,ItPl_Blueplant,20);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_01,35);
		CreateInvItems(slf,ItPo_Mana_02,35);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_03,10);
		CreateInvItems(slf,ItPo_Health_01,35);
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,itpo_stamina,20);
		CreateInvItems(slf,ItPo_Speed,1);
		Zuris_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Zuris_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,321);
		CreateInvItems(slf,ItPl_Blueplant,20);
		CreateInvItems(slf,ItPo_Health_Addon_04,5);
		CreateInvItems(slf,ItPo_Mana_Addon_04,5);
		CreateInvItems(slf,ItPo_Mana_01,55);
		CreateInvItems(slf,ItPo_Mana_02,35);
		CreateInvItems(slf,ItPo_Mana_03,25);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Health_01,55);
		CreateInvItems(slf,ItPo_Health_02,30);
		CreateInvItems(slf,ItPo_Health_03,20);
		CreateInvItems(slf,ItPo_Perm_Health,1);
		CreateInvItems(slf,itpo_stamina,25);
		CreateInvItems(slf,ItPo_Speed,1);
		Zuris_ItemsGiven_Chapter_5 = TRUE;
	};
};

var int Lehmar_ItemsGiven_Chapter_1;

func void B_GiveTradeInv_Lehmar(var C_Npc slf)
{
	if((Kapitel >= 1) && (Lehmar_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_ParlanRelic_MIS,1);
		CreateInvItems(slf,ItMW_Rich_Sword,1);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,ItAt_TrollFur,1);
		CreateInvItems(slf,ItMi_OreStuck,1);
		CreateInvItems(slf,ItMi_JeweleryChest,1);
		Lehmar_ItemsGiven_Chapter_1 = TRUE;
	};
};