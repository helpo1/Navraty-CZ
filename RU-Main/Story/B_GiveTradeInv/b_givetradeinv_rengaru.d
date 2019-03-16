
var int rengaru_itemsgiven_chapter_1;
var int rengaru_itemsgiven_chapter_2;
var int rengaru_itemsgiven_chapter_3;
var int rengaru_itemsgiven_chapter_4;
var int rengaru_itemsgiven_chapter_5;

func void b_givetradeinv_rengaru(var C_Npc slf)
{
	if(RENGARU_ITEMSGIVEN_CHAPTER_1 == FALSE)
	{
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItKE_lockpick,50);
		CreateInvItems(slf,ItRi_Dex_01,1);
		CreateInvItems(slf,ItBe_Addon_DEX_5,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(slf,ItPl_Health_Herb_03,1);
		RENGARU_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (RENGARU_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,50);
		RENGARU_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (RENGARU_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,50);
		RENGARU_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (RENGARU_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,50);
		RENGARU_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (RENGARU_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,50);
		RENGARU_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

var int Thorben_itemsgiven_chapter_1;
var int Thorben_itemsgiven_chapter_2;
var int Thorben_itemsgiven_chapter_3;
var int Thorben_itemsgiven_chapter_4;
var int Thorben_itemsgiven_chapter_5;

func void b_givetradeinv_Thorben(var C_Npc slf)
{
	if(Thorben_ITEMSGIVEN_CHAPTER_1 == FALSE)
	{
		CreateInvItems(slf,ItKE_lockpick,20);
		CreateInvItems(slf,ItMi_JustTree,45);
		CreateInvItems(slf,ItMi_EveTree,30);
		CreateInvItems(slf,ItMi_VyzTree,35);
		CreateInvItems(slf,ItMi_YsuoTree,20);
		CreateInvItems(slf,ItMi_BokTree,15);
		CreateInvItems(slf,ItMi_Pliers,1);
		CreateInvItems(slf,ItMi_Pitch,30);
		CreateInvItems(slf,ItMi_Chopper,5);
		Thorben_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (Thorben_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,25);
		CreateInvItems(slf,ItMi_JustTree,25);
		CreateInvItems(slf,ItMi_EveTree,20);
		CreateInvItems(slf,ItMi_VyzTree,15);
		CreateInvItems(slf,ItMi_YsuoTree,10);
		CreateInvItems(slf,ItMi_BokTree,5);
		CreateInvItems(slf,ItMi_Pliers,1);
		CreateInvItems(slf,ItMi_Pitch,30);
		CreateInvItems(slf,ItMi_Chopper,5);
		Thorben_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (Thorben_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,30);
		CreateInvItems(slf,ItMi_JustTree,25);
		CreateInvItems(slf,ItMi_EveTree,20);
		CreateInvItems(slf,ItMi_VyzTree,15);
		CreateInvItems(slf,ItMi_YsuoTree,10);
		CreateInvItems(slf,ItMi_BokTree,5);
		CreateInvItems(slf,ItMi_Pliers,1);
		CreateInvItems(slf,ItMi_Pitch,30);
		CreateInvItems(slf,ItMi_Chopper,5);
		Thorben_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (Thorben_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,40);
		CreateInvItems(slf,ItMi_JustTree,25);
		CreateInvItems(slf,ItMi_EveTree,20);
		CreateInvItems(slf,ItMi_VyzTree,15);
		CreateInvItems(slf,ItMi_YsuoTree,10);
		CreateInvItems(slf,ItMi_BokTree,5);
		CreateInvItems(slf,ItMi_Pliers,1);
		CreateInvItems(slf,ItMi_Pitch,30);
		Thorben_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (Thorben_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItKE_lockpick,50);
		CreateInvItems(slf,ItMi_JustTree,25);
		CreateInvItems(slf,ItMi_EveTree,20);
		CreateInvItems(slf,ItMi_VyzTree,15);
		CreateInvItems(slf,ItMi_YsuoTree,10);
		CreateInvItems(slf,ItMi_BokTree,5);
		CreateInvItems(slf,ItMi_Pliers,1);
		CreateInvItems(slf,ItMi_Pitch,30);
		Thorben_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};