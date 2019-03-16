
var int Cronos_ADW_ItemsGiven_Chapter_1;
var int Cronos_ADW_ItemsGiven_Chapter_2;
var int Cronos_ADW_ItemsGiven_Chapter_3;
var int Cronos_ADW_ItemsGiven_Chapter_4;
var int Cronos_ADW_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Cronos_ADW(var C_Npc slf)
{
	if((Kapitel >= 2) && (Cronos_ADW_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,itwr_permintellect,1);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_01,17);
		CreateInvItems(slf,ItPo_Health_02,10);
		CreateInvItems(slf,ItPo_Mana_01,14);
		CreateInvItems(slf,ItPo_Mana_02,12);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItMi_Flask,35);
		CreateInvItems(slf,itwr_map_addonworld_1,1);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItSc_Zap,5);
		CreateInvItems(slf,itsc_sumshoal,2);
		CreateInvItems(slf,itsc_sumicegol,2);
		CreateInvItems(slf,ItSc_Icelance,15);
		CreateInvItems(slf,ItSc_Icebolt,15);
		CreateInvItems(slf,ItSc_Geyser,4);
		CreateInvItems(slf,ItSc_Thunderstorm,2);
		CreateInvItems(slf,ItSc_Waterfist,3);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItBE_Addon_KDF_01,1);
		CreateInvItems(slf,ItSc_Ressurect,10);
		Cronos_ADW_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Cronos_ADW_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,2);
		CreateInvItems(slf,ItAt_WaranFiretongue,1);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_02,9);
		CreateInvItems(slf,ItPo_Health_03,7);
		CreateInvItems(slf,ItPo_Mana_01,20);
		CreateInvItems(slf,ItPo_Mana_02,15);
		CreateInvItems(slf,ItPo_Mana_03,4);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,5);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItSc_ThunderBall,2);
		CreateInvItems(slf,ItSc_IceCube,5);
		CreateInvItems(slf,ItSc_IceWave,2);
		if(Npc_HasItems(slf,ItMi_Flask) <= 10)
		{
			CreateInvItems(slf,ItMi_Flask,25);
		}
		else
		{
			CreateInvItems(slf,ItMi_Flask,10);
		};
		CreateInvItems(slf,ItSc_Icelance,7);
		CreateInvItems(slf,ItSc_Geyser,2);
		CreateInvItems(slf,ItSc_Thunderstorm,2);
		CreateInvItems(slf,ItSc_Waterfist,1);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItSc_TrfGiantBug,1);
		CreateInvItems(slf,ItSc_TrfWolf,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		CreateInvItems(slf,itsc_sumshoal,1);
		CreateInvItems(slf,ItBE_Addon_KDF_02,1);
		Cronos_ADW_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Cronos_ADW_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItMi_Quartz,6);
		CreateInvItems(slf,ItMi_Rockcrystal,3);
		CreateInvItems(slf,ItMi_Coal,4);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		if(Npc_HasItems(slf,ItMi_Flask) <= 3)
		{
			CreateInvItems(slf,ItMi_Flask,25);
		}
		else
		{
			CreateInvItems(slf,ItMi_Flask,10);
		};
		CreateInvItems(slf,ItPo_Health_Addon_04,5);
		CreateInvItems(slf,ItPo_Mana_Addon_04,10);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Mana_02,20);
		CreateInvItems(slf,ItPo_Mana_03,10);
		CreateInvItems(slf,itpo_stamina,10);
		CreateInvItems(slf,ItSc_LightningFlash,3);
		CreateInvItems(slf,itsc_sumshoal,1);
		CreateInvItems(slf,itsc_sumicegol,2);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_TrfSnapper,1);
		CreateInvItems(slf,ItSc_TrfWarg,1);
		CreateInvItems(slf,ItSc_Icelance,3);
		CreateInvItems(slf,ItSc_Geyser,3);
		CreateInvItems(slf,ItSc_Thunderstorm,3);
		CreateInvItems(slf,ItSc_Waterfist,2);
		CreateInvItems(slf,ItBE_Addon_KDF_03,1);
		Cronos_ADW_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Cronos_ADW_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItMi_Sulfur,6);
		CreateInvItems(slf,ItMi_Quartz,4);
		CreateInvItems(slf,ItMi_Rockcrystal,6);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Aquamarine,3);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_HolyWater,3);
		if(Npc_HasItems(slf,ItMi_Flask) <= 3)
		{
			CreateInvItems(slf,ItMi_Flask,25);
		}
		else
		{
			CreateInvItems(slf,ItMi_Flask,10);
		};
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,15);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Mana_02,20);
		CreateInvItems(slf,ItPo_Mana_03,20);
		CreateInvItems(slf,itpo_stamina,15);
		CreateInvItems(slf,ItSc_IceWave,4);
		CreateInvItems(slf,itsc_sumshoal,1);
		CreateInvItems(slf,ItSc_Icelance,3);
		CreateInvItems(slf,ItSc_Geyser,3);
		CreateInvItems(slf,ItSc_Thunderstorm,3);
		CreateInvItems(slf,ItSc_Waterfist,3);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_TrfLurker,1);
		CreateInvItems(slf,ItSc_TrfDragonSnapper,1);
		Cronos_ADW_ItemsGiven_Chapter_5 = TRUE;
	};
};

