
var int Garett_ItemsGiven_Chapter_1;
var int Garett_ItemsGiven_Chapter_2;
var int Garett_ItemsGiven_Chapter_3;
var int Garett_ItemsGiven_Chapter_4;
var int Garett_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Garett(var C_Npc slf)
{
	if((Kapitel >= 1) && (Garett_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,10);
		CreateInvItems(slf,ItFo_Addon_Rum,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItMw_2H_Axe_L_01,1);
		CreateInvItems(slf,ItMw_OldPiratensaebel,1);
		CreateInvItems(slf,ItMw_Piratensaebel,1);
		CreateInvItems(slf,ItMW_Addon_Hacker_1h_01,1);
		CreateInvItems(slf,ItMW_Addon_Hacker_1h_02,1);
		CreateInvItems(slf,ItMW_Addon_Hacker_2h_01,1);
		CreateInvItems(slf,ItMW_Addon_Hacker_2h_02,1);
		CreateInvItems(slf,ItMw_Addon_PIR1hAxe,1);
		CreateInvItems(slf,ItMw_Addon_PIR1hSword,1);
		CreateInvItems(slf,ItMw_Addon_PIR2hAxe,1);
		CreateInvItems(slf,ItMw_Addon_PIR2hSword,1);
		CreateInvItems(slf,ItMw_Schiffsaxt,1);
		Garett_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Garett_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItMi_Joint,1);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		Garett_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Garett_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		Garett_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Garett_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		Garett_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Garett_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		Garett_ItemsGiven_Chapter_5 = TRUE;
	};
};