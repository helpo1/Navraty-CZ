
var int Sarah_ItemsGiven_Chapter_1;
var int Sarah_ItemsGiven_Chapter_2;
var int Sarah_ItemsGiven_Chapter_3;
var int Sarah_ItemsGiven_Chapter_4;
var int Sarah_ItemsGiven_Chapter_5;
var int sarah_itemsgiven_masterguild;

func void B_GiveTradeInv_Sarah(var C_Npc slf)
{
	if((Kapitel >= 1) && (Sarah_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMw_1h_Vlk_Dagger,1);
		CreateInvItems(slf,ItMi_MeetKnife,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(slf,ItMw_1H_Sword_L_03,1);
		CreateInvItems(slf,ItMw_2H_Axe_L_01,1);
		CreateInvItems(slf,ItMi_Pitch,5);
		CreateInvItems(slf,ItLsTorch,20);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRi_HP_01,1);
		CreateInvItems(slf,ItMi_Chopper,1);
		CreateInvItems(slf,ItRw_Bow_L_02,1);
		CreateInvItems(slf,ItMw_1H_Axe_WoodChoppin,1);
		Sarah_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Sarah_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,20);
		CreateInvItems(slf,ItLsTorch,5);
		Sarah_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Sarah_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,25);
		Sarah_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Sarah_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		Sarah_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Sarah_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		Sarah_ItemsGiven_Chapter_5 = TRUE;
	};
};

func void b_givetradeinv_sarah_guild(var C_Npc slf)
{
	if((MASTERTRADEGUILD == TRUE) && (SARAH_ITEMSGIVEN_MASTERGUILD == FALSE))
	{
		CreateInvItems(slf,ItRw_Bolt,40);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,itmiswordblade_1,3);
		CreateInvItems(slf,ItRi_Prot_Total_01,1);
		SARAH_ITEMSGIVEN_MASTERGUILD = TRUE;
	};
};