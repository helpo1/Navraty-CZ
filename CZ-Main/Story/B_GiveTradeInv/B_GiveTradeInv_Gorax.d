
var int Gorax_ItemsGiven_Chapter_1;
var int Gorax_ItemsGiven_Chapter_2;
var int Gorax_ItemsGiven_Chapter_3;
var int Gorax_ItemsGiven_Chapter_4;
var int Gorax_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Gorax(var C_Npc slf)
{
	if((Kapitel >= 1) && (Gorax_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Mana_02,1);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItSc_Light,5);
		CreateInvItems(slf,ItSc_Firebolt,15);
		CreateInvItems(slf,ItSc_LightHeal,5);
		CreateInvItems(slf,itwr_map_newworld_1,1);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItFo_Wine,3);
		CreateInvItems(slf,itfo_wineberrys,2);
		CreateInvItems(slf,ItBE_Addon_NOV_01,1);
		CreateInvItems(slf,ItRi_Mana_01,1);
		Gorax_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Gorax_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,itwr_firedef,1);
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItPo_Health_01,17);
		CreateInvItems(slf,ItPo_Health_02,3);
		CreateInvItems(slf,ItPo_Mana_01,14);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItSc_Firebolt,10);
		CreateInvItems(slf,ItSc_InstantFireball,10);
		CreateInvItems(slf,ItSc_SumWolf,5);
		CreateInvItems(slf,ItAm_Prot_Edge_01,1);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,itfo_wineberrys,1);
		CreateInvItems(slf,ItBE_Addon_KDF_01,1);
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC1,1);
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC2,1);
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC3,1);
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC4,1);
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC5,1);
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC6,1);
		};
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_MIL))
		{
			CreateInvItems(slf,itwr_map_shrine_mis_1,1);
		};
		Gorax_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Gorax_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,2);
		CreateInvItems(slf,ItAt_WaranFiretongue,1);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_02,9);
		CreateInvItems(slf,ItPo_Health_03,6);
		CreateInvItems(slf,ItPo_Mana_01,20);
		CreateInvItems(slf,ItPo_Mana_02,15);
		CreateInvItems(slf,ItPo_Mana_03,7);
		CreateInvItems(slf,ItSc_MagicCage,2);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,itpo_stamina,10);
		CreateInvItems(slf,ItSc_MediumHeal,5);
		CreateInvItems(slf,ItSc_Firestorm,4);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_Firerain,1);
		CreateInvItems(slf,itsc_sumfiregol,1);
		CreateInvItems(slf,ItSc_TrfWolf,1);
		CreateInvItems(slf,ItBE_Addon_KDF_02,1);
		CreateInvItems(slf,itwr_firelight,1);
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_MIL))
		{
			CreateInvItems(slf,itwr_map_shrine_mis_1,1);
		};
		CreateInvItems(slf,ItBe_Addon_Prot_MAGIC,1);
		Gorax_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Gorax_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItMi_Quartz,6);
		CreateInvItems(slf,ItMi_Rockcrystal,3);
		CreateInvItems(slf,ItMi_Coal,4);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Mana_02,20);
		CreateInvItems(slf,ItPo_Mana_03,7);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		CreateInvItems(slf,itpo_stamina,15);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_ChargeFireBall,3);
		CreateInvItems(slf,ItSc_Firerain,2);
		CreateInvItems(slf,itsc_sumfiregol,1);
		CreateInvItems(slf,ItSc_TrfWarg,1);
		Gorax_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Gorax_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItMi_Sulfur,6);
		CreateInvItems(slf,ItMi_Quartz,4);
		CreateInvItems(slf,ItMi_Rockcrystal,6);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Aquamarine,3);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_HolyWater,3);
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,15);
		CreateInvItems(slf,ItSc_Explosion,2);
		CreateInvItems(slf,ItPo_Mana_01,50);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItPo_Mana_02,40);
		CreateInvItems(slf,itpo_stamina,25);
		CreateInvItems(slf,ItSc_Pyrokinesis,5);
		CreateInvItems(slf,ItSc_FullHeal,3);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		Gorax_ItemsGiven_Chapter_5 = TRUE;
		CreateInvItems(slf,ItBE_Addon_KDF_03,1);
	};
};

