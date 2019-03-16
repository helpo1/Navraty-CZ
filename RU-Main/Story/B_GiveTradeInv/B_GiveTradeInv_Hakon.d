
var int Hakon_ItemsGiven_Chapter_1;
var int Hakon_ItemsGiven_Chapter_2;
var int Hakon_ItemsGiven_Chapter_3;
var int Hakon_ItemsGiven_Chapter_4;
var int Hakon_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Hakon(var C_Npc slf)
{
	if((Kapitel >= 1) && (Hakon_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);

		CreateInvItems(slf,ItMw_Iron_Dagger,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Dagger,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(slf,ItMw_1H_Sword_L_03,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(slf,ItMw_ShortSword2,1);
		CreateInvItems(slf,ItMw_ShortSword3,1);
		CreateInvItems(slf,ItMw_2H_OldSword,1);
		CreateInvItems(slf,ItMw_2H_Warhammer_Iron,1);
		CreateInvItems(slf,ItMw_Schwert,1);
		CreateInvItems(slf,ItMw_Halleberde_Old,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItAm_Prot_Edge_01,1);
		CreateInvItems(slf,ItBg_Weapon,1);
		Hakon_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Hakon_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMiSwordraw,3);
		Hakon_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Hakon_ItemsGiven_Chapter_3 == FALSE))
	{

		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMiSwordraw,4);
		Hakon_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Hakon_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMiSwordraw,5);
		Hakon_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Hakon_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		Hakon_ItemsGiven_Chapter_5 = TRUE;
	};
};