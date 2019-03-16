
var int gornabar_itemsgiven_chapter_1;
var int gornabar_itemsgiven_chapter_2;
var int gornabar_itemsgiven_chapter_3;
var int gornabar_itemsgiven_chapter_4;
var int gornabar_itemsgiven_chapter_5;

func void b_givetradeinv_gornabar(var C_Npc slf)
{
	if((Kapitel >= 1) && (GORNABAR_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,itwr_map_oldworld_forest_1,1);
		CreateInvItems(slf,ItSc_Sleep,2);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,itsc_trfmeatbug,2);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Mana_02,1);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Health_02,1);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItSc_Light,2);
		CreateInvItems(slf,ItSc_TrfShadowbeast,1);
		CreateInvItems(slf,ItMw_Zweihaender2,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,1);
		CreateInvItems(slf,ItAt_CrawlerPlate,2);
		GORNABAR_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (GORNABAR_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Health_01,7);
		CreateInvItems(slf,ItPo_Health_02,3);
		CreateInvItems(slf,ItPo_Mana_01,7);
		CreateInvItems(slf,ItPo_Mana_02,3);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItSc_SumWolf,2);
		CreateInvItems(slf,ItSc_HarmUndead,1);
		CreateInvItems(slf,ItSc_Light,2);
		CreateInvItems(slf,ItSc_TrfShadowbeast,2);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItSc_Sleep,2);
		CreateInvItems(slf,ItMiSwordraw,3);
		GORNABAR_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (GORNABAR_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,itsc_trfmeatbug,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,3);
		CreateInvItems(slf,ItPo_Health_02,10);
		CreateInvItems(slf,ItPo_Health_03,7);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,7);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItSc_MediumHeal,2);
		CreateInvItems(slf,ItSc_TrfShadowbeast,2);
		CreateInvItems(slf,ItMiSwordraw,2);
		GORNABAR_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (GORNABAR_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPl_Speed_Herb_01,3);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,15);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItSc_TrfShadowbeast,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		GORNABAR_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (GORNABAR_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItAt_TrollTooth,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,3);
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,15);
		CreateInvItems(slf,ItPo_Mana_01,20);
		CreateInvItems(slf,ItPo_Mana_02,15);
		CreateInvItems(slf,ItSc_FullHeal,3);
		CreateInvItems(slf,ItSc_TrfShadowbeast,1);
		GORNABAR_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

var int gornakosh_itemsgiven_chapter_1;
var int gornakosh_itemsgiven_chapter_2;
var int gornakosh_itemsgiven_chapter_3;
var int gornakosh_itemsgiven_chapter_4;
var int gornakosh_itemsgiven_chapter_5;

func void b_givetradeinv_gornakosh(var C_Npc slf)
{
	if((Kapitel >= 1) && (gornakosh_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Mana_02,1);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Health_02,1);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItMw_Zweihaender2,1);
		gornakosh_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (gornakosh_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Health_01,7);
		CreateInvItems(slf,ItPo_Health_02,3);
		CreateInvItems(slf,ItPo_Mana_01,7);
		CreateInvItems(slf,ItPo_Mana_02,3);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItMiSwordraw,3);
		gornakosh_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (gornakosh_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Health_02,10);
		CreateInvItems(slf,ItPo_Health_03,7);
		CreateInvItems(slf,ItPo_Mana_01,10);
		CreateInvItems(slf,ItPo_Mana_02,7);
		CreateInvItems(slf,ItPo_Health_Addon_04,1);
		CreateInvItems(slf,ItPo_Mana_Addon_04,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		gornakosh_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (gornakosh_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,15);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,itpo_stamina,5);
		CreateInvItems(slf,ItMiSwordraw,2);
		gornakosh_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (gornakosh_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItPo_Health_02,20);
		CreateInvItems(slf,ItPo_Health_03,15);
		CreateInvItems(slf,ItPo_Mana_01,20);
		CreateInvItems(slf,ItPo_Mana_02,15);
		gornakosh_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};