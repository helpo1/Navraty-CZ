
var int Canthar_ItemsGiven_Chapter_1;
var int Canthar_ItemsGiven_Chapter_2;
var int Canthar_ItemsGiven_Chapter_3;
var int Canthar_ItemsGiven_Chapter_4;
var int Canthar_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Canthar(var C_Npc slf)
{
	if((Kapitel >= 0) && (Canthar_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPl_Beet,10);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItMi_Pan,1);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,ItMi_Saw,1);
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItMw_1h_Vlk_Dagger,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(slf,ItAm_Prot_Mage_01,1);
		CreateInvItems(slf,ItMi_Pitch,5);
		CreateInvItems(slf,ItBe_Addon_STR_5,1);
		CreateInvItems(slf,ItRw_Arrow,20);
		CreateInvItems(slf,ItBg_Trash,1);
		CreateInvItems(slf,ItMi_Chopper,1);
		CreateInvItems(slf,ItMw_1H_Axe_WoodChoppin,1);
		Canthar_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Canthar_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,30);
		Canthar_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Canthar_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,40);
		Canthar_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Canthar_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItRw_Arrow,50);
		Canthar_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Canthar_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		Canthar_ItemsGiven_Chapter_5 = TRUE;
	};
};

