
var int Khaled_ItemsGiven_Chapter_1;
var int Khaled_ItemsGiven_Chapter_2;
var int Khaled_ItemsGiven_Chapter_3;
var int Khaled_ItemsGiven_Chapter_4;
var int Khaled_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Khaled(var C_Npc slf)
{
	if((Kapitel >= 1) && (Khaled_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_Schwert,1);
		CreateInvItems(slf,ItMw_Schwert3,1);
		CreateInvItems(slf,ItRw_Arrow,20);
		CreateInvItems(slf,ItRw_Bolt,20);
		Khaled_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Khaled_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,250);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		CreateInvItems(slf,ItMiSwordraw,2);
		Khaled_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Khaled_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,450);
		CreateInvItems(slf,ItRw_Arrow,40);
		CreateInvItems(slf,ItRw_Bolt,40);
		Khaled_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Khaled_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,700);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItBe_Addon_Prot_EDGE,1);
		CreateInvItems(slf,ItBe_Addon_Prot_EdgPoi,1);
		Khaled_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Khaled_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,1100);
		CreateInvItems(slf,ItRw_Arrow,100);
		CreateInvItems(slf,ItRw_Bolt,100);
		Khaled_ItemsGiven_Chapter_5 = TRUE;
	};
};