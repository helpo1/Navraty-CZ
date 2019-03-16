
var int Sagitta_ItemsGiven_Chapter_1;
var int Sagitta_ItemsGiven_Chapter_2;
var int Sagitta_ItemsGiven_Chapter_3;
var int Sagitta_ItemsGiven_Chapter_4;
var int Sagitta_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Sagitta(var C_Npc slf)
{
	if((Kapitel >= 1) && (Sagitta_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPl_SwampHerb,9);
		CreateInvItems(slf,ItPl_Blueplant,10);
		CreateInvItems(slf,ItPl_Temp_Herb,5);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Health_Herb_02,20);
		CreateInvItems(slf,ItPl_Mana_Herb_01,15);
		CreateInvItems(slf,ItPl_Mana_Herb_02,20);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItMi_Joint,3);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,1);
		CreateInvItems(slf,ItMi_Flask,50);
		CreateInvItems(slf,ItPo_Mana_01,4);
		CreateInvItems(slf,ItPo_Mana_02,3);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItFo_Addon_Pfeffer_01,1);
		Sagitta_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Sagitta_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItPl_Blueplant,15);
		CreateInvItems(slf,ItPl_Temp_Herb,5);
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Flask,7);
		CreateInvItems(slf,ItPl_SwampHerb,7);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItMi_Joint,2);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Health_Herb_02,20);
		CreateInvItems(slf,ItPl_Mana_Herb_01,15);
		CreateInvItems(slf,ItPl_Mana_Herb_02,20);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ITPO_ANPOIS,15);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Mana_01,8);
		CreateInvItems(slf,ItPo_Mana_02,6);
		CreateInvItems(slf,ItPo_Health_01,1);
		Sagitta_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Sagitta_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPl_SwampHerb,7);
		CreateInvItems(slf,ItPl_Blueplant,20);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItMi_Joint,2);
		CreateInvItems(slf,ItMi_Flask,15);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItPl_Health_Herb_01,15);
		CreateInvItems(slf,ItPl_Health_Herb_02,20);
		CreateInvItems(slf,ItPl_Mana_Herb_01,15);
		CreateInvItems(slf,ItPl_Mana_Herb_02,20);
		CreateInvItems(slf,ItPl_Speed_Herb_01,3);
		CreateInvItems(slf,ITPO_ANPOIS,15);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,3);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,1);
		CreateInvItems(slf,ItPo_Health_02,13);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ItPo_Mana_01,16);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItPo_Mana_03,4);
		Sagitta_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Sagitta_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItPl_Blueplant,30);
		CreateInvItems(slf,ItPl_Temp_Herb,15);
		CreateInvItems(slf,ItPl_SwampHerb,8);
		CreateInvItems(slf,ItMi_Joint,2);
		CreateInvItems(slf,ItMi_Flask,25);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItMi_Quartz,4);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,4);
		CreateInvItems(slf,ItMi_Aquamarine,1);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ITPO_ANPOIS,15);
		CreateInvItems(slf,ItPl_Health_Herb_01,8);
		CreateInvItems(slf,ItPl_Health_Herb_02,6);
		CreateInvItems(slf,ItPl_Health_Herb_03,4);
		CreateInvItems(slf,ItPl_Mana_Herb_01,6);
		CreateInvItems(slf,ItPl_Mana_Herb_02,2);
		CreateInvItems(slf,ItPl_Speed_Herb_01,1);
		CreateInvItems(slf,ItPo_Health_02,6);
		CreateInvItems(slf,ItPo_Health_03,4);
		CreateInvItems(slf,ItPo_Mana_01,17);
		CreateInvItems(slf,ItPo_Mana_02,13);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		};
		Sagitta_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Sagitta_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPl_SwampHerb,9);
		CreateInvItems(slf,ItMi_Joint,2);
		CreateInvItems(slf,ItMi_Flask,50);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItMi_Quartz,5);
		CreateInvItems(slf,ItFo_Alcohol,3);
		CreateInvItems(slf,ItMi_Salt,10);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,2);
		CreateInvItems(slf,ItMi_Aquamarine,3);
		CreateInvItems(slf,ItPl_Blueplant,40);
		CreateInvItems(slf,ItPl_Temp_Herb,20);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ITPO_ANPOIS,15);
		CreateInvItems(slf,ItPl_Health_Herb_01,18);
		CreateInvItems(slf,ItPl_Health_Herb_02,12);
		CreateInvItems(slf,ItPl_Health_Herb_03,6);
		CreateInvItems(slf,ItPl_Mana_Herb_01,7);
		CreateInvItems(slf,ItPl_Mana_Herb_02,4);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Speed_Herb_01,1);
		CreateInvItems(slf,ItPo_Health_02,9);
		CreateInvItems(slf,ItPo_Health_03,7);
		CreateInvItems(slf,ItPo_Mana_01,19);
		CreateInvItems(slf,ItPo_Mana_02,12);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		Sagitta_ItemsGiven_Chapter_5 = TRUE;
	};
};