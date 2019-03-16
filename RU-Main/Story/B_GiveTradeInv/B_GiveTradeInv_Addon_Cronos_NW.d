
var int Cronos_NW_ItemsGiven_Chapter_1;

func void B_GiveTradeInv_Addon_Cronos_NW(var C_Npc slf)
{
	if((Kapitel >= 1) && (Cronos_NW_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Health_01,6);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItSc_Zap,15);
		CreateInvItems(slf,ItSc_LightHeal,5);
		CreateInvItems(slf,itsc_sumshoal,1);
		CreateInvItems(slf,ItSc_Icelance,5);
		CreateInvItems(slf,ItBE_Addon_NOV_01,1);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItSc_Ressurect,5);
		Cronos_NW_ItemsGiven_Chapter_1 = TRUE;
	};
};

