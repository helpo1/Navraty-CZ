
var int xardas_itemsgiven_chapter_1;
var int xardas_itemsgiven_chapter_2;
var int xardas_itemsgiven_chapter_3;
var int xardas_itemsgiven_chapter_4;
var int xardas_itemsgiven_chapter_5;

func void b_givetradeinv_xardas(var C_Npc slf)
{
	if((Kapitel >= 1) && (XARDAS_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itwr_addon_runemaking_dmt_circ1,1);
		CreateInvItems(slf,itwr_addon_runemaking_dmt_circ2,1);
		CreateInvItems(slf,itwr_addon_runemaking_dmt_circ3,1);
		CreateInvItems(slf,itwr_addon_runemaking_dmt_circ4,1);
		CreateInvItems(slf,itwr_addon_runemaking_dmt_circ5,1);
		CreateInvItems(slf,itwr_addon_runemaking_dmt_circ6,1);
		CreateInvItems(slf,ItMi_RuneBlank,5);
		CreateInvItems(slf,ItSc_SumGobSkel,5);
		CreateInvItems(slf,ItSc_SumSkel,2);
		CreateInvItems(slf,itsc_deathbolt,3);
		CreateInvItems(slf,ItSc_ManaForLife,3);
		CreateInvItems(slf,itsc_sumzombie,2);
		CreateInvItems(slf,ItSc_Rage,2);
		CreateInvItems(slf,ItSc_Lacerate,1);
		CreateInvItems(slf,machtvolle_kunst,1);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItBE_Addon_NOV_01,1);
		CreateInvItems(slf,ItMi_Flask,50);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItSc_Ressurect,10);
		XARDAS_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (XARDAS_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_SumDemon,2);
		CreateInvItems(slf,itsc_swarm,2);
		CreateInvItems(slf,ItSc_Lacerate,2);
		CreateInvItems(slf,ItSc_Rage,1);
		CreateInvItems(slf,itsc_energyball,2);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItBE_Addon_KDF_01,1);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItSc_Ressurect,1);
		XARDAS_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (XARDAS_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,3);
		CreateInvItems(slf,ItSc_ArmyOfDarkness,3);
		CreateInvItems(slf,itsc_deathball,1);
		CreateInvItems(slf,itsc_energyball,2);
		CreateInvItems(slf,ItSc_Rage,1);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItPo_Mana_02,10);
		CreateInvItems(slf,ItBE_Addon_KDF_02,1);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItSc_Ressurect,1);
		XARDAS_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (XARDAS_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,5);
		CreateInvItems(slf,ItSc_SumGobSkel,5);
		CreateInvItems(slf,ItSc_SumSkel,2);
		CreateInvItems(slf,ItSc_SumDemon,5);
		CreateInvItems(slf,ItSc_Lacerate,1);
		CreateInvItems(slf,ItSc_ArmyOfDarkness,3);
		CreateInvItems(slf,itsc_deathbolt,5);
		CreateInvItems(slf,ItSc_ManaForLife,3);
		CreateInvItems(slf,itsc_sumzombie,2);
		CreateInvItems(slf,itsc_swarm,2);
		CreateInvItems(slf,itsc_energyball,2);
		CreateInvItems(slf,itsc_deathball,3);
		CreateInvItems(slf,ItMi_RuneBlank,2);
		CreateInvItems(slf,ItSc_MassDeath,1);
		CreateInvItems(slf,itsc_skull,1);
		CreateInvItems(slf,ItMi_Skull,1);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItAt_DemonHeart,1);
		CreateInvItems(slf,ItAt_WaranFiretongue,1);
		CreateInvItems(slf,ItPo_Mana_02,20);
		CreateInvItems(slf,ItBE_Addon_KDF_03,1);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItSc_Ressurect,1);
		XARDAS_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (XARDAS_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_RuneBlank,5);
		CreateInvItems(slf,ItSc_SumGobSkel,5);
		CreateInvItems(slf,ItSc_SumSkel,2);
		CreateInvItems(slf,ItSc_SumDemon,5);
		CreateInvItems(slf,ItSc_ArmyOfDarkness,3);
		CreateInvItems(slf,itsc_deathbolt,5);
		CreateInvItems(slf,ItSc_ManaForLife,3);
		CreateInvItems(slf,itsc_sumzombie,2);
		CreateInvItems(slf,itsc_swarm,2);
		CreateInvItems(slf,itsc_energyball,2);
		CreateInvItems(slf,itsc_deathball,1);
		CreateInvItems(slf,ItSc_MassDeath,1);
		CreateInvItems(slf,itsc_skull,1);
		CreateInvItems(slf,ITWR_MAGICPAPER,5);
		CreateInvItems(slf,ItSc_Ressurect,1);
		XARDAS_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};