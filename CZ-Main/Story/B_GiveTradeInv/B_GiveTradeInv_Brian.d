
var int Brian_ItemsGiven_Chapter_1;
var int Brian_ItemsGiven_Chapter_2;
var int Brian_ItemsGiven_Chapter_3;
var int Brian_ItemsGiven_Chapter_4;
var int Brian_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Brian(var C_Npc slf)
{
	if((Kapitel >= 1) && (Brian_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItMw_1H_Mace_L_04,2);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		CreateInvItems(slf,ItMw_Iron_Dagger,1);
		Brian_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Brian_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Brian_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Brian_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItMiSwordraw,4);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Brian_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Brian_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItMiSwordraw,5);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Brian_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Brian_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,40);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Brian_ItemsGiven_Chapter_5 = TRUE;
	};
};

