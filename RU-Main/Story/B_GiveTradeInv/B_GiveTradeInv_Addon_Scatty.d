
var int Scatty_ItemsGiven_Chapter_1;
var int Scatty_ItemsGiven_Chapter_2;
var int Scatty_ItemsGiven_Chapter_3;
var int Scatty_ItemsGiven_Chapter_4;
var int Scatty_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Scatty(var C_Npc slf)
{
	if((Kapitel >= 1) && (Scatty_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Addon_Pfeffer_01,1);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItMi_Pitch,5);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItMw_Schwert2,1);
		CreateInvItems(slf,ItMw_Zweihaender1,1);
		CreateInvItems(slf,ItRw_Crossbow_L_02,1);
		CreateInvItems(slf,ItMw_Doppelaxt,1);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Scatty_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Scatty_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItMiSwordraw,3);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		Scatty_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Scatty_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItMiSwordraw,3);
		Scatty_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Scatty_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		Scatty_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Scatty_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMw_2H_Axe_L_01,2);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Bread,5);
		CreateInvItems(slf,ItFo_Water,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		Scatty_ItemsGiven_Chapter_5 = TRUE;
	};
};

var int Farim_ItemsGiven_Chapter_1;
var int Farim_ItemsGiven_Chapter_2;
var int Farim_ItemsGiven_Chapter_3;
var int Farim_ItemsGiven_Chapter_4;
var int Farim_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Farim(var C_Npc slf)
{
	if((Kapitel >= 1) && (Farim_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Fish,5);
		CreateInvItems(slf,ItMi_Addon_Shell_01,7);
		CreateInvItems(slf,ItMi_Addon_Shell_02,3);
		CreateInvItems(slf,ItMi_Angel,1);
		Farim_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Farim_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Fish,10);
		CreateInvItems(slf,ItMi_Addon_Shell_01,2);
		CreateInvItems(slf,ItMi_Addon_Shell_02,4);
		CreateInvItems(slf,ItMi_Addon_WhitePearl,1);
		Farim_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Farim_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Fish,15);
		CreateInvItems(slf,ItMi_Addon_Shell_01,3);
		CreateInvItems(slf,ItMi_Addon_Shell_02,1);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		Farim_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Farim_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Fish,20);
		CreateInvItems(slf,ItMi_Addon_Shell_01,2);
		CreateInvItems(slf,ItMi_Addon_Shell_02,2);
		Farim_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Farim_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Fish,25);
		CreateInvItems(slf,ItMi_Addon_Shell_01,3);
		CreateInvItems(slf,ItMi_Addon_Shell_02,3);
		Farim_ItemsGiven_Chapter_5 = TRUE;
	};
};