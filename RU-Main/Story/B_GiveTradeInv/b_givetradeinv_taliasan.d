
var int taliasan_itemsgiven_chapter_1;
var int taliasan_itemsgiven_chapter_2;
var int taliasan_itemsgiven_chapter_3;
var int taliasan_itemsgiven_chapter_4;

func void b_givetradeinv_taliasan(var C_Npc slf)
{
	if((Kapitel >= 1) && (TALIASAN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itwr_addon_runemaking_prm,1);
		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItSc_HarmUndead,1);
		CreateInvItems(slf,goettergabe,1);
		CreateInvItems(slf,geheimnisse_der_zauberei,1);
		CreateInvItems(slf,itwr_magicpaper,5);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItSc_Ressurect,1);
		TALIASAN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (TALIASAN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_Light,2);
		CreateInvItems(slf,ItSc_LightHeal,2);
		CreateInvItems(slf,ItSc_MediumHeal,2);
		CreateInvItems(slf,itwr_magicpaper,5);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_SumWolf,2);
		CreateInvItems(slf,ItPo_Mana_02,10);
		TALIASAN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (TALIASAN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_FullHeal,2);
		CreateInvItems(slf,itwr_magicpaper,5);
		CreateInvItems(slf,ItSc_HarmUndead,3);
		TALIASAN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (TALIASAN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItSc_Light,1);
		CreateInvItems(slf,ItSc_LightHeal,2);
		CreateInvItems(slf,ItSc_MediumHeal,2);
		CreateInvItems(slf,ItSc_SumWolf,2);
		CreateInvItems(slf,itwr_magicpaper,5);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_FullHeal,2);
		TALIASAN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
};

