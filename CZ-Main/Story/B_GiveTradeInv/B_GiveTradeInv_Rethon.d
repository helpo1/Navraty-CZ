
var int Rethon_ItemsGiven_Chapter_1;
var int Rethon_ItemsGiven_Chapter_2;
var int Rethon_ItemsGiven_Chapter_3;
var int Rethon_ItemsGiven_Chapter_4;
var int Rethon_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Rethon(var C_Npc slf)
{
	if(Rethon_ItemsGiven_Chapter_4 == FALSE)
	{
		CreateInvItems(slf,ItMw_Kriegshammer2,1);
		CreateInvItems(slf,ItMw_Zweihaender4,1);
		CreateInvItems(slf,ItMw_Streitaxt2,1);
		CreateInvItems(slf,ItMw_Spicker,1);
		CreateInvItems(slf,ItRw_Crossbow_H_02,1);
		Rethon_ItemsGiven_Chapter_4 = TRUE;
	};
};

