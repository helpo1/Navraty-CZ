
var int neoras_itemsgiven_chapter_1;
var int neoras_itemsgiven_chapter_2;
var int neoras_itemsgiven_chapter_3;
var int neoras_itemsgiven_chapter_4;
var int neoras_itemsgiven_chapter_5;

func void b_givetradeinv_neoras(var C_Npc slf)
{
	if((Kapitel >= 1) && (NEORAS_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItPl_Blueplant,15);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_01,80);
		CreateInvItems(slf,ItPo_Mana_02,50);
		CreateInvItems(slf,ITPO_ANPOIS,5);
		CreateInvItems(slf,ItMi_Quartz,5);
		CreateInvItems(slf,ItSc_Firestorm,1);
		CreateInvItems(slf,ItMi_Flask,60);
		CreateInvItems(slf,ItWr_Druid_01,1);
		CreateInvItems(slf,itmi_plazma,1);
		NEORAS_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (NEORAS_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItPl_Blueplant,15);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_01,100);
		CreateInvItems(slf,ItPo_Mana_02,100);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,ItMi_Flask,30);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_Firestorm,1);
		NEORAS_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (NEORAS_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItPl_Blueplant,15);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_03,50);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItMi_Flask,30);
		CreateInvItems(slf,ItPo_Mana_01,80);
		CreateInvItems(slf,ItPo_Mana_02,50);
		NEORAS_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (NEORAS_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItPl_Blueplant,15);
		CreateInvItems(slf,ItFo_Alcohol,10);
		CreateInvItems(slf,ItPo_Mana_03,30);
		CreateInvItems(slf,ItMi_Flask,30);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		NEORAS_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
};