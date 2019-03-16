
var int Harad_ItemsGiven_Chapter_1;
var int Harad_ItemsGiven_Chapter_2;
var int Harad_ItemsGiven_Chapter_3;
var int Harad_ItemsGiven_Chapter_4;
var int Harad_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Harad(var C_Npc slf)
{
	if((Kapitel >= 1) && (Harad_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_IronStuck,2);
		CreateInvItems(slf,ItMw_1H_Mace_L_04,1);
		CreateInvItems(slf,ItMi_AnvilPliers,1);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Harad_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Harad_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItMi_IronStuck,2);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Harad_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Harad_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,400);
		CreateInvItems(slf,ItMi_IronStuck,2);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Harad_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Harad_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,600);
		CreateInvItems(slf,ItMi_IronStuck,1);
		CreateInvItems(slf,itmi_quicksilver,1);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Harad_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Harad_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,1000);
		CreateInvItems(slf,ItMi_IronStuck,2);
		CreateInvItems(slf,ItMi_AnvilPliers,2);
		Harad_ItemsGiven_Chapter_5 = TRUE;
	};
};