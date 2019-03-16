
var int Isgaroth_ItemsGiven_Chapter_1;
var int Isgaroth_ItemsGiven_Chapter_2;
var int Isgaroth_ItemsGiven_Chapter_3;
var int Isgaroth_ItemsGiven_Chapter_4;
var int Isgaroth_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Isgaroth(var C_Npc slf)
{
	if((Kapitel >= 1) && (Isgaroth_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItSc_Light,5);
		CreateInvItems(slf,ItSc_Firebolt,15);
		CreateInvItems(slf,ItSc_LightHeal,5);
		CreateInvItems(slf,ItSc_Firestorm,2);
		CreateInvItems(slf,ItRi_Hp_Mana_01,1);
		CreateInvItems(slf,ItMi_HolyWater,2);
		CreateInvItems(slf,wahre_macht,1);
		CreateInvItems(slf,ItBE_Addon_NOV_01,1);
		CreateInvItems(slf,lehren_der_goetter1,1);
		CreateInvItems(slf,ItSc_Ressurect,10);
		CreateInvItems(slf,ItBg_Mage,1);
		Isgaroth_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Isgaroth_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItMi_Quartz,3);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_01,7);
		CreateInvItems(slf,ItPo_Health_02,2);
		CreateInvItems(slf,ItMi_HolyWater,3);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItSc_InstantFireball,15);
		CreateInvItems(slf,ItSc_Firestorm,3);
		CreateInvItems(slf,ItBE_Addon_KDF_01,1);
		Isgaroth_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Isgaroth_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Sulfur,4);
		CreateInvItems(slf,ItSc_Sleep,1);
		CreateInvItems(slf,ItMi_Quartz,5);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItPo_Health_02,9);
		CreateInvItems(slf,ItPo_Health_03,6);
		CreateInvItems(slf,ItPo_Mana_01,15);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItMi_HolyWater,4);
		CreateInvItems(slf,ItSc_MediumHeal,5);
		CreateInvItems(slf,ItSc_Firestorm,5);
		CreateInvItems(slf,ItBE_Addon_KDF_02,1);
		Isgaroth_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Isgaroth_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItMi_Quartz,6);
		CreateInvItems(slf,ItMi_Rockcrystal,3);
		CreateInvItems(slf,ItMi_Coal,4);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,25);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItPo_Mana_02,15);
		CreateInvItems(slf,ItSc_Firerain,1);
		CreateInvItems(slf,ItSc_ChargeFireBall,2);
		CreateInvItems(slf,ItAm_Mana_01,1);
		CreateInvItems(slf,ItBE_Addon_KDF_03,1);
		CreateInvItems(slf,itwr_firelight,1);
		Isgaroth_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Isgaroth_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItMi_Sulfur,6);
		CreateInvItems(slf,ItMi_Quartz,4);
		CreateInvItems(slf,ItMi_Rockcrystal,6);
		CreateInvItems(slf,ItMi_Coal,3);
		CreateInvItems(slf,ItMi_Aquamarine,3);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_HolyWater,5);
		CreateInvItems(slf,ItMi_HolyWater,1);
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,15);
		CreateInvItems(slf,ItPo_Mana_01,50);
		CreateInvItems(slf,ItPo_Mana_02,30);
		CreateInvItems(slf,ItSc_FullHeal,3);
		CreateInvItems(slf,ItSc_Pyrokinesis,3);
		Isgaroth_ItemsGiven_Chapter_5 = TRUE;
	};
};

