
var int Constantino_ItemsGiven_Chapter_1;
var int Constantino_ItemsGiven_Chapter_2;
var int Constantino_ItemsGiven_Chapter_3;
var int Constantino_ItemsGiven_Chapter_4;
var int Constantino_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Constantino(var C_Npc slf)
{
	if((Kapitel >= 1) && (Constantino_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,31);
		CreateInvItems(slf,ItMi_Flask,50);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItAt_GoblinBone,1);
		CreateInvItems(slf,ItAt_Wing,3);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Health_Herb_02,20);
		CreateInvItems(slf,ItPl_Mana_Herb_01,15);
		CreateInvItems(slf,ItPl_Mana_Herb_02,20);
		CreateInvItems(slf,ItWr_Astronomy_Mis,1);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ITPO_ANPOIS,10);
		CreateInvItems(slf,rezepturen,1);
		CreateInvItems(slf,ItMi_Bottle_Empty,5);
		CreateInvItems(slf,ItFo_Alcohol,5);
		CreateInvItems(slf,ItWr_Alcohol_Booze,1);
		CreateInvItems(slf,itmi_plazma,1);
		Constantino_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Constantino_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,itwr_magicdefence_02,1);
		CreateInvItems(slf,ItMi_Gold,60);
		CreateInvItems(slf,ItMi_Flask,15);
		CreateInvItems(slf,ItPl_Temp_Herb,30);
		CreateInvItems(slf,ItPl_SwampHerb,2);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Health_Herb_02,20);
		CreateInvItems(slf,ItPl_Mana_Herb_01,15);
		CreateInvItems(slf,ItPl_Mana_Herb_02,20);
		CreateInvItems(slf,itpo_stamina,10);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItAt_Wing,2);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItAt_GoblinBone,2);
		CreateInvItems(slf,ItPl_Mushroom_01,5);
		CreateInvItems(slf,ITPO_ANPOIS,15);
		CreateInvItems(slf,ItFo_Alcohol,5);
		CreateInvItems(slf,ItMi_Bottle_Empty,5);
		Constantino_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Constantino_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,120);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItMi_Flask,20);
		CreateInvItems(slf,ItPl_Temp_Herb,20);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_SwampHerb,1);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Health_Herb_02,20);
		CreateInvItems(slf,ItPl_Mana_Herb_01,15);
		CreateInvItems(slf,ItPl_Mana_Herb_02,20);
		CreateInvItems(slf,itpo_stamina,15);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItPl_Blueplant,9);
		CreateInvItems(slf,ItPl_Mushroom_01,3);
		CreateInvItems(slf,ItPl_Mushroom_02,2);
		CreateInvItems(slf,ItAt_SharkTeeth,3);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItAt_ShadowHorn,1);
		CreateInvItems(slf,ItAt_SkeletonBone,1);
		CreateInvItems(slf,ITPO_ANPOIS,10);
		CreateInvItems(slf,ItFo_Alcohol,5);
		CreateInvItems(slf,ItBe_Addon_Prot_FIRE,1);
		Constantino_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Constantino_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,220);
		CreateInvItems(slf,ItMi_Flask,25);
		CreateInvItems(slf,ItPl_Temp_Herb,30);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,16);
		CreateInvItems(slf,ItPl_Health_Herb_02,18);
		CreateInvItems(slf,ItPl_Health_Herb_03,13);
		CreateInvItems(slf,ItPl_Mana_Herb_01,17);
		CreateInvItems(slf,ItPl_Mana_Herb_02,14);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,itpo_stamina,25);
		CreateInvItems(slf,ItAt_GoblinBone,2);
		CreateInvItems(slf,ItAt_SkeletonBone,1);
		CreateInvItems(slf,ItAt_ShadowHorn,2);
		CreateInvItems(slf,ITPO_ANPOIS,10);
		CreateInvItems(slf,ItAt_Wing,2);
		CreateInvItems(slf,ItAt_WolfFur,1);
		CreateInvItems(slf,ItFo_Alcohol,5);
		CreateInvItems(slf,ItPo_Health_01,6);
		Constantino_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Constantino_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,321);
		CreateInvItems(slf,ItMi_Flask,25);
		CreateInvItems(slf,ItPl_Temp_Herb,40);
		CreateInvItems(slf,ItPl_Perm_Herb,2);
		CreateInvItems(slf,ItPl_SwampHerb,2);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,24);
		CreateInvItems(slf,ItPl_Health_Herb_02,19);
		CreateInvItems(slf,ItPl_Health_Herb_03,16);
		CreateInvItems(slf,itpo_stamina,50);
		CreateInvItems(slf,ITPO_ANPOIS,10);
		CreateInvItems(slf,ItPl_Mana_Herb_01,19);
		CreateInvItems(slf,ItPl_Mana_Herb_02,16);
		CreateInvItems(slf,ItPl_Mana_Herb_03,13);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItFo_Alcohol,5);
		Constantino_ItemsGiven_Chapter_5 = TRUE;
	};
};

