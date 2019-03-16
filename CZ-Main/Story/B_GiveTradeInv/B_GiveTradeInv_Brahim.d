
var int Brahim_ItemsGiven_Chapter_1;
var int Brahim_ItemsGiven_Chapter_2;
var int Brahim_ItemsGiven_Chapter_3;
var int Brahim_ItemsGiven_Chapter_4;
var int Brahim_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Brahim(var C_Npc slf)
{
	if((Kapitel >= 1) && (Brahim_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,itwr_map_newworld_city_1,1);
		CreateInvItems(slf,ItMi_Feder,3);
		Brahim_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Brahim_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,50);
		CreateInvItems(slf,itwr_map_newworld_1,1);
		Brahim_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Brahim_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,itwr_shatteredgolem_mis_1,1);
		CreateInvItems(slf,itwr_map_newworld_1,1);
		CreateInvItems(slf,itwr_map_oldworld_1,1);
		CreateInvItems(slf,ItMi_Gold,50);
		Brahim_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Brahim_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,itwr_map_caves_mis_1,1);
		Brahim_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Brahim_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		Brahim_ItemsGiven_Chapter_5 = TRUE;
	};
};

