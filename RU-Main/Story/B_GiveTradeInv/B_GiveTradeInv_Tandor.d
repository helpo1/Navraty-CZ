
var int Tandor_ItemsGiven_Chapter_1;
var int Tandor_ItemsGiven_Chapter_2;
var int Tandor_ItemsGiven_Chapter_3;
var int Tandor_ItemsGiven_Chapter_4;
var int Tandor_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Tandor(var C_Npc slf)
{
	if((Kapitel >= 1) && (Tandor_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,80);
		CreateInvItems(slf,ItRw_Bolt,25);
		CreateInvItems(slf,ItMw_1h_Pal_Sword,1);
		CreateInvItems(slf,ItMw_2h_Pal_Sword,1);
		CreateInvItems(slf,ItRw_Crossbow_L_01,1);
		CreateInvItems(slf,ItRw_Crossbow_L_02,1);
		CreateInvItems(slf,ItRw_Crossbow_M_02,1);
		CreateInvItems(slf,ItRw_Crossbow_H_01,1);
		CreateInvItems(slf,ItAm_Prot_Total_01,1);
		CreateInvItems(slf,ITWR_CBOW_T2,1);
		CreateInvItems(slf,ItRi_Prot_Fire_02,1);
		CreateInvItems(slf,ItBe_Addon_STR_10,1);
		CreateInvItems(slf,ItBe_Addon_Prot_FIRE,1);
		Tandor_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Tandor_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Tandor_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Tandor_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Tandor_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Tandor_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Tandor_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Tandor_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Tandor_ItemsGiven_Chapter_5 = TRUE;
	};
};