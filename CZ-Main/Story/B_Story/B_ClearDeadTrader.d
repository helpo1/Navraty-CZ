/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(3x) ITMW_1H_CREST (cyrilice -> latinka)

*/



func void B_ClearDeadTrader(var C_Npc Trader)
{
	if(Npc_HasItems(Trader,ItAt_Addon_BCKopf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Addon_BCKopf,Npc_HasItems(Trader,ItAt_Addon_BCKopf));
	};
	if(Npc_HasItems(Trader,ItAt_Meatbugflesh) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Meatbugflesh,Npc_HasItems(Trader,ItAt_Meatbugflesh));
	};
	if(Npc_HasItems(Trader,ItAt_SheepFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SheepFur,Npc_HasItems(Trader,ItAt_SheepFur));
	};
	if(Npc_HasItems(Trader,ItAt_RabbitFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_RabbitFur,Npc_HasItems(Trader,ItAt_RabbitFur));
	};
	if(Npc_HasItems(Trader,ItAt_WolfFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WolfFur,Npc_HasItems(Trader,ItAt_WolfFur));
	};
	if(Npc_HasItems(Trader,ItAt_IceWolfFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_IceWolfFur,Npc_HasItems(Trader,ItAt_IceWolfFur));
	};
	if(Npc_HasItems(Trader,ItAt_WhitePuma) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WhitePuma,Npc_HasItems(Trader,ItAt_WhitePuma));
	};
	if(Npc_HasItems(Trader,ItAt_WhiteTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WhiteTroll,Npc_HasItems(Trader,ItAt_WhiteTroll));
	};
	if(Npc_HasItems(Trader,ItAt_BugMandibles) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BugMandibles,Npc_HasItems(Trader,ItAt_BugMandibles));
	};
	if(Npc_HasItems(Trader,ItAt_Claw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Claw,Npc_HasItems(Trader,ItAt_Claw));
	};
	if(Npc_HasItems(Trader,ItAt_OreBugClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_OreBugClaw,Npc_HasItems(Trader,ItAt_OreBugClaw));
	};
	if(Npc_HasItems(Trader,ItAt_LurkerClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_LurkerClaw,Npc_HasItems(Trader,ItAt_LurkerClaw));
	};
	if(Npc_HasItems(Trader,ItAt_Teeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Teeth,Npc_HasItems(Trader,ItAt_Teeth));
	};
	if(Npc_HasItems(Trader,ItAt_CrawlerMandibles) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CrawlerMandibles,Npc_HasItems(Trader,ItAt_CrawlerMandibles));
	};
	if(Npc_HasItems(Trader,ItAt_SpiderMandibles) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SpiderMandibles,Npc_HasItems(Trader,ItAt_SpiderMandibles));	
	};
	if(Npc_HasItems(Trader,ItAt_Wing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Wing,Npc_HasItems(Trader,ItAt_Wing));
	};
	if(Npc_HasItems(Trader,ItAt_Sting) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Sting,Npc_HasItems(Trader,ItAt_Sting));
	};
	if(Npc_HasItems(Trader,itat_LurkerSkin) > 0)
	{
		Npc_RemoveInvItems(Trader,itat_LurkerSkin,Npc_HasItems(Trader,itat_LurkerSkin));
	};
	if(Npc_HasItems(Trader,ItAt_WargFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WargFur,Npc_HasItems(Trader,ItAt_WargFur));
	};
	if(Npc_HasItems(Trader,ItAt_OrcDogFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_OrcDogFur,Npc_HasItems(Trader,ItAt_OrcDogFur));
	};
	if(Npc_HasItems(Trader,ItAt_Addon_KeilerFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Addon_KeilerFur,Npc_HasItems(Trader,ItAt_Addon_KeilerFur));
	};
	if(Npc_HasItems(Trader,ItAt_DrgSnapperHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DrgSnapperHorn,Npc_HasItems(Trader,ItAt_DrgSnapperHorn));
	};
	if(Npc_HasItems(Trader,ItAt_CrawlerPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CrawlerPlate,Npc_HasItems(Trader,ItAt_CrawlerPlate));
	};
	if(Npc_HasItems(Trader,ItAt_ShadowFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ShadowFur,Npc_HasItems(Trader,ItAt_ShadowFur));
	};
	if(Npc_HasItems(Trader,ItAt_SharkSkin) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SharkSkin,Npc_HasItems(Trader,ItAt_SharkSkin));
	};
	if(Npc_HasItems(Trader,ItAt_TrollFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollFur,Npc_HasItems(Trader,ItAt_TrollFur));
	};
	if(Npc_HasItems(Trader,ItAt_TrollBlackFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollBlackFur,Npc_HasItems(Trader,ItAt_TrollBlackFur));
	};
	if(Npc_HasItems(Trader,ItAt_CaveBlackFurTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CaveBlackFurTroll,Npc_HasItems(Trader,ItAt_CaveBlackFurTroll));
	};
	if(Npc_HasItems(Trader,ItAt_WaranFiretongue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WaranFiretongue,Npc_HasItems(Trader,ItAt_WaranFiretongue));
	};
	if(Npc_HasItems(Trader,ItAt_TrollPoisonTongue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollPoisonTongue,Npc_HasItems(Trader,ItAt_TrollPoisonTongue));
	};
	if(Npc_HasItems(Trader,ItAt_ShadowHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ShadowHorn,Npc_HasItems(Trader,ItAt_ShadowHorn));
	};
	if(Npc_HasItems(Trader,ItAt_SharkTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SharkTeeth,Npc_HasItems(Trader,ItAt_SharkTeeth));
	};
	if(Npc_HasItems(Trader,ItAt_DesertSharkTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DesertSharkTeeth,Npc_HasItems(Trader,ItAt_DesertSharkTeeth));
	};
	if(Npc_HasItems(Trader,ItAt_TrollTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollTooth,Npc_HasItems(Trader,ItAt_TrollTooth));
	};
	if(Npc_HasItems(Trader,ItAt_StoneGolemHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_StoneGolemHeart,Npc_HasItems(Trader,ItAt_StoneGolemHeart));
	};
	if(Npc_HasItems(Trader,ItAt_FireGolemHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_FireGolemHeart,Npc_HasItems(Trader,ItAt_FireGolemHeart));
	};
	if(Npc_HasItems(Trader,ItAt_IceGolemHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_IceGolemHeart,Npc_HasItems(Trader,ItAt_IceGolemHeart));
	};
	if(Npc_HasItems(Trader,ITAT_SWAMPGOLEMHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SWAMPGOLEMHEART,Npc_HasItems(Trader,ITAT_SWAMPGOLEMHEART));
	};
	if(Npc_HasItems(Trader,ItAt_GoblinBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_GoblinBone,Npc_HasItems(Trader,ItAt_GoblinBone));
	};
	if(Npc_HasItems(Trader,ItAt_SkeletonBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SkeletonBone,Npc_HasItems(Trader,ItAt_SkeletonBone));
	};
	if(Npc_HasItems(Trader,ItAt_DragonBlood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonBlood,Npc_HasItems(Trader,ItAt_DragonBlood));
	};
	if(Npc_HasItems(Trader,ItAt_DragonScale) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonScale,Npc_HasItems(Trader,ItAt_DragonScale));
	};
	if(Npc_HasItems(Trader,ITAT_PUMAFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_PUMAFUR,Npc_HasItems(Trader,ITAT_PUMAFUR));
	};
	if(Npc_HasItems(Trader,ITAT_SLOKERSFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SLOKERSFUR,Npc_HasItems(Trader,ITAT_SLOKERSFUR));
	};
	if(Npc_HasItems(Trader,ITAT_CRAWLERQUEEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_CRAWLERQUEEN,Npc_HasItems(Trader,ITAT_CRAWLERQUEEN));
	};
	if(Npc_HasItems(Trader,ItAt_BlackSnapperLiver) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BlackSnapperLiver,Npc_HasItems(Trader,ItAt_BlackSnapperLiver));
	};
	if(Npc_HasItems(Trader,ITAT_MEATBUGFLESH_GEBRATEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_MEATBUGFLESH_GEBRATEN,Npc_HasItems(Trader,ITAT_MEATBUGFLESH_GEBRATEN));
	};
	if(Npc_HasItems(Trader,ITFO_FISH_GEBRATEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_FISH_GEBRATEN,Npc_HasItems(Trader,ITFO_FISH_GEBRATEN));
	};
	if(Npc_HasItems(Trader,ITFO_PILZSUPPE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_PILZSUPPE,Npc_HasItems(Trader,ITFO_PILZSUPPE));
	};
	if(Npc_HasItems(Trader,ITFO_FLEISCHWANZENRAGOUT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_FLEISCHWANZENRAGOUT,Npc_HasItems(Trader,ITFO_FLEISCHWANZENRAGOUT));
	};
	if(Npc_HasItems(Trader,ITAT_SHEEPGRIMGASH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SHEEPGRIMGASH,Npc_HasItems(Trader,ITAT_SHEEPGRIMGASH));
	};
	if(Npc_HasItems(Trader,ItAt_OlderHead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_OlderHead,Npc_HasItems(Trader,ItAt_OlderHead));
	};
	if(Npc_HasItems(Trader,ITAT_SKELETONBONEALEF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SKELETONBONEALEF,Npc_HasItems(Trader,ITAT_SKELETONBONEALEF));
	};
	if(Npc_HasItems(Trader,ItAt_DemonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DemonHeart,Npc_HasItems(Trader,ItAt_DemonHeart));
	};
	if(Npc_HasItems(Trader,ITAT_LUZIANHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_LUZIANHEART,Npc_HasItems(Trader,ITAT_LUZIANHEART));
	};
	if(Npc_HasItems(Trader,ItAt_UndeadDragonSoulStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_UndeadDragonSoulStone,Npc_HasItems(Trader,ItAt_UndeadDragonSoulStone));
	};
	if(Npc_HasItems(Trader,ItAt_IcedragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_IcedragonHeart,Npc_HasItems(Trader,ItAt_IcedragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_RockdragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_RockdragonHeart,Npc_HasItems(Trader,ItAt_RockdragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_SwampdragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SwampdragonHeart,Npc_HasItems(Trader,ItAt_SwampdragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_FiredragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_FiredragonHeart,Npc_HasItems(Trader,ItAt_FiredragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_DragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonHeart,Npc_HasItems(Trader,ItAt_DragonHeart));
	};
	if(Npc_HasItems(Trader,ITAT_REDDRAGONHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_REDDRAGONHEART,Npc_HasItems(Trader,ITAT_REDDRAGONHEART));
	};
	if(Npc_HasItems(Trader,ITAT_BLACKDRAGONHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_BLACKDRAGONHEART,Npc_HasItems(Trader,ITAT_BLACKDRAGONHEART));
	};
	if(Npc_HasItems(Trader,ItAt_UzdragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_UzdragonHeart,Npc_HasItems(Trader,ItAt_UzdragonHeart));
	};
	if(Npc_HasItems(Trader,ITAT_GOLDDRAGONHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_GOLDDRAGONHEART,Npc_HasItems(Trader,ITAT_GOLDDRAGONHEART));
	};
	if(Npc_HasItems(Trader,ItAt_SpiderEgg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SpiderEgg,Npc_HasItems(Trader,ItAt_SpiderEgg));
	};
	if(Npc_HasItems(Trader,ItAt_XtoneClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_XtoneClaw,Npc_HasItems(Trader,ItAt_XtoneClaw));
	};
	if(Npc_HasItems(Trader,ItUt_StoneClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_StoneClaw,Npc_HasItems(Trader,ItUt_StoneClaw));
	};
	if(Npc_HasItems(Trader,ItAt_DlackTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DlackTeeth,Npc_HasItems(Trader,ItAt_DlackTeeth));
	};
	if(Npc_HasItems(Trader,ItUt_BlackTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_BlackTeeth,Npc_HasItems(Trader,ItUt_BlackTeeth));
	};
	if(Npc_HasItems(Trader,ItAt_CurratIshi) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CurratIshi,Npc_HasItems(Trader,ItAt_CurratIshi));
	};
	if(Npc_HasItems(Trader,ItUt_IshiCurrat) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_IshiCurrat,Npc_HasItems(Trader,ItUt_IshiCurrat));
	};
	if(Npc_HasItems(Trader,ItAt_GturTrollHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_GturTrollHorn,Npc_HasItems(Trader,ItAt_GturTrollHorn));
	};
	if(Npc_HasItems(Trader,ItUt_UturTrollHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_UturTrollHorn,Npc_HasItems(Trader,ItUt_UturTrollHorn));
	};
	if(Npc_HasItems(Trader,ItAt_ZaracustPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ZaracustPlate,Npc_HasItems(Trader,ItAt_ZaracustPlate));
	};
	if(Npc_HasItems(Trader,ItUt_CaracustPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_CaracustPlate,Npc_HasItems(Trader,ItUt_CaracustPlate));
	};
	if(Npc_HasItems(Trader,ItAt_BuritanTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BuritanTooth,Npc_HasItems(Trader,ItAt_BuritanTooth));
	};
	if(Npc_HasItems(Trader,ItAt_PW_MuritanTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_PW_MuritanTooth,Npc_HasItems(Trader,ItAt_PW_MuritanTooth));
	};
	if(Npc_HasItems(Trader,ItUt_MuritanTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_MuritanTooth,Npc_HasItems(Trader,ItUt_MuritanTooth));
	};
	if(Npc_HasItems(Trader,ITAT_LEADERLURKER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_LEADERLURKER,Npc_HasItems(Trader,ITAT_LEADERLURKER));
	};
	if(Npc_HasItems(Trader,ITUT_LURKERLEADER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITUT_LURKERLEADER,Npc_HasItems(Trader,ITUT_LURKERLEADER));
	};
	if(Npc_HasItems(Trader,ITAT_GARPIISERDCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_GARPIISERDCE,Npc_HasItems(Trader,ITAT_GARPIISERDCE));
	};
	if(Npc_HasItems(Trader,ITUT_SERDCEGARPII) > 0)
	{
		Npc_RemoveInvItems(Trader,ITUT_SERDCEGARPII,Npc_HasItems(Trader,ITUT_SERDCEGARPII));
	};
	if(Npc_HasItems(Trader,ItAt_ZubSkalo) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ZubSkalo,Npc_HasItems(Trader,ItAt_ZubSkalo));
	};
	if(Npc_HasItems(Trader,ItUt_Skalozub) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_Skalozub,Npc_HasItems(Trader,ItUt_Skalozub));
	};
	if(Npc_HasItems(Trader,ITMI_UTONEPUMAPIECE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_UTONEPUMAPIECE,Npc_HasItems(Trader,ITMI_UTONEPUMAPIECE));
	};
	if(Npc_HasItems(Trader,ItUt_STONEPUMAPIECE) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_STONEPUMAPIECE,Npc_HasItems(Trader,ItUt_STONEPUMAPIECE));
	};
	if(Npc_HasItems(Trader,ItAt_XragonSkull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_XragonSkull,Npc_HasItems(Trader,ItAt_XragonSkull));
	};
	if(Npc_HasItems(Trader,ItUt_DragonSkull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_DragonSkull,Npc_HasItems(Trader,ItUt_DragonSkull));
	};
	if(Npc_HasItems(Trader,ItAt_HeadUrTrall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_HeadUrTrall,Npc_HasItems(Trader,ItAt_HeadUrTrall));
	};
	if(Npc_HasItems(Trader,ItUt_UrTrallHead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_UrTrallHead,Npc_HasItems(Trader,ItUt_UrTrallHead));
	};
	if(Npc_HasItems(Trader,ItAt_SkullWhiteTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SkullWhiteTroll,Npc_HasItems(Trader,ItAt_SkullWhiteTroll));
	};
	if(Npc_HasItems(Trader,ItUt_WhiteTrollSkull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_WhiteTrollSkull,Npc_HasItems(Trader,ItUt_WhiteTrollSkull));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_Leather_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_Leather_01,Npc_HasItems(Trader,ItBE_Addon_Leather_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_MIL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_MIL_01,Npc_HasItems(Trader,ItBE_Addon_MIL_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_MIL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_MIL_02,Npc_HasItems(Trader,ItBE_Addon_MIL_02));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_SLD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SLD_01,Npc_HasItems(Trader,ItBE_Addon_SLD_01));
	}
	if(Npc_HasItems(Trader,ItBE_Addon_SLD_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SLD_02,Npc_HasItems(Trader,ItBE_Addon_SLD_02));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_SLD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SLD_03,Npc_HasItems(Trader,ItBE_Addon_SLD_03));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_MC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_MC,Npc_HasItems(Trader,ItBE_Addon_MC));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_NOV_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_NOV_01,Npc_HasItems(Trader,ItBE_Addon_NOV_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_KDF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_KDF_01,Npc_HasItems(Trader,ItBE_Addon_KDF_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_KDF_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_KDF_02,Npc_HasItems(Trader,ItBE_Addon_KDF_02));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_KDF_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_KDF_03,Npc_HasItems(Trader,ItBE_Addon_KDF_03));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_DJG_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_DJG_01,Npc_HasItems(Trader,ItBE_Addon_DJG_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_SEK_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SEK_01,Npc_HasItems(Trader,ItBE_Addon_SEK_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_TPL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_TPL_01,Npc_HasItems(Trader,ItBE_Addon_TPL_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_GUR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_GUR_01,Npc_HasItems(Trader,ItBE_Addon_GUR_01));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Thief_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Thief_01,Npc_HasItems(Trader,ItBe_Addon_Thief_01));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Thief_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Thief_02,Npc_HasItems(Trader,ItBe_Addon_Thief_02));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Thief_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Thief_03,Npc_HasItems(Trader,ItBe_Addon_Thief_03));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_STR_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_STR_5,Npc_HasItems(Trader,ItBe_Addon_STR_5));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_STR_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_STR_10,Npc_HasItems(Trader,ItBe_Addon_STR_10));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_DEX_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_DEX_5,Npc_HasItems(Trader,ItBe_Addon_DEX_5));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_DEX_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_DEX_10,Npc_HasItems(Trader,ItBe_Addon_DEX_10));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_EDGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_EDGE,Npc_HasItems(Trader,ItBe_Addon_Prot_EDGE));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_Point) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_Point,Npc_HasItems(Trader,ItBe_Addon_Prot_Point));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_MAGIC,Npc_HasItems(Trader,ItBe_Addon_Prot_MAGIC));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_FIRE) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_FIRE,Npc_HasItems(Trader,ItBe_Addon_Prot_FIRE));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_EdgPoi) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_EdgPoi,Npc_HasItems(Trader,ItBe_Addon_Prot_EdgPoi));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_TOTAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_TOTAL,Npc_HasItems(Trader,ItBe_Addon_Prot_TOTAL));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_01,Npc_HasItems(Trader,ItBe_Addon_Custom_01));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_02,Npc_HasItems(Trader,ItBe_Addon_Custom_02));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_03,Npc_HasItems(Trader,ItBe_Addon_Custom_03));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_04,Npc_HasItems(Trader,ItBe_Addon_Custom_04));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_BT_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_BT_01,Npc_HasItems(Trader,ItBe_Addon_BT_01));
	};
	if(Npc_HasItems(Trader,ItBe_NordmarBelt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_NordmarBelt,Npc_HasItems(Trader,ItBe_NordmarBelt));
	};
	if(Npc_HasItems(Trader,ItBe_DragonBelt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_DragonBelt,Npc_HasItems(Trader,ItBe_DragonBelt));
	};
	if(Npc_HasItems(Trader,Fakescroll) > 0)
	{
		Npc_RemoveInvItems(Trader,Fakescroll,Npc_HasItems(Trader,Fakescroll));
	};
	if(Npc_HasItems(Trader,ITWR_MAGICPAPER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAGICPAPER,Npc_HasItems(Trader,ITWR_MAGICPAPER));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK1,Npc_HasItems(Trader,ITWR_OLDBOOK1));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK2,Npc_HasItems(Trader,ITWR_OLDBOOK2));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK3,Npc_HasItems(Trader,ITWR_OLDBOOK3));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK4,Npc_HasItems(Trader,ITWR_OLDBOOK4));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK5,Npc_HasItems(Trader,ITWR_OLDBOOK5));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK6) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK6,Npc_HasItems(Trader,ITWR_OLDBOOK6));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Shellflesh) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Shellflesh,Npc_HasItems(Trader,ItFo_Addon_Shellflesh));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Rum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Rum,Npc_HasItems(Trader,ItFo_Addon_Rum));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Rum_Skip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Rum_Skip,Npc_HasItems(Trader,ItFo_Addon_Rum_Skip));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_ORCRUM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_ORCRUM,Npc_HasItems(Trader,ITFO_ADDON_ORCRUM));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_ORCRUMSAL,Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSAL));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSALBETA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_ORCRUMSALBETA,Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSALBETA));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Grog) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Grog,Npc_HasItems(Trader,ItFo_Addon_Grog));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_LousHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_LousHammer,Npc_HasItems(Trader,ItFo_Addon_LousHammer));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_SchlafHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_SchlafHammer,Npc_HasItems(Trader,ItFo_Addon_SchlafHammer));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_SchnellerHering) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_SchnellerHering,Npc_HasItems(Trader,ItFo_Addon_SchnellerHering));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_SchnellerHering_Ext) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_SchnellerHering_Ext,Npc_HasItems(Trader,ItFo_Addon_SchnellerHering_Ext));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Pfeffer_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Pfeffer_01,Npc_HasItems(Trader,ItFo_Addon_Pfeffer_01));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_FireStew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_FireStew,Npc_HasItems(Trader,ItFo_Addon_FireStew));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Meatsoup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Meatsoup,Npc_HasItems(Trader,ItFo_Addon_Meatsoup));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_SHNAPS_ORKS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_SHNAPS_ORKS,Npc_HasItems(Trader,ITFO_ADDON_SHNAPS_ORKS));
	};
	if(Npc_HasItems(Trader,ItFo_Apple) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Apple,Npc_HasItems(Trader,ItFo_Apple));
	};
	if(Npc_HasItems(Trader,ItFo_GoatCheese) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_GoatCheese,Npc_HasItems(Trader,ItFo_GoatCheese));
	};
	if(Npc_HasItems(Trader,ItFo_Cheese) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cheese,Npc_HasItems(Trader,ItFo_Cheese));
	};
	if(Npc_HasItems(Trader,ItFo_Bacon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Bacon,Npc_HasItems(Trader,ItFo_Bacon));
	};
	if(Npc_HasItems(Trader,ItFo_Bread) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Bread,Npc_HasItems(Trader,ItFo_Bread));
	};
	if(Npc_HasItems(Trader,ItFo_Fish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Fish,Npc_HasItems(Trader,ItFo_Fish));
	};
	if(Npc_HasItems(Trader,ITFOSCHILDKROETERAW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFOSCHILDKROETERAW,Npc_HasItems(Trader,ITFOSCHILDKROETERAW));
	};
	if(Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SCHILDKROETESOUP,Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP));
	};
	if(Npc_HasItems(Trader,ItFoMuttonRaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFoMuttonRaw,Npc_HasItems(Trader,ItFoMuttonRaw));
	};
	if(Npc_HasItems(Trader,ItFoMutton) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFoMutton,Npc_HasItems(Trader,ItFoMutton));
	};
	if(Npc_HasItems(Trader,ItMi_BretMeet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BretMeet,Npc_HasItems(Trader,ItMi_BretMeet));
	};
	if(Npc_HasItems(Trader,ITFOMUTTON_NICLAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFOMUTTON_NICLAS,Npc_HasItems(Trader,ITFOMUTTON_NICLAS));
	};
	if(Npc_HasItems(Trader,ItFo_Stew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Stew,Npc_HasItems(Trader,ItFo_Stew));
	};
	if(Npc_HasItems(Trader,ItFo_XPStew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_XPStew,Npc_HasItems(Trader,ItFo_XPStew));
	};
	if(Npc_HasItems(Trader,ITFO_NASHSOUP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_NASHSOUP,Npc_HasItems(Trader,ITFO_NASHSOUP));
	};
	if(Npc_HasItems(Trader,ItFo_CoragonsBeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_CoragonsBeer,Npc_HasItems(Trader,ItFo_CoragonsBeer));
	};
	if(Npc_HasItems(Trader,ItFo_FishSoup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_FishSoup,Npc_HasItems(Trader,ItFo_FishSoup));
	};
	if(Npc_HasItems(Trader,ItFo_Sausage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Sausage,Npc_HasItems(Trader,ItFo_Sausage));
	};
	if(Npc_HasItems(Trader,ItFo_Honey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Honey,Npc_HasItems(Trader,ItFo_Honey));
	};
	if(Npc_HasItems(Trader,ItFo_Water) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Water,Npc_HasItems(Trader,ItFo_Water));
	};
	if(Npc_HasItems(Trader,ItFo_AdanosWater) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_AdanosWater,Npc_HasItems(Trader,ItFo_AdanosWater));
	};
	if(Npc_HasItems(Trader,ItFo_Beer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Beer,Npc_HasItems(Trader,ItFo_Beer));
	};
	if(Npc_HasItems(Trader,ItFo_Booze) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Booze,Npc_HasItems(Trader,ItFo_Booze));
	};
	if(Npc_HasItems(Trader,ITFO_BOOZE_EXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_BOOZE_EXT,Npc_HasItems(Trader,ITFO_BOOZE_EXT));
	};
	if(Npc_HasItems(Trader,ITFO_WINEBERRYS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_WINEBERRYS,Npc_HasItems(Trader,ITFO_WINEBERRYS));
	};
	if(Npc_HasItems(Trader,ItFo_Wine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Wine,Npc_HasItems(Trader,ItFo_Wine));
	};
	if(Npc_HasItems(Trader,ItFo_Wine_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Wine_Loa,Npc_HasItems(Trader,ItFo_Wine_Loa));
	};
	if(Npc_HasItems(Trader,ItFo_Milk) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Milk,Npc_HasItems(Trader,ItFo_Milk));
	};
	if(Npc_HasItems(Trader,ItPo_AssasinsRareWine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_AssasinsRareWine,Npc_HasItems(Trader,ItPo_AssasinsRareWine));
	};
	if(Npc_HasItems(Trader,ItPo_AssasinsRareWine_Use) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_AssasinsRareWine_Use,Npc_HasItems(Trader,ItPo_AssasinsRareWine_Use));
	};
	if(Npc_HasItems(Trader,ITFO_SPECWINE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SPECWINE,Npc_HasItems(Trader,ITFO_SPECWINE));
	};
	if(Npc_HasItems(Trader,ITFO_SPECWINE_HP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SPECWINE_HP,Npc_HasItems(Trader,ITFO_SPECWINE_HP));
	};
	if(Npc_HasItems(Trader,ITFO_EALBALZAM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_EALBALZAM,Npc_HasItems(Trader,ITFO_EALBALZAM));
	};
	if(Npc_HasItems(Trader,ITFO_EALBALZAMTWO) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_EALBALZAMTWO,Npc_HasItems(Trader,ITFO_EALBALZAMTWO));
	};
	if(Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_POTTAGE_MUSHROOM,Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM));
	};
	if(Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM_BLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_POTTAGE_MUSHROOM_BLACK,Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM_BLACK));
	};
	if(Npc_HasItems(Trader,ITFO_COMPOTE_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_COMPOTE_00,Npc_HasItems(Trader,ITFO_COMPOTE_00));
	};
	if(Npc_HasItems(Trader,ITFO_COMPOTE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_COMPOTE_01,Npc_HasItems(Trader,ITFO_COMPOTE_01));
	};
	if(Npc_HasItems(Trader,ItFo_RiceStew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_RiceStew,Npc_HasItems(Trader,ItFo_RiceStew));
	};
	if(Npc_HasItems(Trader,ItFo_Meatbugragout) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Meatbugragout,Npc_HasItems(Trader,ItFo_Meatbugragout));
	};
	if(Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP_SBORKA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SCHILDKROETESOUP_SBORKA,Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP_SBORKA));
	};
	if(Npc_HasItems(Trader,ItFoMuttonRaw_Mount) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFoMuttonRaw_Mount,Npc_HasItems(Trader,ItFoMuttonRaw_Mount));
	};
	if(Npc_HasItems(Trader,ItFo_BeliarTear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_BeliarTear,Npc_HasItems(Trader,ItFo_BeliarTear));
	};
	if(Npc_HasItems(Trader,ItFo_BeliarTear_Haniar) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_BeliarTear_Haniar,Npc_HasItems(Trader,ItFo_BeliarTear_Haniar));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Apple) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Apple,Npc_HasItems(Trader,ItFo_Cake_Apple));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Meat) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Meat,Npc_HasItems(Trader,ItFo_Cake_Meat));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Mushroom) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Mushroom,Npc_HasItems(Trader,ItFo_Cake_Mushroom));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Fish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Fish,Npc_HasItems(Trader,ItFo_Cake_Fish));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Honey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Honey,Npc_HasItems(Trader,ItFo_Cake_Honey));
	};
	if(Npc_HasItems(Trader,ItFo_Alcohol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Alcohol,Npc_HasItems(Trader,ItFo_Alcohol));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCPRESTIGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCPRESTIGE,Npc_HasItems(Trader,ITMW_2H_ORCPRESTIGE));
	};
	if(Npc_HasItems(Trader,ITMW_ADANOSMOLOT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ADANOSMOLOT,Npc_HasItems(Trader,ITMW_ADANOSMOLOT));
	};
	if(Npc_HasItems(Trader,ITMI_TARACOTHAMMER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TARACOTHAMMER,Npc_HasItems(Trader,ITMI_TARACOTHAMMER));
	};
	if(Npc_HasItems(Trader,ItMw_1h_TributeDagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_TributeDagger,Npc_HasItems(Trader,ItMw_1h_TributeDagger));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MOONBLADE_LEFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MOONBLADE_LEFT,Npc_HasItems(Trader,ITMW_1H_MOONBLADE_LEFT));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MOONBLADE_RIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MOONBLADE_RIGHT,Npc_HasItems(Trader,ITMW_1H_MOONBLADE_RIGHT));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Left) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Npc_Left,Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Left));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Left) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Left,Npc_HasItems(Trader,ItMw_1H_AssBlade_Left));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Right) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Npc_Right,Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Right));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Right) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Right,Npc_HasItems(Trader,ItMw_1H_AssBlade_Right));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert5,Npc_HasItems(Trader,ItMw_Schwert5));
	};
	if(Npc_HasItems(Trader,ItMw_HartSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_HartSword,Npc_HasItems(Trader,ItMw_HartSword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender3,Npc_HasItems(Trader,ItMw_Zweihaender3));
	};
	if(Npc_HasItems(Trader,ItMw_Meisterdegen) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Meisterdegen,Npc_HasItems(Trader,ItMw_Meisterdegen));
	};
	if(Npc_HasItems(Trader,ItMw_Krummschwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Krummschwert,Npc_HasItems(Trader,ItMw_Krummschwert));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_Betty) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_Betty,Npc_HasItems(Trader,ItMw_Addon_Betty));
	};
	if(Npc_HasItems(Trader,ITMW_DIEGO_DEGEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_DIEGO_DEGEN,Npc_HasItems(Trader,ITMW_DIEGO_DEGEN));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoldBrand_Greg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoldBrand_Greg,Npc_HasItems(Trader,ItMw_1H_GoldBrand_Greg));
	};
	if(Npc_HasItems(Trader,ITMW_GORN_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_GORN_AXT,Npc_HasItems(Trader,ITMW_GORN_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_LEE_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LEE_AXT,Npc_HasItems(Trader,ITMW_LEE_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_KORD_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_KORD_AXT,Npc_HasItems(Trader,ITMW_KORD_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_LARES_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LARES_AXT,Npc_HasItems(Trader,ITMW_LARES_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_TORLOF_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TORLOF_AXT,Npc_HasItems(Trader,ITMW_TORLOF_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_SENTENCA_SWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SENTENCA_SWORD,Npc_HasItems(Trader,ITMW_SENTENCA_SWORD));
	};
	if(Npc_HasItems(Trader,ITMW_JARVIS_WAFFER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_JARVIS_WAFFER,Npc_HasItems(Trader,ITMW_JARVIS_WAFFER));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_Venzel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_Venzel,Npc_HasItems(Trader,ItMw_1H_Blessed_Venzel));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH,Npc_HasItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH));
	};
	if(Npc_HasItems(Trader,ITMW_WOLF_WAFFER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_WOLF_WAFFER,Npc_HasItems(Trader,ITMW_WOLF_WAFFER));
	};
	if(Npc_HasItems(Trader,ITMW_LESTER_SWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LESTER_SWORD,Npc_HasItems(Trader,ITMW_LESTER_SWORD));
	};
	if(Npc_HasItems(Trader,ITMW_KURGANSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_KURGANSWORD,Npc_HasItems(Trader,ITMW_KURGANSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASTER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASTER_01,Npc_HasItems(Trader,ITMW_2H_MASTER_01));
	};
	if(Npc_HasItems(Trader,ITMW_SCORPIONSPEC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SCORPIONSPEC,Npc_HasItems(Trader,ITMW_SCORPIONSPEC));
	};
	if(Npc_HasItems(Trader,ITMW_ABIGEILSPAGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ABIGEILSPAGE,Npc_HasItems(Trader,ITMW_ABIGEILSPAGE));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_GESTATH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_GESTATH,Npc_HasItems(Trader,ITMW_2H_AXE_GESTATH));
	};
	if(Npc_HasItems(Trader,ANGAR_SCHWERT) > 0)
	{
		Npc_RemoveInvItems(Trader,ANGAR_SCHWERT,Npc_HasItems(Trader,ANGAR_SCHWERT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_TIAMANT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_TIAMANT,Npc_HasItems(Trader,ITMW_2H_MASIAF_TIAMANT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_HANIAR,Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon,Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_OSAIR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_OSAIR,Npc_HasItems(Trader,ITMW_2H_MASIAF_OSAIR));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_NROZAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_NROZAS,Npc_HasItems(Trader,ITMW_2H_MASIAF_NROZAS));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_01,Npc_HasItems(Trader,ItMw_2H_OrcAxe_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_02,Npc_HasItems(Trader,ItMw_2H_OrcAxe_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_03,Npc_HasItems(Trader,ItMw_2H_OrcAxe_03));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_04,Npc_HasItems(Trader,ItMw_2H_OrcAxe_04));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcSword_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcSword_01,Npc_HasItems(Trader,ItMw_2H_OrcSword_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcSword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcSword_02,Npc_HasItems(Trader,ItMw_2H_OrcSword_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_03,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_03));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_04,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_04));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_05,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_05));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCMACE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCMACE_01,Npc_HasItems(Trader,ITMW_2H_ORCMACE_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCMACE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCMACE_02,Npc_HasItems(Trader,ITMW_2H_ORCMACE_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRACONSWORD_01,Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF,Npc_HasItems(Trader,ITMW_ORCSTAFF));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF_ELITE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF_ELITE,Npc_HasItems(Trader,ITMW_ORCSTAFF_ELITE));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF_UNDEAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF_UNDEAD,Npc_HasItems(Trader,ITMW_ORCSTAFF_UNDEAD));
	};
	if(Npc_HasItems(Trader,ITMW_ADDON_KEULE_1H_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ADDON_KEULE_1H_03,Npc_HasItems(Trader,ITMW_ADDON_KEULE_1H_03));
	};
	if(Npc_HasItems(Trader,ItMw_2h_OrcStab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_OrcStab,Npc_HasItems(Trader,ItMw_2h_OrcStab));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSTAFF_01,Npc_HasItems(Trader,ITMW_2H_ORCSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01,Npc_HasItems(Trader,ItAr_Shield_01));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01_Alrik) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01_Alrik,Npc_HasItems(Trader,ItAr_Shield_01_Alrik));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_02,Npc_HasItems(Trader,ItAr_Shield_02));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_03,Npc_HasItems(Trader,ItAr_Shield_03));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_04,Npc_HasItems(Trader,ItAr_Shield_04));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_05,Npc_HasItems(Trader,ItAr_Shield_05));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_06,Npc_HasItems(Trader,ItAr_Shield_06));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_Caracust) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_Caracust,Npc_HasItems(Trader,ItAr_Shield_Caracust));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_07,Npc_HasItems(Trader,ItAr_Shield_07));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_07_Cedrik) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_07_Cedrik,Npc_HasItems(Trader,ItAr_Shield_07_Cedrik));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01_Damn,Npc_HasItems(Trader,ItAr_Shield_01_Damn));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_02_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_02_Damn,Npc_HasItems(Trader,ItAr_Shield_02_Damn));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_03_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_03_Damn,Npc_HasItems(Trader,ItAr_Shield_03_Damn));
	};
	if(Npc_HasItems(Trader,ITMW_MEATKNIFE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_MEATKNIFE,Npc_HasItems(Trader,ITMW_MEATKNIFE));
	};
	if(Npc_HasItems(Trader,ItMi_CutKnife) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CutKnife,Npc_HasItems(Trader,ItMi_CutKnife));
	};
	if(Npc_HasItems(Trader,ITMW_2H_SCYTHE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_SCYTHE,Npc_HasItems(Trader,ITMW_2H_SCYTHE));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_01,Npc_HasItems(Trader,ItMw_1H_Mace_L_01));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Bau_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Bau_Axe,Npc_HasItems(Trader,ItMw_1h_Bau_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Mace,Npc_HasItems(Trader,ItMw_1h_Vlk_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_StoneHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_StoneHammer,Npc_HasItems(Trader,ItMw_StoneHammer));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_04,Npc_HasItems(Trader,ItMw_1H_Mace_L_04));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G3_SMITHHAMMER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G3_SMITHHAMMER_01,Npc_HasItems(Trader,ITMW_1H_G3_SMITHHAMMER_01));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G4_AXESMALL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G4_AXESMALL_01,Npc_HasItems(Trader,ITMW_1H_G4_AXESMALL_01));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Bau_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Bau_Axe,Npc_HasItems(Trader,ItMw_2h_Bau_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Bau_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Bau_Mace,Npc_HasItems(Trader,ItMw_1h_Bau_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_Simple_Spear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Simple_Spear,Npc_HasItems(Trader,ItMw_Simple_Spear));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_03,Npc_HasItems(Trader,ItMw_1H_Mace_L_03));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelknueppel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelknueppel,Npc_HasItems(Trader,ItMw_Nagelknueppel));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Gobbo_Hammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Gobbo_Hammer,Npc_HasItems(Trader,ItMw_1h_Gobbo_Hammer));
	};
	if(Npc_HasItems(Trader,ItMw_OgreHummer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OgreHummer,Npc_HasItems(Trader,ItMw_OgreHummer));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegskeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegskeule,Npc_HasItems(Trader,ItMw_Kriegskeule));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoblinTotem) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoblinTotem,Npc_HasItems(Trader,ItMw_1H_GoblinTotem));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Nov_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Nov_Mace,Npc_HasItems(Trader,ItMw_1h_Nov_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_Richtstab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Richtstab,Npc_HasItems(Trader,ItMw_Richtstab));
	};
	if(Npc_HasItems(Trader,ItMw_Stabkeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Stabkeule,Npc_HasItems(Trader,ItMw_Stabkeule));
	};
	if(Npc_HasItems(Trader,ITMW_BATTLEMAGE_STAB_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_BATTLEMAGE_STAB_02,Npc_HasItems(Trader,ITMW_BATTLEMAGE_STAB_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Keule_1h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Keule_1h_01,Npc_HasItems(Trader,ItMW_Addon_Keule_1h_01));
	};
	if(Npc_HasItems(Trader,ItMw_RangerStaff_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_RangerStaff_Addon,Npc_HasItems(Trader,ItMw_RangerStaff_Addon));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFDRUID_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFDRUID_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFDRUID_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFFIRE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFFIRE_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFFIRE_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFWATER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFWATER_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFWATER_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01,Npc_HasItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab01,Npc_HasItems(Trader,ItMW_Addon_Stab01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab02,Npc_HasItems(Trader,ItMW_Addon_Stab02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab03,Npc_HasItems(Trader,ItMW_Addon_Stab03));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab04,Npc_HasItems(Trader,ItMW_Addon_Stab04));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01,Npc_HasItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab01_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab01_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab01_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab02_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab02_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab02_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab03_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab03_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab03_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab04_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab04_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab04_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Xardas_Stab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Xardas_Stab,Npc_HasItems(Trader,ItMW_Xardas_Stab));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword,Npc_HasItems(Trader,ItMw_1h_MISC_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Sum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Sum,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Sum));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Str) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Str,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Str));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Mst) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Mst,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Mst));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MISC_GSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MISC_GSWORD,Npc_HasItems(Trader,ITMW_1H_MISC_GSWORD));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Misc_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Misc_Axe,Npc_HasItems(Trader,ItMw_1h_Misc_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OldSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OldSword,Npc_HasItems(Trader,ItMw_2H_OldSword));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Sword_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Sword_M_01,Npc_HasItems(Trader,ItMw_2H_Sword_M_01));
	};
	if(Npc_HasItems(Trader,ITMW_SHADOWPRIEST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SHADOWPRIEST,Npc_HasItems(Trader,ITMW_SHADOWPRIEST));
	};
	if(Npc_HasItems(Trader,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(Trader,ITMW_SHADOWPRIEST_Elite));
	};
	if(Npc_HasItems(Trader,ItMw_Doom_OldPiratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Doom_OldPiratensaebel,Npc_HasItems(Trader,ItMw_Doom_OldPiratensaebel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DOOMSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DOOMSWORD,Npc_HasItems(Trader,ITMW_1H_DOOMSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_GHOSTSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_GHOSTSWORD,Npc_HasItems(Trader,ITMW_1H_GHOSTSWORD));
	};
	if(Npc_HasItems(Trader,ItMw_2H_IzgulScy) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_IzgulScy,Npc_HasItems(Trader,ItMw_2H_IzgulScy));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DoomSpeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DoomSpeer,Npc_HasItems(Trader,ITMW_1H_DoomSpeer));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_DEAD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(Trader,ITMW_1H_DOOMSWORD_Elite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_PreElite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD_PreElite,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_PreElite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD_Elite,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_Elite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_RAVENELITE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_RAVENELITE,Npc_HasItems(Trader,ITMW_2H_RAVENELITE));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_DAMN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_DAMN,Npc_HasItems(Trader,ITMW_2H_MASIAF_DAMN));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon,Npc_HasItems(Trader,ItMw_DS_MonWeapon));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_Med) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_Med,Npc_HasItems(Trader,ItMw_DS_MonWeapon_Med));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_Elite,Npc_HasItems(Trader,ItMw_DS_MonWeapon_Elite));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_ExElite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_ExElite,Npc_HasItems(Trader,ItMw_DS_MonWeapon_ExElite));
	};
	if(Npc_HasItems(Trader,ItMi_GongDrum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GongDrum,Npc_HasItems(Trader,ItMi_GongDrum));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Sword,Npc_HasItems(Trader,ItMw_1h_Sld_Sword));
	};
	if(Npc_HasItems(Trader,Bdmn_vob) > 0)
	{
		Npc_RemoveInvItems(Trader,Bdmn_vob,Npc_HasItems(Trader,Bdmn_vob));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Dagger,Npc_HasItems(Trader,ItMw_1h_Vlk_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Sword_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Sword_L_03,Npc_HasItems(Trader,ItMw_1H_Sword_L_03));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Knife01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Knife01,Npc_HasItems(Trader,ItMW_Addon_Knife01));
	};
	if(Npc_HasItems(Trader,ItMW_Rich_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Rich_Sword,Npc_HasItems(Trader,ItMW_Rich_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_FrancisDagger_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_FrancisDagger_Mis,Npc_HasItems(Trader,ItMw_FrancisDagger_Mis));
	};
	if(Npc_HasItems(Trader,ItMw_OldPiratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OldPiratensaebel,Npc_HasItems(Trader,ItMw_OldPiratensaebel));
	};
	if(Npc_HasItems(Trader,ItMw_Piratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Piratensaebel,Npc_HasItems(Trader,ItMw_Piratensaebel));
	};
	if(Npc_HasItems(Trader,ItMw_Sense) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sense,Npc_HasItems(Trader,ItMw_Sense));
	};
	if(Npc_HasItems(Trader,ItMw_BartokSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_BartokSword,Npc_HasItems(Trader,ItMw_BartokSword));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_1h_02,Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_1h_01,Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_2h_02,Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_2h_01,Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_01));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR1hAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR1hAxe,Npc_HasItems(Trader,ItMw_Addon_PIR1hAxe));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR1hSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR1hSword,Npc_HasItems(Trader,ItMw_Addon_PIR1hSword));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR2hAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR2hAxe,Npc_HasItems(Trader,ItMw_Addon_PIR2hAxe));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR2hSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR2hSword,Npc_HasItems(Trader,ItMw_Addon_PIR2hSword));
	};
	if(Npc_HasItems(Trader,ItMw_Schiffsaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schiffsaxt,Npc_HasItems(Trader,ItMw_Schiffsaxt));
	};
	if(Npc_HasItems(Trader,ItMw_OldSpage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OldSpage,Npc_HasItems(Trader,ItMw_OldSpage));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Sword,Npc_HasItems(Trader,ItMw_1h_Vlk_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_BanditTrader,Npc_HasItems(Trader,ItMw_Addon_BanditTrader));
	};
	if(Npc_HasItems(Trader,ItMw_Rapier) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rapier,Npc_HasItems(Trader,ItMw_Rapier));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_01,Npc_HasItems(Trader,ItMw_ChiefRapier_01));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_02,Npc_HasItems(Trader,ItMw_ChiefRapier_02));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_03,Npc_HasItems(Trader,ItMw_ChiefRapier_03));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_04,Npc_HasItems(Trader,ItMw_ChiefRapier_04));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_05,Npc_HasItems(Trader,ItMw_ChiefRapier_05));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_06,Npc_HasItems(Trader,ItMw_ChiefRapier_06));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_Loa,Npc_HasItems(Trader,ItMw_ChiefRapier_Loa));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_07,Npc_HasItems(Trader,ItMw_ChiefRapier_07));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_08) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_08,Npc_HasItems(Trader,ItMw_ChiefRapier_08));
	};
	if(Npc_HasItems(Trader,ItMw_Avabul_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Avabul_Dagger,Npc_HasItems(Trader,ItMw_Avabul_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoldBrand) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoldBrand,Npc_HasItems(Trader,ItMw_1H_GoldBrand));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA,Npc_HasItems(Trader,ITMW_2H_KATANA));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA_GIFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA_GIFT,Npc_HasItems(Trader,ITMW_2H_KATANA_GIFT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA_Gonsales) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA_Gonsales,Npc_HasItems(Trader,ITMW_2H_KATANA_Gonsales));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade,Npc_HasItems(Trader,ItMw_1H_AssBlade));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_View) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_View,Npc_HasItems(Trader,ItMw_1H_AssBlade_View));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Known) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Known,Npc_HasItems(Trader,ItMw_1H_AssBlade_Known));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Hero) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Hero,Npc_HasItems(Trader,ItMw_1H_AssBlade_Hero));
	};
	if(Npc_HasItems(Trader,ITMW_FAKESWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_FAKESWORD_01,Npc_HasItems(Trader,ITMW_FAKESWORD_01));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Axe,Npc_HasItems(Trader,ItMw_1h_Vlk_Axe));
	};
	if(Npc_HasItems(Trader,HEERSCHERSTAB) > 0)
	{
		Npc_RemoveInvItems(Trader,HEERSCHERSTAB,Npc_HasItems(Trader,HEERSCHERSTAB));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword2,Npc_HasItems(Trader,ItMw_ShortSword2));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword3,Npc_HasItems(Trader,ItMw_ShortSword3));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword4,Npc_HasItems(Trader,ItMw_ShortSword4));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword5,Npc_HasItems(Trader,ItMw_ShortSword5));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword1,Npc_HasItems(Trader,ItMw_ShortSword1));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert,Npc_HasItems(Trader,ItMw_Schwert));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Mil_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Mil_Sword,Npc_HasItems(Trader,ItMw_1h_Mil_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Sword_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Sword_New,Npc_HasItems(Trader,ItMw_1h_Sld_Sword_New));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert3,Npc_HasItems(Trader,ItMw_Schwert3));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert2,Npc_HasItems(Trader,ItMw_Schwert2));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Pal_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Pal_Sword,Npc_HasItems(Trader,ItMw_1h_Pal_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender1,Npc_HasItems(Trader,ItMw_Zweihaender1));
	};
	if(Npc_HasItems(Trader,ItMw_Hellebarde) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Hellebarde,Npc_HasItems(Trader,ItMw_Hellebarde));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Sld_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Sld_Sword,Npc_HasItems(Trader,ItMw_2h_Sld_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender2,Npc_HasItems(Trader,ItMw_Zweihaender2));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Pal_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Pal_Sword,Npc_HasItems(Trader,ItMw_2h_Pal_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender4,Npc_HasItems(Trader,ItMw_Zweihaender4));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Claymore) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Claymore,Npc_HasItems(Trader,ItMw_2H_Claymore));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Pal_Sword_Etlu) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Pal_Sword_Etlu,Npc_HasItems(Trader,ItMw_1h_Pal_Sword_Etlu));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Pal_Sword_Etlu) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Pal_Sword_Etlu,Npc_HasItems(Trader,ItMw_2h_Pal_Sword_Etlu));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelkeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelkeule,Npc_HasItems(Trader,ItMw_Nagelkeule));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelkeule2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelkeule2,Npc_HasItems(Trader,ItMw_Nagelkeule2));
	};
	if(Npc_HasItems(Trader,ItMw_Streitkolben) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitkolben,Npc_HasItems(Trader,ItMw_Streitkolben));
	};
	if(Npc_HasItems(Trader,ItMw_Steinbrecher) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Steinbrecher,Npc_HasItems(Trader,ItMw_Steinbrecher));
	};
	if(Npc_HasItems(Trader,ItMw_Spicker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Spicker,Npc_HasItems(Trader,ItMw_Spicker));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegshammer1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegshammer1,Npc_HasItems(Trader,ItMw_Kriegshammer1));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegshammer2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegshammer2,Npc_HasItems(Trader,ItMw_Kriegshammer2));
	};
	if(Npc_HasItems(Trader,ItMw_Morgenstern) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Morgenstern,Npc_HasItems(Trader,ItMw_Morgenstern));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MACE_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MACE_107,Npc_HasItems(Trader,ITMW_1H_MACE_107));
	};
	if(Npc_HasItems(Trader,ItMw_Inquisitor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Inquisitor,Npc_HasItems(Trader,ItMw_Inquisitor));
	};
	if(Npc_HasItems(Trader,ItMw_Rabenschnabel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rabenschnabel,Npc_HasItems(Trader,ItMw_Rabenschnabel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MACE_BANDOS_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MACE_BANDOS_107,Npc_HasItems(Trader,ITMW_1H_MACE_BANDOS_107));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Warhammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Warhammer,Npc_HasItems(Trader,ItMw_2H_Warhammer));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MACE_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MACE_107,Npc_HasItems(Trader,ITMW_2H_MACE_107));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Volebir) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Volebir,Npc_HasItems(Trader,ItMw_2H_Volebir));
	};
	if(Npc_HasItems(Trader,ItMw_2H_IceHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_IceHammer,Npc_HasItems(Trader,ItMw_2H_IceHammer));
	};
	if(Npc_HasItems(Trader,ItMw_2H_NordmarWarHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_NordmarWarHammer,Npc_HasItems(Trader,ItMw_2H_NordmarWarHammer));
	};
	if(Npc_HasItems(Trader,ItMw_1H_MolagBarMace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_MolagBarMace,Npc_HasItems(Trader,ItMw_1H_MolagBarMace));
	};
	if(Npc_HasItems(Trader,ItMw_2H_SharpTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_SharpTeeth,Npc_HasItems(Trader,ItMw_2H_SharpTeeth));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Axe,Npc_HasItems(Trader,ItMw_1h_Sld_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_Bartaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Bartaxt,Npc_HasItems(Trader,ItMw_Bartaxt));
	};
	if(Npc_HasItems(Trader,ItMw_Doppelaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Doppelaxt,Npc_HasItems(Trader,ItMw_Doppelaxt));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Sld_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Sld_Axe,Npc_HasItems(Trader,ItMw_2h_Sld_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt1,Npc_HasItems(Trader,ItMw_Streitaxt1));
	};
	if(Npc_HasItems(Trader,ItMw_Folteraxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Folteraxt,Npc_HasItems(Trader,ItMw_Folteraxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_BERSERK_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_BERSERK_107,Npc_HasItems(Trader,ITMW_2H_AXE_BERSERK_107));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3A_ORCAXE_02,Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_02));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt2,Npc_HasItems(Trader,ItMw_Streitaxt2));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt3,Npc_HasItems(Trader,ItMw_Streitaxt3));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Common_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Common_01,Npc_HasItems(Trader,ItMw_1H_Common_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Common_01_Blade) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Common_01_Blade,Npc_HasItems(Trader,ItMw_1H_Common_01_Blade));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert1,Npc_HasItems(Trader,ItMw_Schwert1));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert4,Npc_HasItems(Trader,ItMw_Schwert4));
	};
	if(Npc_HasItems(Trader,ItMw_Rubinklinge) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rubinklinge,Npc_HasItems(Trader,ItMw_Rubinklinge));
	};
	if(Npc_HasItems(Trader,ItMw_ElBastardo) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ElBastardo,Npc_HasItems(Trader,ItMw_ElBastardo));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_01,Npc_HasItems(Trader,ItMw_1H_Special_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_02,Npc_HasItems(Trader,ItMw_1H_Special_02));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_03,Npc_HasItems(Trader,ItMw_1H_Special_03));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_04,Npc_HasItems(Trader,ItMw_1H_Special_04));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_01,Npc_HasItems(Trader,ItMw_2H_Special_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_02,Npc_HasItems(Trader,ItMw_2H_Special_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_03,Npc_HasItems(Trader,ItMw_2H_Special_03));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_04,Npc_HasItems(Trader,ItMw_2H_Special_04));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_01,Npc_HasItems(Trader,ItMw_1H_Blessed_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_02,Npc_HasItems(Trader,ItMw_1H_Blessed_02));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_03,Npc_HasItems(Trader,ItMw_1H_Blessed_03));
	};
	if(Npc_HasItems(Trader,ItMw_Axe_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Axe_Blood,Npc_HasItems(Trader,ItMw_Axe_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Sword_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sword_Blood,Npc_HasItems(Trader,ItMw_Sword_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_Blood,Npc_HasItems(Trader,ItMw_Speer_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Staff_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Staff_Blood,Npc_HasItems(Trader,ItMw_Staff_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_01,Npc_HasItems(Trader,ItMw_2H_Blessed_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_02,Npc_HasItems(Trader,ItMw_2H_Blessed_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_03,Npc_HasItems(Trader,ItMw_2H_Blessed_03));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SIMPLEBLACK,Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SIMPLEBLACK_DEX,Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK_DEX));
	};
	if(Npc_HasItems(Trader,ITMW_2H_SIMPLEBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_SIMPLEBLACK,Npc_HasItems(Trader,ITMW_2H_SIMPLEBLACK));
	};
	if(Npc_HasItems(Trader,ItMw_Drakesaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drakesaebel,Npc_HasItems(Trader,ItMw_Drakesaebel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_KMR_GREATLONG_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_KMR_GREATLONG_01,Npc_HasItems(Trader,ITMW_1H_KMR_GREATLONG_01));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SWORD_LONG_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SWORD_LONG_05,Npc_HasItems(Trader,ITMW_1H_SWORD_LONG_05));
	};
	if(Npc_HasItems(Trader,ItMw_Runenschwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Runenschwert,Npc_HasItems(Trader,ItMw_Runenschwert));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01,Npc_HasItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01));
	};
	if(Npc_HasItems(Trader,ItMw_Sturmbringer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sturmbringer,Npc_HasItems(Trader,ItMw_Sturmbringer));
	};
	if(Npc_HasItems(Trader,ITMW_1H_CREST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_CREST,Npc_HasItems(Trader,ITMW_1H_CREST));
	};
	if(Npc_HasItems(Trader,ItMw_Orkschlaechter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Orkschlaechter,Npc_HasItems(Trader,ItMw_Orkschlaechter));
	};
	if(Npc_HasItems(Trader,ITMW_FEARUND) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_FEARUND,Npc_HasItems(Trader,ITMW_FEARUND));
	};
	if(Npc_HasItems(Trader,ItMw_Drachen_Sword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drachen_Sword_02,Npc_HasItems(Trader,ItMw_Drachen_Sword_02));
	};
	if(Npc_HasItems(Trader,ITMW_1H_KMR_SNAKESWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_KMR_SNAKESWORD_01,Npc_HasItems(Trader,ITMW_1H_KMR_SNAKESWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_NORMARDSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_NORMARDSWORD,Npc_HasItems(Trader,ITMW_NORMARDSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLACKSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLACKSWORD,Npc_HasItems(Trader,ITMW_1H_BLACKSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01,Npc_HasItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GinnokSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GinnokSword,Npc_HasItems(Trader,ItMw_1H_GinnokSword));
	};
	if(Npc_HasItems(Trader,ITMW_1H_XARADRIM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_XARADRIM,Npc_HasItems(Trader,ITMW_1H_XARADRIM));
	};
	if(Npc_HasItems(Trader,ITMW_1H_LostSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_LostSoul,Npc_HasItems(Trader,ITMW_1H_LostSoul));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DEATHBRINGER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DEATHBRINGER,Npc_HasItems(Trader,ITMW_1H_DEATHBRINGER));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC,Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX,Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_KOLUN_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_KOLUN_107,Npc_HasItems(Trader,ITMW_2H_AXE_KOLUN_107));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3A_ORCAXE_03,Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_03));
	};
	if(Npc_HasItems(Trader,ItMw_Schlachtaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schlachtaxt,Npc_HasItems(Trader,ItMw_Schlachtaxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_AXE_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_AXE_H_02,Npc_HasItems(Trader,ITMW_2H_KMR_AXE_H_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_SOULSWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_SOULSWORD_01,Npc_HasItems(Trader,ITMW_2H_KMR_SOULSWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01,Npc_HasItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01));
	};
	if(Npc_HasItems(Trader,Orc_Blade) > 0)
	{
		Npc_RemoveInvItems(Trader,Orc_Blade,Npc_HasItems(Trader,Orc_Blade));
	};
	if(Npc_HasItems(Trader,ItMw_Drachenschneide) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drachenschneide,Npc_HasItems(Trader,ItMw_Drachenschneide));
	};
	if(Npc_HasItems(Trader,ItMw_RuneAxeAncient) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_RuneAxeAncient,Npc_HasItems(Trader,ItMw_RuneAxeAncient));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_RHOBAR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_RHOBAR_01,Npc_HasItems(Trader,ITMW_2H_KMR_RHOBAR_01));
	};
	if(Npc_HasItems(Trader,ItMw_DemonHand) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DemonHand,Npc_HasItems(Trader,ItMw_DemonHand));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_GREATORCAXE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_GREATORCAXE_01,Npc_HasItems(Trader,ITMW_2H_KMR_GREATORCAXE_01));
	};
	if(Npc_HasItems(Trader,ItMw_DragonBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DragonBone,Npc_HasItems(Trader,ItMw_DragonBone));
	};
	if(Npc_HasItems(Trader,ITMW_2H_URIZEL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_URIZEL,Npc_HasItems(Trader,ITMW_2H_URIZEL));
	};
	if(Npc_HasItems(Trader,ITMW_2H_URIZEL_NOMAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_URIZEL_NOMAGIC,Npc_HasItems(Trader,ITMW_2H_URIZEL_NOMAGIC));
	};
	if(Npc_HasItems(Trader,ITMW_2H_XARADRIM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_XARADRIM,Npc_HasItems(Trader,ITMW_2H_XARADRIM));
	};
	if(Npc_HasItems(Trader,ItMw_2H_DarkSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_DarkSoul,Npc_HasItems(Trader,ItMw_2H_DarkSoul));
	};
	if(Npc_HasItems(Trader,ItMw_Berserkeraxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Berserkeraxt,Npc_HasItems(Trader,ItMw_Berserkeraxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRAGONMASTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRAGONMASTER,Npc_HasItems(Trader,ITMW_2H_DRAGONMASTER));
	};
	if(Npc_HasItems(Trader,ITMW_2H_WELTENSPALTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_WELTENSPALTER,Npc_HasItems(Trader,ITMW_2H_WELTENSPALTER));
	};
	if(Npc_HasItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC,Npc_HasItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanAxe_01,Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanSword_01,Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanGreatAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanGreatAxe,Npc_HasItems(Trader,ItMw_2H_OrcHumanGreatAxe));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanAxe_02,Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanSword_02,Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanDoppelAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanDoppelAxe,Npc_HasItems(Trader,ItMw_2H_OrcHumanDoppelAxe));
	};
	if(Npc_HasItems(Trader,ITMW_2H_OrcHumanClaymore) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_OrcHumanClaymore,Npc_HasItems(Trader,ITMW_2H_OrcHumanClaymore));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER5,Npc_HasItems(Trader,ITMW_ZWEIHAENDER5));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER6) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER6,Npc_HasItems(Trader,ITMW_ZWEIHAENDER6));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5));
	};
	if(Npc_HasItems(Trader,ItMw_Iron_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Iron_Dagger,Npc_HasItems(Trader,ItMw_Iron_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_Steel_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Steel_Dagger,Npc_HasItems(Trader,ItMw_Steel_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_Speer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer,Npc_HasItems(Trader,ItMw_Speer));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_01,Npc_HasItems(Trader,ItMw_Speer_01));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_02,Npc_HasItems(Trader,ItMw_Speer_02));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_03,Npc_HasItems(Trader,ItMw_Speer_03));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_04,Npc_HasItems(Trader,ItMw_Speer_04));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_05,Npc_HasItems(Trader,ItMw_Speer_05));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_01,Npc_HasItems(Trader,ItMw_Halleberde_01));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_02,Npc_HasItems(Trader,ItMw_Halleberde_02));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_03,Npc_HasItems(Trader,ItMw_Halleberde_03));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_04,Npc_HasItems(Trader,ItMw_Halleberde_04));
	};
	if(Npc_HasItems(Trader,ItMw_SwordSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_SwordSpear,Npc_HasItems(Trader,ItMw_SwordSpear));
	};
	if(Npc_HasItems(Trader,ItMw_HeavySwordSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_HeavySwordSpear,Npc_HasItems(Trader,ItMw_HeavySwordSpear));
	};
	if(Npc_HasItems(Trader,ItMw_ButcherSpeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ButcherSpeer,Npc_HasItems(Trader,ItMw_ButcherSpeer));
	};
	if(Npc_HasItems(Trader,ItMw_DemonSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DemonSpear,Npc_HasItems(Trader,ItMw_DemonSpear));
	};
	if(Npc_HasItems(Trader,ITMW_1H_WOLF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_WOLF,Npc_HasItems(Trader,ITMW_1H_WOLF));
	};
	if(Npc_HasItems(Trader,ItSc_Scarband_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Scarband_01,Npc_HasItems(Trader,ItSc_Scarband_01));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_GoldNugget) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_GoldNugget,Npc_HasItems(Trader,ItMi_Addon_GoldNugget));
	};
	if(Npc_HasItems(Trader,ItMi_Osair_GoldNugget) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Osair_GoldNugget,Npc_HasItems(Trader,ItMi_Osair_GoldNugget));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_WhitePearl) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_WhitePearl,Npc_HasItems(Trader,ItMi_Addon_WhitePearl));
	};
	if(Npc_HasItems(Trader,ITMI_SPECIALJOINT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SPECIALJOINT,Npc_HasItems(Trader,ITMI_SPECIALJOINT));
	};
	if(Npc_HasItems(Trader,ItMi_BaltramPaket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BaltramPaket,Npc_HasItems(Trader,ItMi_BaltramPaket));
	};
	if(Npc_HasItems(Trader,ItMi_Packet_Baltram4Skip_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Packet_Baltram4Skip_Addon,Npc_HasItems(Trader,ItMi_Packet_Baltram4Skip_Addon));
	};
	if(Npc_HasItems(Trader,ItMi_BromorsGeld_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BromorsGeld_Addon,Npc_HasItems(Trader,ItMi_BromorsGeld_Addon));
	};
	if(Npc_HasItems(Trader,ItSe_ADDON_CavalornsBeutel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_ADDON_CavalornsBeutel,Npc_HasItems(Trader,ItSe_ADDON_CavalornsBeutel));	
	};
	if(Npc_HasItems(Trader,ItMi_Skull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Skull,Npc_HasItems(Trader,ItMi_Skull));
	};
	if(Npc_HasItems(Trader,ItMi_IECello) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IECello,Npc_HasItems(Trader,ItMi_IECello));
	};
	if(Npc_HasItems(Trader,ItMi_IEDrum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDrum,Npc_HasItems(Trader,ItMi_IEDrum));
	};
	if(Npc_HasItems(Trader,ItMi_IEDrumScheit) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDrumScheit,Npc_HasItems(Trader,ItMi_IEDrumScheit));
	};
	if(Npc_HasItems(Trader,ItMi_IEDrumStick) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDrumStick,Npc_HasItems(Trader,ItMi_IEDrumStick));
	};
	if(Npc_HasItems(Trader,ItMi_IEDudelBlau) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDudelBlau,Npc_HasItems(Trader,ItMi_IEDudelBlau));
	};
	if(Npc_HasItems(Trader,ItMi_IEDudelGelb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDudelGelb,Npc_HasItems(Trader,ItMi_IEDudelGelb));
	};
	if(Npc_HasItems(Trader,ItMi_IEHarfe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEHarfe,Npc_HasItems(Trader,ItMi_IEHarfe));
	};
	if(Npc_HasItems(Trader,ItMi_IELaute) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IELaute,Npc_HasItems(Trader,ItMi_IELaute));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_Lennar_Paket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Lennar_Paket,Npc_HasItems(Trader,ItMi_Addon_Lennar_Paket));
	};
	if(Npc_HasItems(Trader,ItMi_Zeitspalt_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Zeitspalt_Addon,Npc_HasItems(Trader,ItMi_Zeitspalt_Addon));
	};
	if(Npc_HasItems(Trader,ItMi_MoonStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MoonStone,Npc_HasItems(Trader,ItMi_MoonStone));
	};
	if(Npc_HasItems(Trader,ItMi_Adamant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Adamant,Npc_HasItems(Trader,ItMi_Adamant));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_Joint_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Joint_01,Npc_HasItems(Trader,ItMi_Addon_Joint_01));
	};
	if(Npc_HasItems(Trader,ITMI_JOINT_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_JOINT_02,Npc_HasItems(Trader,ITMI_JOINT_02));
	};
	if(Npc_HasItems(Trader,ITMI_JOINT_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_JOINT_03,Npc_HasItems(Trader,ITMI_JOINT_03));
	};
	if(Npc_HasItems(Trader,ItMi_Stomper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Stomper,Npc_HasItems(Trader,ItMi_Stomper));
	};
	if(Npc_HasItems(Trader,ITMI_BROTSCHIEBER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BROTSCHIEBER,Npc_HasItems(Trader,ITMI_BROTSCHIEBER));
	};
	if(Npc_HasItems(Trader,ItMi_RuneBlank) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_RuneBlank,Npc_HasItems(Trader,ItMi_RuneBlank));
	};
	if(Npc_HasItems(Trader,ItMi_PyroRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PyroRune,Npc_HasItems(Trader,ItMi_PyroRune));
	};
	if(Npc_HasItems(Trader,ItMi_GalomRuneBack) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GalomRuneBack,Npc_HasItems(Trader,ItMi_GalomRuneBack));
	};
	if(Npc_HasItems(Trader,ItMi_Pliers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pliers,Npc_HasItems(Trader,ItMi_Pliers));
	};
	if(Npc_HasItems(Trader,ItMi_AnvilPliers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AnvilPliers,Npc_HasItems(Trader,ItMi_AnvilPliers));
	};
	if(Npc_HasItems(Trader,ItMi_Flask) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Flask,Npc_HasItems(Trader,ItMi_Flask));
	};
	if(Npc_HasItems(Trader,ItMi_Hammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Hammer,Npc_HasItems(Trader,ItMi_Hammer));
	};
	if(Npc_HasItems(Trader,ItMi_Scoop) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Scoop,Npc_HasItems(Trader,ItMi_Scoop));
	};
	if(Npc_HasItems(Trader,ItMi_Pan) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pan,Npc_HasItems(Trader,ItMi_Pan));
	};
	if(Npc_HasItems(Trader,ItMi_PanFull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PanFull,Npc_HasItems(Trader,ItMi_PanFull));
	};
	if(Npc_HasItems(Trader,ItMi_Saw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Saw,Npc_HasItems(Trader,ItMi_Saw));
	};
	if(Npc_HasItems(Trader,ItMiSwordraw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMiSwordraw,Npc_HasItems(Trader,ItMiSwordraw));
	};
	if(Npc_HasItems(Trader,ITMISWORDRAWHOT_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMISWORDRAWHOT_1,Npc_HasItems(Trader,ITMISWORDRAWHOT_1));
	};
	if(Npc_HasItems(Trader,ItMiSwordbladehot) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMiSwordbladehot,Npc_HasItems(Trader,ItMiSwordbladehot));
	};
	if(Npc_HasItems(Trader,ITMISWORDBLADE_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMISWORDBLADE_1,Npc_HasItems(Trader,ITMISWORDBLADE_1));
	};
	if(Npc_HasItems(Trader,ItMi_Broom) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Broom,Npc_HasItems(Trader,ItMi_Broom));
	};
	if(Npc_HasItems(Trader,ItMi_Lute) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Lute,Npc_HasItems(Trader,ItMi_Lute));
	};
	if(Npc_HasItems(Trader,ItMi_Brush) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Brush,Npc_HasItems(Trader,ItMi_Brush));
	};
	if(Npc_HasItems(Trader,ItMi_Smoke_Pipe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Smoke_Pipe,Npc_HasItems(Trader,ItMi_Smoke_Pipe));
	};
	if(Npc_HasItems(Trader,ItMi_Joint) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Joint,Npc_HasItems(Trader,ItMi_Joint));
	};
	if(Npc_HasItems(Trader,ITMI_REDJOINT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_REDJOINT,Npc_HasItems(Trader,ITMI_REDJOINT));
	};
	if(Npc_HasItems(Trader,ItMi_Packet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Packet,Npc_HasItems(Trader,ItMi_Packet));
	};
	if(Npc_HasItems(Trader,ItMi_VatrasPacket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VatrasPacket,Npc_HasItems(Trader,ItMi_VatrasPacket));
	};
	if(Npc_HasItems(Trader,ItMi_Pocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pocket,Npc_HasItems(Trader,ItMi_Pocket));
	};
	if(Npc_HasItems(Trader,ItMi_Nugget) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Nugget,Npc_HasItems(Trader,ItMi_Nugget));
	};
	if(Npc_HasItems(Trader,ItMi_IronStuck) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IronStuck,Npc_HasItems(Trader,ItMi_IronStuck));
	};
	if(Npc_HasItems(Trader,ItMi_StuckGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_StuckGold,Npc_HasItems(Trader,ItMi_StuckGold));
	};
	if(Npc_HasItems(Trader,ItMi_OreStuck) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_OreStuck,Npc_HasItems(Trader,ItMi_OreStuck));
	};
	if(Npc_HasItems(Trader,ITMI_SNUGGET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SNUGGET,Npc_HasItems(Trader,ITMI_SNUGGET));
	};
	if(Npc_HasItems(Trader,ITMI_TESTNUGGET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TESTNUGGET,Npc_HasItems(Trader,ITMI_TESTNUGGET));
	};
	if(Npc_HasItems(Trader,ItMi_Gold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Gold,Npc_HasItems(Trader,ItMi_Gold));
	};
	if(Npc_HasItems(Trader,ItMi_OldCoin) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_OldCoin,Npc_HasItems(Trader,ItMi_OldCoin));
	};
	if(Npc_HasItems(Trader,ITMI_BELIAR_GOLD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BELIAR_GOLD,Npc_HasItems(Trader,ITMI_BELIAR_GOLD));
	};
	if(Npc_HasItems(Trader,ItMi_HolderGoldCandle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HolderGoldCandle,Npc_HasItems(Trader,ItMi_HolderGoldCandle));
	};
	if(Npc_HasItems(Trader,ItMi_NecklaceGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NecklaceGold,Npc_HasItems(Trader,ItMi_NecklaceGold));
	};
	if(Npc_HasItems(Trader,ItMi_SilverRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverRing,Npc_HasItems(Trader,ItMi_SilverRing));
	};
	if(Npc_HasItems(Trader,ItMi_SilverCup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverCup,Npc_HasItems(Trader,ItMi_SilverCup));
	};
	if(Npc_HasItems(Trader,ItMi_SilverPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverPlate,Npc_HasItems(Trader,ItMi_SilverPlate));
	};
	if(Npc_HasItems(Trader,ItMi_PlateGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PlateGold,Npc_HasItems(Trader,ItMi_PlateGold));
	};
	if(Npc_HasItems(Trader,ItMi_CupGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CupGold,Npc_HasItems(Trader,ItMi_CupGold));
	};
	if(Npc_HasItems(Trader,ItMi_HarimCup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HarimCup,Npc_HasItems(Trader,ItMi_HarimCup));
	};
	if(Npc_HasItems(Trader,ITMI_GOMEZGOLDCUP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_GOMEZGOLDCUP,Npc_HasItems(Trader,ITMI_GOMEZGOLDCUP));
	};
	if(Npc_HasItems(Trader,ItMi_ZloodCup_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZloodCup_MIS,Npc_HasItems(Trader,ItMi_ZloodCup_MIS));
	};
	if(Npc_HasItems(Trader,ItMi_RingGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_RingGold,Npc_HasItems(Trader,ItMi_RingGold));
	};
	if(Npc_HasItems(Trader,ITMI_RAVENGOLDRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_RAVENGOLDRING,Npc_HasItems(Trader,ITMI_RAVENGOLDRING));
	};
	if(Npc_HasItems(Trader,ItMi_SilverChalice) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverChalice,Npc_HasItems(Trader,ItMi_SilverChalice));
	};
	if(Npc_HasItems(Trader,ItMi_ChaliceGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ChaliceGold,Npc_HasItems(Trader,ItMi_ChaliceGold));
	};
	if(Npc_HasItems(Trader,ItMi_ChestGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ChestGold,Npc_HasItems(Trader,ItMi_ChestGold));
	};
	if(Npc_HasItems(Trader,ItMi_JeweleryChest) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JeweleryChest,Npc_HasItems(Trader,ItMi_JeweleryChest));
	};
	if(Npc_HasItems(Trader,ITMI_CHEST_EMPTYGOLD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_CHEST_EMPTYGOLD,Npc_HasItems(Trader,ITMI_CHEST_EMPTYGOLD));
	};
	if(Npc_HasItems(Trader,ITMI_JEWELERYCHEST_EMPTY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_JEWELERYCHEST_EMPTY,Npc_HasItems(Trader,ITMI_JEWELERYCHEST_EMPTY));
	};
	if(Npc_HasItems(Trader,ItMi_InnosStatue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosStatue,Npc_HasItems(Trader,ItMi_InnosStatue));
	};
	if(Npc_HasItems(Trader,ItMi_Statue_Demon_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Statue_Demon_01,Npc_HasItems(Trader,ItMi_Statue_Demon_01));
	};
	if(Npc_HasItems(Trader,ITMI_ANTIENTSTATUE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ANTIENTSTATUE,Npc_HasItems(Trader,ITMI_ANTIENTSTATUE));
	};
	if(Npc_HasItems(Trader,ITMI_INNOSMRAMORSTATUE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_INNOSMRAMORSTATUE,Npc_HasItems(Trader,ITMI_INNOSMRAMORSTATUE));
	};
	if(Npc_HasItems(Trader,ItMi_Sextant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Sextant,Npc_HasItems(Trader,ItMi_Sextant));
	};
	if(Npc_HasItems(Trader,ItMi_SilverCandleHolder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverCandleHolder,Npc_HasItems(Trader,ItMi_SilverCandleHolder));
	};
	if(Npc_HasItems(Trader,ItMi_SilverNecklace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverNecklace,Npc_HasItems(Trader,ItMi_SilverNecklace));
	};
	if(Npc_HasItems(Trader,ItMi_Sulfur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Sulfur,Npc_HasItems(Trader,ItMi_Sulfur));
	};
	if(Npc_HasItems(Trader,ItMi_Quartz) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Quartz,Npc_HasItems(Trader,ItMi_Quartz));
	};
	if(Npc_HasItems(Trader,ItMi_Pitch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pitch,Npc_HasItems(Trader,ItMi_Pitch));
	};
	if(Npc_HasItems(Trader,ItMi_Rockcrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Rockcrystal,Npc_HasItems(Trader,ItMi_Rockcrystal));
	};
	if(Npc_HasItems(Trader,ItMi_Aquamarine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Aquamarine,Npc_HasItems(Trader,ItMi_Aquamarine));
	};
	if(Npc_HasItems(Trader,ItMi_HolyWater) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HolyWater,Npc_HasItems(Trader,ItMi_HolyWater));
	};
	if(Npc_HasItems(Trader,ItMi_Coal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Coal,Npc_HasItems(Trader,ItMi_Coal));
	};
	if(Npc_HasItems(Trader,ItMi_DarkPearl) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DarkPearl,Npc_HasItems(Trader,ItMi_DarkPearl));
	};
	if(Npc_HasItems(Trader,ItMi_ApfelTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ApfelTabak,Npc_HasItems(Trader,ItMi_ApfelTabak));
	};
	if(Npc_HasItems(Trader,ItMi_PilzTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PilzTabak,Npc_HasItems(Trader,ItMi_PilzTabak));
	};
	if(Npc_HasItems(Trader,ItMi_DoppelTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DoppelTabak,Npc_HasItems(Trader,ItMi_DoppelTabak));
	};
	if(Npc_HasItems(Trader,ItMi_Honigtabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Honigtabak,Npc_HasItems(Trader,ItMi_Honigtabak));
	};
	if(Npc_HasItems(Trader,ItMi_SumpfTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SumpfTabak,Npc_HasItems(Trader,ItMi_SumpfTabak));
	};
	if(Npc_HasItems(Trader,ItMi_Hasish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Hasish,Npc_HasItems(Trader,ItMi_Hasish));
	};
	if(Npc_HasItems(Trader,ITMI_QUICKSILVER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_QUICKSILVER,Npc_HasItems(Trader,ITMI_QUICKSILVER));
	};
	if(Npc_HasItems(Trader,ITMI_HORN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_HORN,Npc_HasItems(Trader,ITMI_HORN));
	};
	if(Npc_HasItems(Trader,ITMI_ORCRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCRING,Npc_HasItems(Trader,ITMI_ORCRING));
	};
	if(Npc_HasItems(Trader,ITMI_ORCSTAFF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCSTAFF,Npc_HasItems(Trader,ITMI_ORCSTAFF));
	};
	if(Npc_HasItems(Trader,ITMI_ORCAMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCAMULET,Npc_HasItems(Trader,ITMI_ORCAMULET));
	};
	if(Npc_HasItems(Trader,ITMI_ORCAMULET_VANHAN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCAMULET_VANHAN,Npc_HasItems(Trader,ITMI_ORCAMULET_VANHAN));
	};
	if(Npc_HasItems(Trader,ITMI_IDOL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_IDOL_01,Npc_HasItems(Trader,ITMI_IDOL_01));
	};
	if(Npc_HasItems(Trader,ITMI_IDOL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_IDOL_02,Npc_HasItems(Trader,ITMI_IDOL_02));
	};
	if(Npc_HasItems(Trader,ITMI_IDOL_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_IDOL_03,Npc_HasItems(Trader,ITMI_IDOL_03));
	};
	if(Npc_HasItems(Trader,ITMI_CRYSTALBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_CRYSTALBLACK,Npc_HasItems(Trader,ITMI_CRYSTALBLACK));
	};
	if(Npc_HasItems(Trader,ITMI_1_ORCPORTALSTONE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_1_ORCPORTALSTONE,Npc_HasItems(Trader,ITMI_1_ORCPORTALSTONE));
	};
	if(Npc_HasItems(Trader,ITMI_2_ORCPORTALSTONE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_2_ORCPORTALSTONE,Npc_HasItems(Trader,ITMI_2_ORCPORTALSTONE));
	};
	if(Npc_HasItems(Trader,ITMI_DRAGONGOLDFOCUS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DRAGONGOLDFOCUS,Npc_HasItems(Trader,ITMI_DRAGONGOLDFOCUS));
	};
	if(Npc_HasItems(Trader,ITMI_FISKPACKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FISKPACKET,Npc_HasItems(Trader,ITMI_FISKPACKET));
	};
	if(Npc_HasItems(Trader,ITMI_COALBAG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_COALBAG,Npc_HasItems(Trader,ITMI_COALBAG));
	};
	if(Npc_HasItems(Trader,ITMI_ALEFNUGGETSBAG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ALEFNUGGETSBAG,Npc_HasItems(Trader,ITMI_ALEFNUGGETSBAG));
	};
	if(Npc_HasItems(Trader,ITMI_FIRESHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FIRESHPERE,Npc_HasItems(Trader,ITMI_FIRESHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_WATERSHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_WATERSHPERE,Npc_HasItems(Trader,ITMI_WATERSHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_STONESHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STONESHPERE,Npc_HasItems(Trader,ITMI_STONESHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_DARKSHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DARKSHPERE,Npc_HasItems(Trader,ITMI_DARKSHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_TRIRAMAR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TRIRAMAR,Npc_HasItems(Trader,ITMI_TRIRAMAR));
	};
	if(Npc_HasItems(Trader,ITMI_PALADINCHEST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PALADINCHEST,Npc_HasItems(Trader,ITMI_PALADINCHEST));
	};
	if(Npc_HasItems(Trader,ITMI_DRAGONGOLDGORN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DRAGONGOLDGORN,Npc_HasItems(Trader,ITMI_DRAGONGOLDGORN));
	};
	if(Npc_HasItems(Trader,ITMI_STONESOUL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STONESOUL,Npc_HasItems(Trader,ITMI_STONESOUL));
	};
	if(Npc_HasItems(Trader,ITMI_BENGARPACKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BENGARPACKET,Npc_HasItems(Trader,ITMI_BENGARPACKET));
	};
	if(Npc_HasItems(Trader,ITMI_BLACKBRENDI) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BLACKBRENDI,Npc_HasItems(Trader,ITMI_BLACKBRENDI));
	};
	if(Npc_HasItems(Trader,ITMI_HANNAGOLDNECKLACE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_HANNAGOLDNECKLACE,Npc_HasItems(Trader,ITMI_HANNAGOLDNECKLACE));
	};
	if(Npc_HasItems(Trader,ItMi_Salt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Salt,Npc_HasItems(Trader,ItMi_Salt));
	};
	if(Npc_HasItems(Trader,ITMI_SLEEPSACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SLEEPSACK,Npc_HasItems(Trader,ITMI_SLEEPSACK));
	};
	if(Npc_HasItems(Trader,ITMI_SLEEPSACK_TEMP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SLEEPSACK_TEMP,Npc_HasItems(Trader,ITMI_SLEEPSACK_TEMP));
	};
	if(Npc_HasItems(Trader,ItAr_Hut) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Hut,Npc_HasItems(Trader,ItAr_Hut));
	};
	if(Npc_HasItems(Trader,ItAr_ThiefHut) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_ThiefHut,Npc_HasItems(Trader,ItAr_ThiefHut));
	};
	if(Npc_HasItems(Trader,ItAr_PirateHat) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_PirateHat,Npc_HasItems(Trader,ItAr_PirateHat));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_01,Npc_HasItems(Trader,ItAr_Helm_01));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_New_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_New_01,Npc_HasItems(Trader,ItAr_Helm_New_01));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_New_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_New_02,Npc_HasItems(Trader,ItAr_Helm_New_02));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_02,Npc_HasItems(Trader,ItAr_Helm_02));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Hunt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Hunt,Npc_HasItems(Trader,ItAr_Helm_Hunt));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_03,Npc_HasItems(Trader,ItAr_Helm_03));
	};
	if(Npc_HasItems(Trader,ItAr_Pal_Helm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Pal_Helm,Npc_HasItems(Trader,ItAr_Pal_Helm));
	};
	if(Npc_HasItems(Trader,ItAr_Pal_Helm_Open) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Pal_Helm_Open,Npc_HasItems(Trader,ItAr_Pal_Helm_Open));
	};
	if(Npc_HasItems(Trader,ItAr_DJG_Helm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_DJG_Helm,Npc_HasItems(Trader,ItAr_DJG_Helm));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Demon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Demon,Npc_HasItems(Trader,ItAr_Helm_Demon));
	};
	if(Npc_HasItems(Trader,G3_ARMOR_HELMET_CRONE) > 0)
	{
		Npc_RemoveInvItems(Trader,G3_ARMOR_HELMET_CRONE,Npc_HasItems(Trader,G3_ARMOR_HELMET_CRONE));
	};
	if(Npc_HasItems(Trader,ItAr_God_Helm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_God_Helm,Npc_HasItems(Trader,ItAr_God_Helm));
	};
	if(Npc_HasItems(Trader,ITMI_SLEEPERHELM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SLEEPERHELM,Npc_HasItems(Trader,ITMI_SLEEPERHELM));
	};
	if(Npc_HasItems(Trader,ITMI_HELMSLEEPER_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_HELMSLEEPER_MIS,Npc_HasItems(Trader,ITMI_HELMSLEEPER_MIS));
	};
	if(Npc_HasItems(Trader,ITMI_KOMPAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_KOMPAS,Npc_HasItems(Trader,ITMI_KOMPAS));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_01,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_01));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_02,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_02));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_03,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_03));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_04,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_04));
	};
	if(Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STUFF_GEARWHEEL_01,Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_01));
	};
	if(Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STUFF_GEARWHEEL_02,Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_02));
	};
	if(Npc_HasItems(Trader,ITMI_MISSTORLOFTHING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_MISSTORLOFTHING,Npc_HasItems(Trader,ITMI_MISSTORLOFTHING));
	};
	if(Npc_HasItems(Trader,ITMI_NERGALCORPSE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_NERGALCORPSE,Npc_HasItems(Trader,ITMI_NERGALCORPSE));
	};
	if(Npc_HasItems(Trader,ITMI_ZOMBIECORPSE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ZOMBIECORPSE,Npc_HasItems(Trader,ITMI_ZOMBIECORPSE));
	};
	if(Npc_HasItems(Trader,ITMI_PLAZMA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PLAZMA,Npc_HasItems(Trader,ITMI_PLAZMA));
	};
	if(Npc_HasItems(Trader,ITMI_GADERSTONE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_GADERSTONE,Npc_HasItems(Trader,ITMI_GADERSTONE));
	};
	if(Npc_HasItems(Trader,ITMI_WATERCRYSTAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_WATERCRYSTAL,Npc_HasItems(Trader,ITMI_WATERCRYSTAL));
	};
	if(Npc_HasItems(Trader,ITMI_PIECEDARKGOLEM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PIECEDARKGOLEM,Npc_HasItems(Trader,ITMI_PIECEDARKGOLEM));
	};
	if(Npc_HasItems(Trader,ITMI_ORCMAINTOTEM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCMAINTOTEM,Npc_HasItems(Trader,ITMI_ORCMAINTOTEM));
	};
	if(Npc_HasItems(Trader,ItMi_GrahShar) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GrahShar,Npc_HasItems(Trader,ItMi_GrahShar));
	};
	if(Npc_HasItems(Trader,ITMI_POISONBOTTLE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_POISONBOTTLE,Npc_HasItems(Trader,ITMI_POISONBOTTLE));
	};
	if(Npc_HasItems(Trader,ITMI_ADANOSAMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ADANOSAMULET,Npc_HasItems(Trader,ITMI_ADANOSAMULET));
	};
	if(Npc_HasItems(Trader,ITMI_ORCWARHORN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCWARHORN,Npc_HasItems(Trader,ITMI_ORCWARHORN));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOrePliers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOrePliers,Npc_HasItems(Trader,ItMi_MagicOrePliers));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_5,Npc_HasItems(Trader,ItMi_MagicOreRaw_5));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_4,Npc_HasItems(Trader,ItMi_MagicOreRaw_4));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_3,Npc_HasItems(Trader,ItMi_MagicOreRaw_3));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_2,Npc_HasItems(Trader,ItMi_MagicOreRaw_2));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_1,Npc_HasItems(Trader,ItMi_MagicOreRaw_1));
	};
	if(Npc_HasItems(Trader,ItWr_DragNimrod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DragNimrod,Npc_HasItems(Trader,ItWr_DragNimrod));
	};
	if(Npc_HasItems(Trader,ITMI_SeekerSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SeekerSoul,Npc_HasItems(Trader,ITMI_SeekerSoul));
	};
	if(Npc_HasItems(Trader,ITMI_NOVMATERIAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_NOVMATERIAL,Npc_HasItems(Trader,ITMI_NOVMATERIAL));
	};
	if(Npc_HasItems(Trader,ItMi_AssGoldPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AssGoldPocket,Npc_HasItems(Trader,ItMi_AssGoldPocket));
	};
	if(Npc_HasItems(Trader,ItMi_HasimAmuls) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HasimAmuls,Npc_HasItems(Trader,ItMi_HasimAmuls));
	};
	if(Npc_HasItems(Trader,ItMi_PacketColesulfur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PacketColesulfur,Npc_HasItems(Trader,ItMi_PacketColesulfur));
	};
	if(Npc_HasItems(Trader,ItMi_SulfurMuttonRaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SulfurMuttonRaw,Npc_HasItems(Trader,ItMi_SulfurMuttonRaw));
	};
	if(Npc_HasItems(Trader,ItMi_Feder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Feder,Npc_HasItems(Trader,ItMi_Feder));
	};
	if(Npc_HasItems(Trader,ItMi_HarpyFeder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HarpyFeder,Npc_HasItems(Trader,ItMi_HarpyFeder));
	};
	if(Npc_HasItems(Trader,ItMi_Palette) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Palette,Npc_HasItems(Trader,ItMi_Palette));
	};
	if(Npc_HasItems(Trader,ItMi_Pinsel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pinsel,Npc_HasItems(Trader,ItMi_Pinsel));
	};
	if(Npc_HasItems(Trader,ItMi_Bottle_Empty) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Bottle_Empty,Npc_HasItems(Trader,ItMi_Bottle_Empty));
	};
	if(Npc_HasItems(Trader,ItWr_CroneAdanos) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CroneAdanos,Npc_HasItems(Trader,ItWr_CroneAdanos));
	};
	if(Npc_HasItems(Trader,ItWr_AdanosCrone_Ready) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AdanosCrone_Ready,Npc_HasItems(Trader,ItWr_AdanosCrone_Ready));
	};
	if(Npc_HasItems(Trader,ItMi_PortalRuneAdanos) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PortalRuneAdanos,Npc_HasItems(Trader,ItMi_PortalRuneAdanos));
	};
	if(Npc_HasItems(Trader,ItWr_StoneAdanosPortal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StoneAdanosPortal,Npc_HasItems(Trader,ItWr_StoneAdanosPortal));
	};
	if(Npc_HasItems(Trader,ItMi_XoD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_XoD_01,Npc_HasItems(Trader,ItMi_XoD_01));
	};
	if(Npc_HasItems(Trader,ItMi_YoD_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YoD_02,Npc_HasItems(Trader,ItMi_YoD_02));
	};
	if(Npc_HasItems(Trader,ItMi_ZoD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZoD_03,Npc_HasItems(Trader,ItMi_ZoD_03));
	};
	if(Npc_HasItems(Trader,ItMi_UoD_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UoD_04,Npc_HasItems(Trader,ItMi_UoD_04));
	};
	if(Npc_HasItems(Trader,ItMi_AdanosTear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AdanosTear,Npc_HasItems(Trader,ItMi_AdanosTear));
	};
	if(Npc_HasItems(Trader,ItRi_GoldSkipetr_NoMagic) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_GoldSkipetr_NoMagic,Npc_HasItems(Trader,ItRi_GoldSkipetr_NoMagic));
	};
	if(Npc_HasItems(Trader,ItRi_AdanosGoldSkipetr) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_AdanosGoldSkipetr,Npc_HasItems(Trader,ItRi_AdanosGoldSkipetr));
	};
	if(Npc_HasItems(Trader,ItMi_XunePart_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_XunePart_01,Npc_HasItems(Trader,ItMi_XunePart_01));
	};
	if(Npc_HasItems(Trader,ItMi_ZunePart_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZunePart_02,Npc_HasItems(Trader,ItMi_ZunePart_02));
	};
	if(Npc_HasItems(Trader,ItMi_YunePart_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YunePart_03,Npc_HasItems(Trader,ItMi_YunePart_03));
	};
	if(Npc_HasItems(Trader,ItMi_WunePart_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_WunePart_04,Npc_HasItems(Trader,ItMi_WunePart_04));
	};
	if(Npc_HasItems(Trader,ItMi_UunePart_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UunePart_05,Npc_HasItems(Trader,ItMi_UunePart_05));
	};
	if(Npc_HasItems(Trader,ItMi_DuneAdanos) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DuneAdanos,Npc_HasItems(Trader,ItMi_DuneAdanos));
	};
	if(Npc_HasItems(Trader,ItMi_GuneAdanos_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GuneAdanos_02,Npc_HasItems(Trader,ItMi_GuneAdanos_02));
	};
	if(Npc_HasItems(Trader,ItMi_LuneAdanos_Full) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_LuneAdanos_Full,Npc_HasItems(Trader,ItMi_LuneAdanos_Full));
	};
	if(Npc_HasItems(Trader,ItMi_TearsRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TearsRune,Npc_HasItems(Trader,ItMi_TearsRune));
	};
	if(Npc_HasItems(Trader,ItMi_BlackOrcTalisman) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BlackOrcTalisman,Npc_HasItems(Trader,ItMi_BlackOrcTalisman));
	};
	if(Npc_HasItems(Trader,ItMi_HuntSign) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HuntSign,Npc_HasItems(Trader,ItMi_HuntSign));
	};
	if(Npc_HasItems(Trader,ItMi_BukTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BukTree,Npc_HasItems(Trader,ItMi_BukTree));
	};
	if(Npc_HasItems(Trader,ItMi_Buk_Arbalet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Buk_Arbalet,Npc_HasItems(Trader,ItMi_Buk_Arbalet));
	};
	if(Npc_HasItems(Trader,ItAt_BlackTrollHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BlackTrollHorn,Npc_HasItems(Trader,ItAt_BlackTrollHorn));
	};
	if(Npc_HasItems(Trader,ItAt_PumaMuscle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_PumaMuscle,Npc_HasItems(Trader,ItAt_PumaMuscle));
	};
	if(Npc_HasItems(Trader,ItAt_PumaMuscle_Jir) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_PumaMuscle_Jir,Npc_HasItems(Trader,ItAt_PumaMuscle_Jir));
	};
	if(Npc_HasItems(Trader,ItWr_OldTextMine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OldTextMine,Npc_HasItems(Trader,ItWr_OldTextMine));
	};
	if(Npc_HasItems(Trader,ItMi_PortalCrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PortalCrystal,Npc_HasItems(Trader,ItMi_PortalCrystal));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_01,Npc_HasItems(Trader,ItAr_Helm_G3_01));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_02,Npc_HasItems(Trader,ItAr_Helm_G3_02));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_04,Npc_HasItems(Trader,ItAr_Helm_G3_04));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_06,Npc_HasItems(Trader,ItAr_Helm_G3_06));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel_Low,Npc_HasItems(Trader,ItAr_Helm_Skel_Low));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel,Npc_HasItems(Trader,ItAr_Helm_Skel));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel_Elite,Npc_HasItems(Trader,ItAr_Helm_Skel_Elite));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel_King) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel_King,Npc_HasItems(Trader,ItAr_Helm_Skel_King));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Avabul) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Avabul,Npc_HasItems(Trader,ItAr_Helm_Avabul));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Janus) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Janus,Npc_HasItems(Trader,ItAr_Helm_Janus));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Egezart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Egezart,Npc_HasItems(Trader,ItAr_Helm_Egezart));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_01,Npc_HasItems(Trader,ItMi_DragonStaffPiece_01));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_02,Npc_HasItems(Trader,ItMi_DragonStaffPiece_02));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_03,Npc_HasItems(Trader,ItMi_DragonStaffPiece_03));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_04,Npc_HasItems(Trader,ItMi_DragonStaffPiece_04));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_Eye) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_Eye,Npc_HasItems(Trader,ItMi_DragonStaffPiece_Eye));
	};
	if(Npc_HasItems(Trader,ItMi_SteelForm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SteelForm,Npc_HasItems(Trader,ItMi_SteelForm));
	};
	if(Npc_HasItems(Trader,ItMi_Diamod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Diamod,Npc_HasItems(Trader,ItMi_Diamod));
	};
	if(Npc_HasItems(Trader,ItMi_Emerald) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Emerald,Npc_HasItems(Trader,ItMi_Emerald));
	};
	if(Npc_HasItems(Trader,ItMi_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Ruby,Npc_HasItems(Trader,ItMi_Ruby));
	};
	if(Npc_HasItems(Trader,ItMi_Sapphire) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Sapphire,Npc_HasItems(Trader,ItMi_Sapphire));
	};
	if(Npc_HasItems(Trader,ItMi_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Opal,Npc_HasItems(Trader,ItMi_Opal));
	};
	if(Npc_HasItems(Trader,ItMi_Topaz) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Topaz,Npc_HasItems(Trader,ItMi_Topaz));
	};
	if(Npc_HasItems(Trader,ItMi_GroshBottle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GroshBottle,Npc_HasItems(Trader,ItMi_GroshBottle));
	};
	if(Npc_HasItems(Trader,ItMi_ZharpStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZharpStone,Npc_HasItems(Trader,ItMi_ZharpStone));
	};
	if(Npc_HasItems(Trader,ItMi_AncientRuneStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AncientRuneStone,Npc_HasItems(Trader,ItMi_AncientRuneStone));
	};
	if(Npc_HasItems(Trader,ItMi_NecrUrn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NecrUrn,Npc_HasItems(Trader,ItMi_NecrUrn));
	};
	if(Npc_HasItems(Trader,ItMi_BigRuby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BigRuby,Npc_HasItems(Trader,ItMi_BigRuby));
	};
	if(Npc_HasItems(Trader,ItMi_DiamondChoker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DiamondChoker,Npc_HasItems(Trader,ItMi_DiamondChoker));
	};
	if(Npc_HasItems(Trader,ItMi_HuntHornGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HuntHornGold,Npc_HasItems(Trader,ItMi_HuntHornGold));
	};
	if(Npc_HasItems(Trader,ItMi_KnifeGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KnifeGold,Npc_HasItems(Trader,ItMi_KnifeGold));
	};
	if(Npc_HasItems(Trader,ItMi_OreBaronCrown) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_OreBaronCrown,Npc_HasItems(Trader,ItMi_OreBaronCrown));
	};
	if(Npc_HasItems(Trader,ItMi_Wax) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Wax,Npc_HasItems(Trader,ItMi_Wax));
	};
	if(Npc_HasItems(Trader,ItWr_Seamap_Mirtana) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Seamap_Mirtana,Npc_HasItems(Trader,ItWr_Seamap_Mirtana));
	};
	if(Npc_HasItems(Trader,ItAr_ShrecHelm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_ShrecHelm,Npc_HasItems(Trader,ItAr_ShrecHelm));
	};
	if(Npc_HasItems(Trader,ItWr_KrowBook) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_KrowBook,Npc_HasItems(Trader,ItWr_KrowBook));
	};
	if(Npc_HasItems(Trader,ItMi_StoneGuardianPiece) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_StoneGuardianPiece,Npc_HasItems(Trader,ItMi_StoneGuardianPiece));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_01,Npc_HasItems(Trader,ItMi_BowRope_01));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_02,Npc_HasItems(Trader,ItMi_BowRope_02));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_03,Npc_HasItems(Trader,ItMi_BowRope_03));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_04,Npc_HasItems(Trader,ItMi_BowRope_04));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_05,Npc_HasItems(Trader,ItMi_BowRope_05));
	};
	if(Npc_HasItems(Trader,ItMi_JustTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JustTree,Npc_HasItems(Trader,ItMi_JustTree));
	};
	if(Npc_HasItems(Trader,ItMi_EveTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_EveTree,Npc_HasItems(Trader,ItMi_EveTree));
	};
	if(Npc_HasItems(Trader,ItMi_VyzTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VyzTree,Npc_HasItems(Trader,ItMi_VyzTree));
	};
	if(Npc_HasItems(Trader,ItMi_YsuoTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YsuoTree,Npc_HasItems(Trader,ItMi_YsuoTree));
	};
	if(Npc_HasItems(Trader,ItMi_BokTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BokTree,Npc_HasItems(Trader,ItMi_BokTree));
	};
	if(Npc_HasItems(Trader,ItMi_JustBowCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JustBowCorpse,Npc_HasItems(Trader,ItMi_JustBowCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_EveCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_EveCorpse,Npc_HasItems(Trader,ItMi_EveCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_VyzCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VyzCorpse,Npc_HasItems(Trader,ItMi_VyzCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_YsuoCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YsuoCorpse,Npc_HasItems(Trader,ItMi_YsuoCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_BokCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BokCorpse,Npc_HasItems(Trader,ItMi_BokCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportStone,Npc_HasItems(Trader,ItMi_TeleportStone));
	};
	if(Npc_HasItems(Trader,ItMi_Fitil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Fitil,Npc_HasItems(Trader,ItMi_Fitil));
	};
	if(Npc_HasItems(Trader,ItMi_CanoneBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CanoneBall,Npc_HasItems(Trader,ItMi_CanoneBall));
	};
	if(Npc_HasItems(Trader,ItMi_CanoneBall_Fire) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CanoneBall_Fire,Npc_HasItems(Trader,ItMi_CanoneBall_Fire));
	};
	if(Npc_HasItems(Trader,ItMi_MagicPowder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicPowder,Npc_HasItems(Trader,ItMi_MagicPowder));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportFarm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportFarm,Npc_HasItems(Trader,ItMi_TeleportFarm));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportTaverne) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportTaverne,Npc_HasItems(Trader,ItMi_TeleportTaverne));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportPsicamp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportPsicamp,Npc_HasItems(Trader,ItMi_TeleportPsicamp));
	};
	if(Npc_HasItems(Trader,CA_ITMI_BRANCH) > 0)
	{
		Npc_RemoveInvItems(Trader,CA_ITMI_BRANCH,Npc_HasItems(Trader,CA_ITMI_BRANCH));
	};
	if(Npc_HasItems(Trader,ItMi_BeliarPowerStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BeliarPowerStone,Npc_HasItems(Trader,ItMi_BeliarPowerStone));
	};
	if(Npc_HasItems(Trader,ItBg_Armor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Armor,Npc_HasItems(Trader,ItBg_Armor));
	};
	if(Npc_HasItems(Trader,ItBg_Weapon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Weapon,Npc_HasItems(Trader,ItBg_Weapon));
	};
	if(Npc_HasItems(Trader,ItBg_Alchemy) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Alchemy,Npc_HasItems(Trader,ItBg_Alchemy));
	};
	if(Npc_HasItems(Trader,ItBg_Mage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Mage,Npc_HasItems(Trader,ItBg_Mage));
	};
	if(Npc_HasItems(Trader,ItBg_Jewerly) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Jewerly,Npc_HasItems(Trader,ItBg_Jewerly));
	};
	if(Npc_HasItems(Trader,ItBg_PlatsFood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_PlatsFood,Npc_HasItems(Trader,ItBg_PlatsFood));
	};
	if(Npc_HasItems(Trader,ItBg_Trash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Trash,Npc_HasItems(Trader,ItBg_Trash));
	};
	if(Npc_HasItems(Trader,ItPl_ExBlueMalve) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_ExBlueMalve,Npc_HasItems(Trader,ItPl_ExBlueMalve));
	};
	if(Npc_HasItems(Trader,ItMi_BlackPearlNeckle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BlackPearlNeckle,Npc_HasItems(Trader,ItMi_BlackPearlNeckle));
	};
	if(Npc_HasItems(Trader,ITMI_SONJAWIG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SONJAWIG,Npc_HasItems(Trader,ITMI_SONJAWIG));
	};
	if(Npc_HasItems(Trader,ItMw_Kirka_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kirka_New,Npc_HasItems(Trader,ItMw_Kirka_New));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Axe_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Axe_L_01,Npc_HasItems(Trader,ItMw_2H_Axe_L_01));
	};
	if(Npc_HasItems(Trader,ItMi_FlyCarpet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_FlyCarpet,Npc_HasItems(Trader,ItMi_FlyCarpet));
	};
	if(Npc_HasItems(Trader,ItSe_FlyCarpet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_FlyCarpet,Npc_HasItems(Trader,ItSe_FlyCarpet));
	};
	if(Npc_HasItems(Trader,ItPl_Weed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Weed,Npc_HasItems(Trader,ItPl_Weed));
	};
	if(Npc_HasItems(Trader,ItPl_UnWeed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_UnWeed,Npc_HasItems(Trader,ItPl_UnWeed));
	};
	if(Npc_HasItems(Trader,ItPl_Beet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Beet,Npc_HasItems(Trader,ItPl_Beet));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb,Npc_HasItems(Trader,ItPl_SwampHerb));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb_Balam_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb_Balam_01,Npc_HasItems(Trader,ItPl_SwampHerb_Balam_01));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb_Balam_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb_Balam_02,Npc_HasItems(Trader,ItPl_SwampHerb_Balam_02));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb_Balam_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb_Balam_03,Npc_HasItems(Trader,ItPl_SwampHerb_Balam_03));
	};
	if(Npc_HasItems(Trader,ITPL_SWAMPHERB_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPL_SWAMPHERB_02,Npc_HasItems(Trader,ITPL_SWAMPHERB_02));
	};
	if(Npc_HasItems(Trader,ItPl_Mana_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mana_Herb_01,Npc_HasItems(Trader,ItPl_Mana_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Mana_Herb_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mana_Herb_02,Npc_HasItems(Trader,ItPl_Mana_Herb_02));
	};
	if(Npc_HasItems(Trader,ItPl_Mana_Herb_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mana_Herb_03,Npc_HasItems(Trader,ItPl_Mana_Herb_03));
	};
	if(Npc_HasItems(Trader,ItPl_NetbekPlant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_NetbekPlant,Npc_HasItems(Trader,ItPl_NetbekPlant));
	};
	if(Npc_HasItems(Trader,ItPl_Health_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Health_Herb_01,Npc_HasItems(Trader,ItPl_Health_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Health_Herb_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Health_Herb_02,Npc_HasItems(Trader,ItPl_Health_Herb_02));
	};
	if(Npc_HasItems(Trader,ItPl_Health_Herb_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Health_Herb_03,Npc_HasItems(Trader,ItPl_Health_Herb_03));
	};
	if(Npc_HasItems(Trader,ItPl_Dex_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Dex_Herb_01,Npc_HasItems(Trader,ItPl_Dex_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Strength_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Strength_Herb_01,Npc_HasItems(Trader,ItPl_Strength_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Speed_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Speed_Herb_01,Npc_HasItems(Trader,ItPl_Speed_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Mushroom_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mushroom_01,Npc_HasItems(Trader,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(Trader,ItPl_Mushroom_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mushroom_02,Npc_HasItems(Trader,ItPl_Mushroom_02));
	};
	if(Npc_HasItems(Trader,ItPl_Blueplant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Blueplant,Npc_HasItems(Trader,ItPl_Blueplant));
	};
	if(Npc_HasItems(Trader,ItPl_Forestberry) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Forestberry,Npc_HasItems(Trader,ItPl_Forestberry));
	};
	if(Npc_HasItems(Trader,ItPl_Planeberry) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Planeberry,Npc_HasItems(Trader,ItPl_Planeberry));
	};
	if(Npc_HasItems(Trader,ItPl_Temp_Herb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Temp_Herb,Npc_HasItems(Trader,ItPl_Temp_Herb));
	};
	if(Npc_HasItems(Trader,ItPl_Perm_Herb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Perm_Herb,Npc_HasItems(Trader,ItPl_Perm_Herb));
	};
	if(Npc_HasItems(Trader,ITPL_SUPER_HERB) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPL_SUPER_HERB,Npc_HasItems(Trader,ITPL_SUPER_HERB));
	};
	if(Npc_HasItems(Trader,ItPl_CactusFlower) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_CactusFlower,Npc_HasItems(Trader,ItPl_CactusFlower));
	};
	if(Npc_HasItems(Trader,ITPL_DesertIll) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPL_DesertIll,Npc_HasItems(Trader,ITPL_DesertIll));
	};
	if(Npc_HasItems(Trader,ItPl_MagicRoot) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_MagicRoot,Npc_HasItems(Trader,ItPl_MagicRoot));
	};
	if(Npc_HasItems(Trader,ItPl_DarkClover) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_DarkClover,Npc_HasItems(Trader,ItPl_DarkClover));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_01,Npc_HasItems(Trader,ItPo_Mana_01));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_02,Npc_HasItems(Trader,ItPo_Mana_02));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_03,Npc_HasItems(Trader,ItPo_Mana_03));
	};
	if(Npc_HasItems(Trader,ItPo_Health_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_01,Npc_HasItems(Trader,ItPo_Health_01));
	};
	if(Npc_HasItems(Trader,ItPo_Health_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_02,Npc_HasItems(Trader,ItPo_Health_02));
	};
	if(Npc_HasItems(Trader,ItPo_Health_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_03,Npc_HasItems(Trader,ItPo_Health_03));
	};
	if(Npc_HasItems(Trader,ItPo_Health_Addon_04_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_Addon_04_New,Npc_HasItems(Trader,ItPo_Health_Addon_04_New));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR,Npc_HasItems(Trader,ItPo_Perm_STR));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_M_Low,Npc_HasItems(Trader,ItPo_Perm_STR_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_M_Normal,Npc_HasItems(Trader,ItPo_Perm_STR_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_M_Strong,Npc_HasItems(Trader,ItPo_Perm_STR_M_Strong));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_Fake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_Fake,Npc_HasItems(Trader,ItPo_Perm_STR_Fake));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_DEX,Npc_HasItems(Trader,ItPo_Perm_DEX));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Dex_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Dex_M_Low,Npc_HasItems(Trader,ItPo_Perm_Dex_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Dex_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Dex_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Dex_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Dex_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Dex_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Dex_M_Strong));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health,Npc_HasItems(Trader,ItPo_Perm_Health));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health_M_Low,Npc_HasItems(Trader,ItPo_Perm_Health_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Health_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Health_M_Strong));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana,Npc_HasItems(Trader,ItPo_Perm_Mana));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana_M_Low,Npc_HasItems(Trader,ItPo_Perm_Mana_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Mana_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Mana_M_Strong));
	};
	if(Npc_HasItems(Trader,ITPO_TYONPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_TYONPOTION,Npc_HasItems(Trader,ITPO_TYONPOTION));
	};
	if(Npc_HasItems(Trader,ItPo_Speed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Speed,Npc_HasItems(Trader,ItPo_Speed));
	};
	if(Npc_HasItems(Trader,ITPO_SPEED_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SPEED_02,Npc_HasItems(Trader,ITPO_SPEED_02));
	};
	if(Npc_HasItems(Trader,ItPo_Stamina) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Stamina,Npc_HasItems(Trader,ItPo_Stamina));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina,Npc_HasItems(Trader,ItPo_Perm_Stamina));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina_M_Low,Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Strong));
	};
	if(Npc_HasItems(Trader,ITPO_XMAGICDEF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_XMAGICDEF,Npc_HasItems(Trader,ITPO_XMAGICDEF));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_DEF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_DEF,Npc_HasItems(Trader,ITPO_PERM_DEF));
	};
	if(Npc_HasItems(Trader,ITPO_XORCPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_XORCPOTION,Npc_HasItems(Trader,ITPO_XORCPOTION));
	};
	if(Npc_HasItems(Trader,ITPO_XORCPOTION02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_XORCPOTION02,Npc_HasItems(Trader,ITPO_XORCPOTION02));
	};
	if(Npc_HasItems(Trader,ItPo_MegaDrink) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_MegaDrink,Npc_HasItems(Trader,ItPo_MegaDrink));
	};
	if(Npc_HasItems(Trader,ITPO_SOULRIVER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SOULRIVER,Npc_HasItems(Trader,ITPO_SOULRIVER));
	};
	if(Npc_HasItems(Trader,ITPO_POISON) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_POISON,Npc_HasItems(Trader,ITPO_POISON));
	};
	if(Npc_HasItems(Trader,ITPO_BLOODFLYPOISON) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_BLOODFLYPOISON,Npc_HasItems(Trader,ITPO_BLOODFLYPOISON));
	};
	if(Npc_HasItems(Trader,ItMi_NrozasPoison) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NrozasPoison,Npc_HasItems(Trader,ItMi_NrozasPoison));
	};
	if(Npc_HasItems(Trader,ItMi_NrozasPoisonOsair) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NrozasPoisonOsair,Npc_HasItems(Trader,ItMi_NrozasPoisonOsair));
	};
	if(Npc_HasItems(Trader,ItMi_NrozasPoisonHalf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NrozasPoisonHalf,Npc_HasItems(Trader,ItMi_NrozasPoisonHalf));
	};
	if(Npc_HasItems(Trader,ITPO_ELIGORFIRE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_ELIGORFIRE,Npc_HasItems(Trader,ITPO_ELIGORFIRE));
	};
	if(Npc_HasItems(Trader,ITPO_WATERFIRE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_WATERFIRE,Npc_HasItems(Trader,ITPO_WATERFIRE));
	};
	if(Npc_HasItems(Trader,ITPO_MEGAPOTIONSKILL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_MEGAPOTIONSKILL,Npc_HasItems(Trader,ITPO_MEGAPOTIONSKILL));
	};
	if(Npc_HasItems(Trader,ITPO_SAGITTACLAWPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SAGITTACLAWPOTION,Npc_HasItems(Trader,ITPO_SAGITTACLAWPOTION));
	};
	if(Npc_HasItems(Trader,ITPO_MAGDEFENCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_MAGDEFENCE,Npc_HasItems(Trader,ITPO_MAGDEFENCE));
	};
	if(Npc_HasItems(Trader,ITPO_INTELLECT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_INTELLECT,Npc_HasItems(Trader,ITPO_INTELLECT));
	};
	if(Npc_HasItems(Trader,ItPo_Troll_Stamina) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Troll_Stamina,Npc_HasItems(Trader,ItPo_Troll_Stamina));
	};
	if(Npc_HasItems(Trader,ITPO_SPEED_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SPEED_03,Npc_HasItems(Trader,ITPO_SPEED_03));
	};
	if(Npc_HasItems(Trader,ITPO_FIREDEFENCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_FIREDEFENCE,Npc_HasItems(Trader,ITPO_FIREDEFENCE));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_DEX_DRACONIAN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_DEX_DRACONIAN,Npc_HasItems(Trader,ITPO_PERM_DEX_DRACONIAN));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_STR_ORC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_STR_ORC,Npc_HasItems(Trader,ITPO_PERM_STR_ORC));
	};
	if(Npc_HasItems(Trader,ITPO_FALLDEFENCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_FALLDEFENCE,Npc_HasItems(Trader,ITPO_FALLDEFENCE));
	};
	if(Npc_HasItems(Trader,ITPO_ANPOIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_ANPOIS,Npc_HasItems(Trader,ITPO_ANPOIS));
	};
	if(Npc_HasItems(Trader,ItPo_UrTrallPotion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_UrTrallPotion,Npc_HasItems(Trader,ItPo_UrTrallPotion));
	};
	if(Npc_HasItems(Trader,ItPo_Memories) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Memories,Npc_HasItems(Trader,ItPo_Memories));
	};
	if(Npc_HasItems(Trader,ITPO_BREATH_OF_DEATH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_BREATH_OF_DEATH,Npc_HasItems(Trader,ITPO_BREATH_OF_DEATH));
	};
	if(Npc_HasItems(Trader,ITPO_NECROM_POTION_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_NECROM_POTION_01,Npc_HasItems(Trader,ITPO_NECROM_POTION_01));
	};
	if(Npc_HasItems(Trader,ITPO_DEMON_POTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_DEMON_POTION,Npc_HasItems(Trader,ITPO_DEMON_POTION));
	};
	if(Npc_HasItems(Trader,ITPO_DEMON_POTION_BAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_DEMON_POTION_BAD,Npc_HasItems(Trader,ITPO_DEMON_POTION_BAD));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_DEX_SUPER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_DEX_SUPER,Npc_HasItems(Trader,ITPO_PERM_DEX_SUPER));
	};
	if(Npc_HasItems(Trader,ITPO_SOULPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SOULPOTION,Npc_HasItems(Trader,ITPO_SOULPOTION));
	};
	if(Npc_HasItems(Trader,ItPo_ElixirSHadow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_ElixirSHadow,Npc_HasItems(Trader,ItPo_ElixirSHadow));
	};
	if(Npc_HasItems(Trader,ItPo_UndeadShield) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_UndeadShield,Npc_HasItems(Trader,ItPo_UndeadShield));
	};
	if(Npc_HasItems(Trader,ItPo_Addon_Geist_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Addon_Geist_01,Npc_HasItems(Trader,ItPo_Addon_Geist_01));
	};
	if(Npc_HasItems(Trader,ItPo_Addon_Geist_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Addon_Geist_02,Npc_HasItems(Trader,ItPo_Addon_Geist_02));
	};
	if(Npc_HasItems(Trader,ItPo_Health_Addon_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_Addon_04,Npc_HasItems(Trader,ItPo_Health_Addon_04));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_Addon_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_Addon_04,Npc_HasItems(Trader,ItPo_Mana_Addon_04));
	};
	if(Npc_HasItems(Trader,ItMi_ArrowTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ArrowTip,Npc_HasItems(Trader,ItMi_ArrowTip));
	};
	if(Npc_HasItems(Trader,ItMi_KerArrowTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerArrowTip,Npc_HasItems(Trader,ItMi_KerArrowTip));
	};
	if(Npc_HasItems(Trader,ItMi_BoltTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BoltTip,Npc_HasItems(Trader,ItMi_BoltTip));
	};
	if(Npc_HasItems(Trader,ItMi_ArrowShaft) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ArrowShaft,Npc_HasItems(Trader,ItMi_ArrowShaft));
	};
	if(Npc_HasItems(Trader,ItMi_BoltShaft) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BoltShaft,Npc_HasItems(Trader,ItMi_BoltShaft));
	};
	if(Npc_HasItems(Trader,ItRw_Arrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Arrow,Npc_HasItems(Trader,ItRw_Arrow));
	};
	if(Npc_HasItems(Trader,ItRw_PoisonArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_PoisonArrow,Npc_HasItems(Trader,ItRw_PoisonArrow));
	};
	if(Npc_HasItems(Trader,ItRw_HolyArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_HolyArrow,Npc_HasItems(Trader,ItRw_HolyArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_MagicArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_MagicArrow,Npc_HasItems(Trader,ItRw_Addon_MagicArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_FireArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_FireArrow,Npc_HasItems(Trader,ItRw_Addon_FireArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Bolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bolt,Npc_HasItems(Trader,ItRw_Bolt));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_MagicBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_MagicBolt,Npc_HasItems(Trader,ItRw_Addon_MagicBolt));
	};
	if(Npc_HasItems(Trader,ItRw_HolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_HolyBolt,Npc_HasItems(Trader,ItRw_HolyBolt));
	};
	if(Npc_HasItems(Trader,ITRW_ZUNTARROW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ZUNTARROW,Npc_HasItems(Trader,ITRW_ZUNTARROW));
	};
	if(Npc_HasItems(Trader,ITRW_MYHUNTARROW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_MYHUNTARROW,Npc_HasItems(Trader,ITRW_MYHUNTARROW));
	};
	if(Npc_HasItems(Trader,ItRw_Ass_2x2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Ass_2x2,Npc_HasItems(Trader,ItRw_Ass_2x2));
	};
	if(Npc_HasItems(Trader,ITRW_ADDON_MAGICBOLT_SHV) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ADDON_MAGICBOLT_SHV,Npc_HasItems(Trader,ITRW_ADDON_MAGICBOLT_SHV));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_01,Npc_HasItems(Trader,ItRw_Bow_L_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_02,Npc_HasItems(Trader,ItRw_Bow_L_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_03,Npc_HasItems(Trader,ItRw_Bow_L_03));
	};
	if(Npc_HasItems(Trader,ITRW_BOSPBOW_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOSPBOW_L_03,Npc_HasItems(Trader,ITRW_BOSPBOW_L_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_04,Npc_HasItems(Trader,ItRw_Bow_L_04));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_01,Npc_HasItems(Trader,ItRw_Bow_M_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_02,Npc_HasItems(Trader,ItRw_Bow_M_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_03,Npc_HasItems(Trader,ItRw_Bow_M_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_04,Npc_HasItems(Trader,ItRw_Bow_M_04));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_01,Npc_HasItems(Trader,ItRw_BowCraft_01));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_02,Npc_HasItems(Trader,ItRw_BowCraft_02));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_03,Npc_HasItems(Trader,ItRw_BowCraft_03));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_04,Npc_HasItems(Trader,ItRw_BowCraft_04));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_05,Npc_HasItems(Trader,ItRw_BowCraft_05));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_01,Npc_HasItems(Trader,ItRw_Bow_H_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_02,Npc_HasItems(Trader,ItRw_Bow_H_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_03,Npc_HasItems(Trader,ItRw_Bow_H_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_04,Npc_HasItems(Trader,ItRw_Bow_H_04));
	};
	if(Npc_HasItems(Trader,ITRW_WHITEBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_WHITEBOW,Npc_HasItems(Trader,ITRW_WHITEBOW));
	};
	if(Npc_HasItems(Trader,ItRw_Sld_Bow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Sld_Bow,Npc_HasItems(Trader,ItRw_Sld_Bow));
	};
	if(Npc_HasItems(Trader,ITRW_DIEGO_BOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_DIEGO_BOW,Npc_HasItems(Trader,ITRW_DIEGO_BOW));
	};
	if(Npc_HasItems(Trader,ItRw_Arabic_Bow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Arabic_Bow,Npc_HasItems(Trader,ItRw_Arabic_Bow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_Light,Npc_HasItems(Trader,ItRw_Crossbow_Light));
	};
	if(Npc_HasItems(Trader,ItRw_Mil_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Mil_Crossbow,Npc_HasItems(Trader,ItRw_Mil_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_BDT_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BDT_Crossbow,Npc_HasItems(Trader,ItRw_BDT_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_L_01,Npc_HasItems(Trader,ItRw_Crossbow_L_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_L_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_L_02,Npc_HasItems(Trader,ItRw_Crossbow_L_02));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_M_01,Npc_HasItems(Trader,ItRw_Crossbow_M_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_M_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_M_02,Npc_HasItems(Trader,ItRw_Crossbow_M_02));
	};
	if(Npc_HasItems(Trader,ItRw_PAL_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_PAL_Crossbow,Npc_HasItems(Trader,ItRw_PAL_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_H_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_H_01,Npc_HasItems(Trader,ItRw_Crossbow_H_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_H_02,Npc_HasItems(Trader,ItRw_Crossbow_H_02));
	};
	if(Npc_HasItems(Trader,ITRW_CROSSBOW_ORC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_CROSSBOW_ORC,Npc_HasItems(Trader,ITRW_CROSSBOW_ORC));
	};
	if(Npc_HasItems(Trader,ITRW_CROSSBOW_ORC_LIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_CROSSBOW_ORC_LIGHT,Npc_HasItems(Trader,ITRW_CROSSBOW_ORC_LIGHT));
	};
	if(Npc_HasItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV,Npc_HasItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_01,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_02,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_03,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_04,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_05,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_05));
	};
	if(Npc_HasItems(Trader,ITRW_BOW_DOUBLE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOW_DOUBLE_01,Npc_HasItems(Trader,ITRW_BOW_DOUBLE_01));
	};
	if(Npc_HasItems(Trader,ITRW_G3_LONG_BOW_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_LONG_BOW_02,Npc_HasItems(Trader,ITRW_G3_LONG_BOW_02));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_KADAT_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_KADAT_BOW_01,Npc_HasItems(Trader,ITRW_KMR_KADAT_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_DARKLONG_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_DARKLONG_BOW_01,Npc_HasItems(Trader,ITRW_KMR_DARKLONG_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_SHADOWS_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_SHADOWS_BOW_01,Npc_HasItems(Trader,ITRW_KMR_SHADOWS_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC,Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC));
	};
	if(Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_SILENTDEATH_BOW_01,Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_SHADOWBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_SHADOWBOW,Npc_HasItems(Trader,ITRW_SHADOWBOW));
	};
	if(Npc_HasItems(Trader,ITRW_BOW_BONES) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOW_BONES,Npc_HasItems(Trader,ITRW_BOW_BONES));
	};
	if(Npc_HasItems(Trader,ITRW_G4_OAK_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G4_OAK_BOW_01,Npc_HasItems(Trader,ITRW_G4_OAK_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_HOLYBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_HOLYBOW,Npc_HasItems(Trader,ITRW_HOLYBOW));
	};
	if(Npc_HasItems(Trader,ITRW_G3_DEMON_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_DEMON_BOW_01,Npc_HasItems(Trader,ITRW_G3_DEMON_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_HAOS_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_HAOS_BOW_01,Npc_HasItems(Trader,ITRW_HAOS_BOW_01));
	};
	if(Npc_HasItems(Trader,ItRw_Undead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Undead,Npc_HasItems(Trader,ItRw_Undead));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_Undead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_Undead,Npc_HasItems(Trader,ItRw_Crossbow_Undead));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_01,Npc_HasItems(Trader,ItSl_BackArrowSack_01));
	};	
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_02,Npc_HasItems(Trader,ItSl_BackArrowSack_02));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_04,Npc_HasItems(Trader,ItSl_BackArrowSack_04));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_05,Npc_HasItems(Trader,ItSl_BackArrowSack_05));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_06,Npc_HasItems(Trader,ItSl_BackArrowSack_06));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_07,Npc_HasItems(Trader,ItSl_BackArrowSack_07));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_08) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_08,Npc_HasItems(Trader,ItSl_BackArrowSack_08));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_09) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_09,Npc_HasItems(Trader,ItSl_BackArrowSack_09));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_10,Npc_HasItems(Trader,ItSl_BackArrowSack_10));
	};
	if(Npc_HasItems(Trader,ItSl_BackBoltSack_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackBoltSack_01,Npc_HasItems(Trader,ItSl_BackBoltSack_01));
	};
	if(Npc_HasItems(Trader,ITAM_ORCAMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_ORCAMULET,Npc_HasItems(Trader,ITAM_ORCAMULET));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Fire_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Fire_01,Npc_HasItems(Trader,ItAm_Prot_Fire_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Edge_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Edge_01,Npc_HasItems(Trader,ItAm_Prot_Edge_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Point_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Point_01,Npc_HasItems(Trader,ItAm_Prot_Point_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Mage_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Mage_01,Npc_HasItems(Trader,ItAm_Prot_Mage_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Total_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Total_01,Npc_HasItems(Trader,ItAm_Prot_Total_01));
	};
	if(Npc_HasItems(Trader,ItAm_Dex_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Dex_01,Npc_HasItems(Trader,ItAm_Dex_01));
	};
	if(Npc_HasItems(Trader,ItAm_Strg_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Strg_01,Npc_HasItems(Trader,ItAm_Strg_01));
	};
	if(Npc_HasItems(Trader,ItAm_Hp_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Hp_01,Npc_HasItems(Trader,ItAm_Hp_01));
	};
	if(Npc_HasItems(Trader,ItAm_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Mana_01,Npc_HasItems(Trader,ItAm_Mana_01));
	};
	if(Npc_HasItems(Trader,ItAm_Dex_Strg_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Dex_Strg_01,Npc_HasItems(Trader,ItAm_Dex_Strg_01));
	};
	if(Npc_HasItems(Trader,ItAm_Hp_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Hp_Mana_01,Npc_HasItems(Trader,ItAm_Hp_Mana_01));
	};
	if(Npc_HasItems(Trader,ITAM_IRDORAT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_IRDORAT,Npc_HasItems(Trader,ITAM_IRDORAT));
	};
	if(Npc_HasItems(Trader,ITAM_BENKENOB) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_BENKENOB,Npc_HasItems(Trader,ITAM_BENKENOB));
	};
	if(Npc_HasItems(Trader,ITAM_ZIGOSMAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_ZIGOSMAGIC,Npc_HasItems(Trader,ITAM_ZIGOSMAGIC));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_Franco) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_Franco,Npc_HasItems(Trader,ItAm_Addon_Franco));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_Health) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_Health,Npc_HasItems(Trader,ItAm_Addon_Health));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_Health_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_Health_01,Npc_HasItems(Trader,ItRi_Addon_Health_01));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_Health_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_Health_02,Npc_HasItems(Trader,ItRi_Addon_Health_02));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_MANA) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_MANA,Npc_HasItems(Trader,ItAm_Addon_MANA));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_MANA_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_MANA_01,Npc_HasItems(Trader,ItRi_Addon_MANA_01));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_MANA_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_MANA_02,Npc_HasItems(Trader,ItRi_Addon_MANA_02));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_STR) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_STR,Npc_HasItems(Trader,ItAm_Addon_STR));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_STR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_STR_01,Npc_HasItems(Trader,ItRi_Addon_STR_01));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_STR_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_STR_02,Npc_HasItems(Trader,ItRi_Addon_STR_02));
	};
	if(Npc_HasItems(Trader,ItAm_MasiafKey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_MasiafKey,Npc_HasItems(Trader,ItAm_MasiafKey));
	};
	if(Npc_HasItems(Trader,ItKe_Masiaf_Open) > 0)
	{
		Npc_RemoveInvItems(Trader,ItKe_Masiaf_Open,Npc_HasItems(Trader,ItKe_Masiaf_Open));
	};
	if(Npc_HasItems(Trader,ItKe_AniTest) > 0)
	{
		Npc_RemoveInvItems(Trader,ItKe_AniTest,Npc_HasItems(Trader,ItKe_AniTest));
	};
	if(Npc_HasItems(Trader,ItAm_Diamond) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Diamond,Npc_HasItems(Trader,ItAm_Diamond));
	};
	if(Npc_HasItems(Trader,ItAm_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Ruby,Npc_HasItems(Trader,ItAm_Ruby));
	};
	if(Npc_HasItems(Trader,ItAm_Emerald) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Emerald,Npc_HasItems(Trader,ItAm_Emerald));
	};
	if(Npc_HasItems(Trader,ItAm_Sapphire) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Sapphire,Npc_HasItems(Trader,ItAm_Sapphire));
	};
	if(Npc_HasItems(Trader,ItAm_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Opal,Npc_HasItems(Trader,ItAm_Opal));
	};
	if(Npc_HasItems(Trader,ItAm_Topaz) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Topaz,Npc_HasItems(Trader,ItAm_Topaz));
	};
	if(Npc_HasItems(Trader,ITMI_DEADORCITEM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DEADORCITEM,Npc_HasItems(Trader,ITMI_DEADORCITEM));
	};
	if(Npc_HasItems(Trader,ItAm_HashGor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_HashGor,Npc_HasItems(Trader,ItAm_HashGor));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Fire_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Fire_01,Npc_HasItems(Trader,ItRi_Prot_Fire_01));
	};
	if(Npc_HasItems(Trader,ITRI_LANZRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_LANZRING,Npc_HasItems(Trader,ITRI_LANZRING));
	};
	if(Npc_HasItems(Trader,ITRI_TROKARRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_TROKARRING,Npc_HasItems(Trader,ITRI_TROKARRING));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Fire_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Fire_02,Npc_HasItems(Trader,ItRi_Prot_Fire_02));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Fire_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Fire_03,Npc_HasItems(Trader,ItRi_Prot_Fire_03));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Point_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Point_01,Npc_HasItems(Trader,ItRi_Prot_Point_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Point_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Point_02,Npc_HasItems(Trader,ItRi_Prot_Point_02));
	};
	if(Npc_HasItems(Trader,ItRi_Rod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Rod,Npc_HasItems(Trader,ItRi_Rod));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Edge_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Edge_01,Npc_HasItems(Trader,ItRi_Prot_Edge_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Edge_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Edge_02,Npc_HasItems(Trader,ItRi_Prot_Edge_02));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Mage_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Mage_01,Npc_HasItems(Trader,ItRi_Prot_Mage_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Mage_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Mage_02,Npc_HasItems(Trader,ItRi_Prot_Mage_02));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Total_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Total_01,Npc_HasItems(Trader,ItRi_Prot_Total_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Total_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Total_02,Npc_HasItems(Trader,ItRi_Prot_Total_02));
	};
	if(Npc_HasItems(Trader,ItRi_Dex_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Dex_01,Npc_HasItems(Trader,ItRi_Dex_01));
	};
	if(Npc_HasItems(Trader,ItRi_Dex_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Dex_02,Npc_HasItems(Trader,ItRi_Dex_02));
	};
	if(Npc_HasItems(Trader,ItRi_HP_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_HP_01,Npc_HasItems(Trader,ItRi_HP_01));
	};
	if(Npc_HasItems(Trader,ItRi_Hp_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Hp_02,Npc_HasItems(Trader,ItRi_Hp_02));
	};
	if(Npc_HasItems(Trader,ItRi_Str_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Str_01,Npc_HasItems(Trader,ItRi_Str_01));
	};
	if(Npc_HasItems(Trader,ItRi_Str_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Str_02,Npc_HasItems(Trader,ItRi_Str_02));
	};
	if(Npc_HasItems(Trader,ItRi_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Mana_01,Npc_HasItems(Trader,ItRi_Mana_01));
	};
	if(Npc_HasItems(Trader,ItRi_Mana_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Mana_02,Npc_HasItems(Trader,ItRi_Mana_02));
	};
	if(Npc_HasItems(Trader,ItRi_Hp_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Hp_Mana_01,Npc_HasItems(Trader,ItRi_Hp_Mana_01));
	};
	if(Npc_HasItems(Trader,ItRi_Dex_Strg_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Dex_Strg_01,Npc_HasItems(Trader,ItRi_Dex_Strg_01));
	};
	if(Npc_HasItems(Trader,ITRI_RITUALPLACE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_RITUALPLACE,Npc_HasItems(Trader,ITRI_RITUALPLACE));
	};
	if(Npc_HasItems(Trader,ITRI_XARDASPLACE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_XARDASPLACE,Npc_HasItems(Trader,ITRI_XARDASPLACE));
	};
	if(Npc_HasItems(Trader,ITRI_GUARDIANS_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_GUARDIANS_01,Npc_HasItems(Trader,ITRI_GUARDIANS_01));
	};
	if(Npc_HasItems(Trader,ITRI_GUARDIANS_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_GUARDIANS_02,Npc_HasItems(Trader,ITRI_GUARDIANS_02));
	};
	if(Npc_HasItems(Trader,ITRI_SARAFAMILYRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_SARAFAMILYRING,Npc_HasItems(Trader,ITRI_SARAFAMILYRING));
	};
	if(Npc_HasItems(Trader,ITRI_HAKONMISSRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_HAKONMISSRING,Npc_HasItems(Trader,ITRI_HAKONMISSRING));
	};
	if(Npc_HasItems(Trader,ITRI_PILLIGRIMRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_PILLIGRIMRING,Npc_HasItems(Trader,ITRI_PILLIGRIMRING));
	};
	if(Npc_HasItems(Trader,ITRI_GRITTASRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_GRITTASRING,Npc_HasItems(Trader,ITRI_GRITTASRING));
	};
	if(Npc_HasItems(Trader,ITRI_VEPR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_VEPR,Npc_HasItems(Trader,ITRI_VEPR));
	};
	if(Npc_HasItems(Trader,ITRI_INNOSJUDGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_INNOSJUDGE,Npc_HasItems(Trader,ITRI_INNOSJUDGE));
	};
	if(Npc_HasItems(Trader,ITRI_NARUS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_NARUS,Npc_HasItems(Trader,ITRI_NARUS));
	};
	if(Npc_HasItems(Trader,ITRI_UDARGIFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_UDARGIFT,Npc_HasItems(Trader,ITRI_UDARGIFT));
	};
	if(Npc_HasItems(Trader,ITRI_DEX_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_DEX_03,Npc_HasItems(Trader,ITRI_DEX_03));
	};
	if(Npc_HasItems(Trader,ITRI_FELLANGOR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_FELLANGOR,Npc_HasItems(Trader,ITRI_FELLANGOR));
	};
	if(Npc_HasItems(Trader,ITRI_FELLANGOR_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_FELLANGOR_MAGIC,Npc_HasItems(Trader,ITRI_FELLANGOR_MAGIC));
	};
	if(Npc_HasItems(Trader,ItRi_UnknownRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_UnknownRing,Npc_HasItems(Trader,ItRi_UnknownRing));
	};
	if(Npc_HasItems(Trader,ItRi_Teleport_Ring) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Teleport_Ring,Npc_HasItems(Trader,ItRi_Teleport_Ring));
	};
	if(Npc_HasItems(Trader,ITRI_TELEPORT_RING_ADANOS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_TELEPORT_RING_ADANOS,Npc_HasItems(Trader,ITRI_TELEPORT_RING_ADANOS));
	};
	if(Npc_HasItems(Trader,ITRI_TELEPORT_NW_RUINS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_TELEPORT_NW_RUINS,Npc_HasItems(Trader,ITRI_TELEPORT_NW_RUINS));
	};
	if(Npc_HasItems(Trader,ITRI_RING_SLOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_RING_SLOW,Npc_HasItems(Trader,ITRI_RING_SLOW));
	};
	if(Npc_HasItems(Trader,ItRi_DragonStaff) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_DragonStaff,Npc_HasItems(Trader,ItRi_DragonStaff));
	};
	if(Npc_HasItems(Trader,ItRi_OreBarons) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_OreBarons,Npc_HasItems(Trader,ItRi_OreBarons));
	};
	if(Npc_HasItems(Trader,ItRi_HuntRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_HuntRing,Npc_HasItems(Trader,ItRi_HuntRing));
	};
	if(Npc_HasItems(Trader,ItRi_FerrosRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_FerrosRing,Npc_HasItems(Trader,ItRi_FerrosRing));
	};
	if(Npc_HasItems(Trader,ItRi_DarkCurse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_DarkCurse,Npc_HasItems(Trader,ItRi_DarkCurse));
	};
	if(Npc_HasItems(Trader,ItRi_Ferd) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ferd,Npc_HasItems(Trader,ItRi_Ferd));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Diam) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Diam,Npc_HasItems(Trader,ItRi_Steel_Diam));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Ruby,Npc_HasItems(Trader,ItRi_Steel_Ruby));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Emer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Emer,Npc_HasItems(Trader,ItRi_Steel_Emer));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Sapp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Sapp,Npc_HasItems(Trader,ItRi_Steel_Sapp));};
	if(Npc_HasItems(Trader,ItRi_Steel_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Opal,Npc_HasItems(Trader,ItRi_Steel_Opal));};
	if(Npc_HasItems(Trader,ItRi_Steel_Topa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Topa,Npc_HasItems(Trader,ItRi_Steel_Topa));};
	if(Npc_HasItems(Trader,ItRi_Gold_Diam) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Diam,Npc_HasItems(Trader,ItRi_Gold_Diam));};
	if(Npc_HasItems(Trader,ItRi_Gold_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Ruby,Npc_HasItems(Trader,ItRi_Gold_Ruby));};
	if(Npc_HasItems(Trader,ItRi_Gold_Emer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Emer,Npc_HasItems(Trader,ItRi_Gold_Emer));};
	if(Npc_HasItems(Trader,ItRi_Gold_Sapp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Sapp,Npc_HasItems(Trader,ItRi_Gold_Sapp));};
	if(Npc_HasItems(Trader,ItRi_Gold_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Opal,Npc_HasItems(Trader,ItRi_Gold_Opal));};
	if(Npc_HasItems(Trader,ItRi_Gold_Topa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Topa,Npc_HasItems(Trader,ItRi_Gold_Topa));};
	if(Npc_HasItems(Trader,ItRi_Ore_Diam) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Diam,Npc_HasItems(Trader,ItRi_Ore_Diam));};
	if(Npc_HasItems(Trader,ItRi_Ore_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Ruby,Npc_HasItems(Trader,ItRi_Ore_Ruby));};
	if(Npc_HasItems(Trader,ItRi_Ore_Emer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Emer,Npc_HasItems(Trader,ItRi_Ore_Emer));};
	if(Npc_HasItems(Trader,ItRi_Ore_Sapp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Sapp,Npc_HasItems(Trader,ItRi_Ore_Sapp));};
	if(Npc_HasItems(Trader,ItRi_Ore_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Opal,Npc_HasItems(Trader,ItRi_Ore_Opal));};
	if(Npc_HasItems(Trader,ItRi_Ore_Topa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Topa,Npc_HasItems(Trader,ItRi_Ore_Topa));};
	if(Npc_HasItems(Trader,ItRi_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Loa,Npc_HasItems(Trader,ItRi_Loa));};
	if(Npc_HasItems(Trader,ITRU_TELEPORTDAGOT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TELEPORTDAGOT,Npc_HasItems(Trader,ITRU_TELEPORTDAGOT));};
	if(Npc_HasItems(Trader,ITRU_ORCTELEPORT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_ORCTELEPORT,Npc_HasItems(Trader,ITRU_ORCTELEPORT));};
	if(Npc_HasItems(Trader,ItRu_PalTeleportSecret) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalTeleportSecret,Npc_HasItems(Trader,ItRu_PalTeleportSecret));};
	if(Npc_HasItems(Trader,ItRu_PalLight) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalLight,Npc_HasItems(Trader,ItRu_PalLight));};
	if(Npc_HasItems(Trader,ItRu_PalLightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalLightHeal,Npc_HasItems(Trader,ItRu_PalLightHeal));};
	if(Npc_HasItems(Trader,ItRu_PalMediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalMediumHeal,Npc_HasItems(Trader,ItRu_PalMediumHeal));};
	if(Npc_HasItems(Trader,ItRu_PalFullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalFullHeal,Npc_HasItems(Trader,ItRu_PalFullHeal));};
	if(Npc_HasItems(Trader,ItRu_PalHolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalHolyBolt,Npc_HasItems(Trader,ItRu_PalHolyBolt));};
	if(Npc_HasItems(Trader,ItRu_PalRepelEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalRepelEvil,Npc_HasItems(Trader,ItRu_PalRepelEvil));};
	if(Npc_HasItems(Trader,ItRu_PalDestroyEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalDestroyEvil,Npc_HasItems(Trader,ItRu_PalDestroyEvil));};
	if(Npc_HasItems(Trader,ItRu_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Light,Npc_HasItems(Trader,ItRu_Light));};
	if(Npc_HasItems(Trader,ItRu_Light_Pyr) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Light_Pyr,Npc_HasItems(Trader,ItRu_Light_Pyr));};
	if(Npc_HasItems(Trader,ItRu_LightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_LightHeal,Npc_HasItems(Trader,ItRu_LightHeal));};
	if(Npc_HasItems(Trader,ItRu_FireBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FireBolt,Npc_HasItems(Trader,ItRu_FireBolt));};
	if(Npc_HasItems(Trader,ItRu_Unlock) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Unlock,Npc_HasItems(Trader,ItRu_Unlock));
	};
	if(Npc_HasItems(Trader,ItRu_RapidFirebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_RapidFirebolt,Npc_HasItems(Trader,ItRu_RapidFirebolt));
	};
	if(Npc_HasItems(Trader,ItRu_RapidIcebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_RapidIcebolt,Npc_HasItems(Trader,ItRu_RapidIcebolt));
	};
	if(Npc_HasItems(Trader,ItRu_Rage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Rage,Npc_HasItems(Trader,ItRu_Rage));
	};
	if(Npc_HasItems(Trader,ItRu_Quake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Quake,Npc_HasItems(Trader,ItRu_Quake));
	};
	if(Npc_HasItems(Trader,ItRu_MagicCage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MagicCage,Npc_HasItems(Trader,ItRu_MagicCage));
	};
	if(Npc_HasItems(Trader,ItRu_Lacerate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Lacerate,Npc_HasItems(Trader,ItRu_Lacerate));
	};
	if(Npc_HasItems(Trader,ItRu_Extricate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Extricate,Npc_HasItems(Trader,ItRu_Extricate));
	};
	if(Npc_HasItems(Trader,ItRu_Explosion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Explosion,Npc_HasItems(Trader,ItRu_Explosion));
	};
	if(Npc_HasItems(Trader,ItRu_Elevate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Elevate,Npc_HasItems(Trader,ItRu_Elevate));
	};
	if(Npc_HasItems(Trader,ItRu_AdanosBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_AdanosBall,Npc_HasItems(Trader,ItRu_AdanosBall));
	};
	if(Npc_HasItems(Trader,ItRu_Acid) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Acid,Npc_HasItems(Trader,ItRu_Acid));
	};
	if(Npc_HasItems(Trader,ItRu_Zap) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Zap,Npc_HasItems(Trader,ItRu_Zap));};
	if(Npc_HasItems(Trader,ItRu_Icebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Icebolt,Npc_HasItems(Trader,ItRu_Icebolt));};
	if(Npc_HasItems(Trader,ItRu_Sleep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Sleep,Npc_HasItems(Trader,ItRu_Sleep));};
	if(Npc_HasItems(Trader,ITRU_BERZERK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BERZERK,Npc_HasItems(Trader,ITRU_BERZERK));};
	if(Npc_HasItems(Trader,ItRu_Deathbolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Deathbolt,Npc_HasItems(Trader,ItRu_Deathbolt));};
	if(Npc_HasItems(Trader,ItRu_SumGobSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumGobSkel,Npc_HasItems(Trader,ItRu_SumGobSkel));};
	if(Npc_HasItems(Trader,ItRu_SumWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumWolf,Npc_HasItems(Trader,ItRu_SumWolf));};
	if(Npc_HasItems(Trader,ItRu_MediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MediumHeal,Npc_HasItems(Trader,ItRu_MediumHeal));};
	if(Npc_HasItems(Trader,ItRu_HarmUndead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_HarmUndead,Npc_HasItems(Trader,ItRu_HarmUndead));};
	if(Npc_HasItems(Trader,ItRu_InstantFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_InstantFireball,Npc_HasItems(Trader,ItRu_InstantFireball));};
	if(Npc_HasItems(Trader,ItRu_Icelance) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Icelance,Npc_HasItems(Trader,ItRu_Icelance));};
	if(Npc_HasItems(Trader,ITRU_SUMSHOAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMSHOAL,Npc_HasItems(Trader,ITRU_SUMSHOAL));};
	if(Npc_HasItems(Trader,ItRu_Windfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Windfist,Npc_HasItems(Trader,ItRu_Windfist));};
	if(Npc_HasItems(Trader,ITRU_TELEKINESIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TELEKINESIS,Npc_HasItems(Trader,ITRU_TELEKINESIS));};
	if(Npc_HasItems(Trader,ItRu_GreenTentacle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GreenTentacle,Npc_HasItems(Trader,ItRu_GreenTentacle));};
	if(Npc_HasItems(Trader,ItRu_ManaForLife) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ManaForLife,Npc_HasItems(Trader,ItRu_ManaForLife));};
	if(Npc_HasItems(Trader,ItRu_SummonZombie) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SummonZombie,Npc_HasItems(Trader,ItRu_SummonZombie));};
	if(Npc_HasItems(Trader,ItRu_FullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FullHeal,Npc_HasItems(Trader,ItRu_FullHeal));};
	if(Npc_HasItems(Trader,ItRu_Firestorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Firestorm,Npc_HasItems(Trader,ItRu_Firestorm));};
	if(Npc_HasItems(Trader,ItRu_IceCube) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_IceCube,Npc_HasItems(Trader,ItRu_IceCube));};
	if(Npc_HasItems(Trader,ItRu_ThunderBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ThunderBall,Npc_HasItems(Trader,ItRu_ThunderBall));};
	if(Npc_HasItems(Trader,ItRu_Fear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Fear,Npc_HasItems(Trader,ItRu_Fear));};
	if(Npc_HasItems(Trader,ITRU_CHARM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CHARM,Npc_HasItems(Trader,ITRU_CHARM));};
	if(Npc_HasItems(Trader,ItRu_Swarm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Swarm,Npc_HasItems(Trader,ItRu_Swarm));};
	if(Npc_HasItems(Trader,ItRu_SumSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumSkel,Npc_HasItems(Trader,ItRu_SumSkel));};
	if(Npc_HasItems(Trader,ItRu_BeliarsRage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_BeliarsRage,Npc_HasItems(Trader,ItRu_BeliarsRage));};
	if(Npc_HasItems(Trader,ItRu_SummonGuardian) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SummonGuardian,Npc_HasItems(Trader,ItRu_SummonGuardian));};
	if(Npc_HasItems(Trader,ItRu_SumGol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumGol,Npc_HasItems(Trader,ItRu_SumGol));};
	if(Npc_HasItems(Trader,ITRU_SUMFIREGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMFIREGOL,Npc_HasItems(Trader,ITRU_SUMFIREGOL));};
	if(Npc_HasItems(Trader,ItRu_ChargeFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ChargeFireball,Npc_HasItems(Trader,ItRu_ChargeFireball));};
	if(Npc_HasItems(Trader,ITRU_FIRELIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_FIRELIGHT,Npc_HasItems(Trader,ITRU_FIRELIGHT));};
	if(Npc_HasItems(Trader,ItRu_LightningFlash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_LightningFlash,Npc_HasItems(Trader,ItRu_LightningFlash));};
	if(Npc_HasItems(Trader,ITRU_SUMICEGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMICEGOL,Npc_HasItems(Trader,ITRU_SUMICEGOL));};
	if(Npc_HasItems(Trader,ITRU_SEVEREFETIDITY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SEVEREFETIDITY,Npc_HasItems(Trader,ITRU_SEVEREFETIDITY));};
	if(Npc_HasItems(Trader,ItRu_Whirlwind) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Whirlwind,Npc_HasItems(Trader,ItRu_Whirlwind));};
	if(Npc_HasItems(Trader,ItRu_SumDemon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumDemon,Npc_HasItems(Trader,ItRu_SumDemon));};
	if(Npc_HasItems(Trader,ItRu_Deathball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Deathball,Npc_HasItems(Trader,ItRu_Deathball));};
	if(Npc_HasItems(Trader,ItRu_BreathOfDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_BreathOfDeath,Npc_HasItems(Trader,ItRu_BreathOfDeath));};
	if(Npc_HasItems(Trader,ITRU_ELIGORDEMONS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_ELIGORDEMONS,Npc_HasItems(Trader,ITRU_ELIGORDEMONS));};
	if(Npc_HasItems(Trader,ITRU_BELIARSUPERRUNE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSUPERRUNE,Npc_HasItems(Trader,ITRU_BELIARSUPERRUNE));};
	if(Npc_HasItems(Trader,ItRu_OrcFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_OrcFireball,Npc_HasItems(Trader,ItRu_OrcFireball));};
	if(Npc_HasItems(Trader,ItRu_Pyrokinesis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Pyrokinesis,Npc_HasItems(Trader,ItRu_Pyrokinesis));};
	if(Npc_HasItems(Trader,ItRu_Waterfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Waterfist,Npc_HasItems(Trader,ItRu_Waterfist));};
	if(Npc_HasItems(Trader,ItRu_IceWave) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_IceWave,Npc_HasItems(Trader,ItRu_IceWave));};
	if(Npc_HasItems(Trader,ITRU_CONTROL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CONTROL,Npc_HasItems(Trader,ITRU_CONTROL));};
	if(Npc_HasItems(Trader,ItRu_ArmyOfDarkness) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ArmyOfDarkness,Npc_HasItems(Trader,ItRu_ArmyOfDarkness));};
	if(Npc_HasItems(Trader,ITRU_SUMSWPGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMSWPGOL,Npc_HasItems(Trader,ITRU_SUMSWPGOL));};
	if(Npc_HasItems(Trader,ItRu_Firerain) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Firerain,Npc_HasItems(Trader,ItRu_Firerain));};
	if(Npc_HasItems(Trader,ItRu_FireMeteor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FireMeteor,Npc_HasItems(Trader,ItRu_FireMeteor));};
	if(Npc_HasItems(Trader,ItRu_Geyser) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Geyser,Npc_HasItems(Trader,ItRu_Geyser));};
	if(Npc_HasItems(Trader,ItRu_Thunderstorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Thunderstorm,Npc_HasItems(Trader,ItRu_Thunderstorm));};
	if(Npc_HasItems(Trader,ItRu_MassDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MassDeath,Npc_HasItems(Trader,ItRu_MassDeath));};
	if(Npc_HasItems(Trader,ItRu_Skull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Skull,Npc_HasItems(Trader,ItRu_Skull));};
	if(Npc_HasItems(Trader,ItRu_GuruWrath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GuruWrath,Npc_HasItems(Trader,ItRu_GuruWrath));};
	if(Npc_HasItems(Trader,ItRu_MasterOfDisaster) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MasterOfDisaster,Npc_HasItems(Trader,ItRu_MasterOfDisaster));};
	if(Npc_HasItems(Trader,ItRu_Concussionbolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Concussionbolt,Npc_HasItems(Trader,ItRu_Concussionbolt));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_00,Npc_HasItems(Trader,ITRU_TPLHEAL_00));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_01,Npc_HasItems(Trader,ITRU_TPLHEAL_01));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_02,Npc_HasItems(Trader,ITRU_TPLHEAL_02));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_03,Npc_HasItems(Trader,ITRU_TPLHEAL_03));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_00,Npc_HasItems(Trader,ITRU_TPLSTRIKE_00));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_01,Npc_HasItems(Trader,ITRU_TPLSTRIKE_01));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_02,Npc_HasItems(Trader,ITRU_TPLSTRIKE_02));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_03,Npc_HasItems(Trader,ITRU_TPLSTRIKE_03));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE01,Npc_HasItems(Trader,ITRU_BELIARSRUNE01));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE02,Npc_HasItems(Trader,ITRU_BELIARSRUNE02));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE03,Npc_HasItems(Trader,ITRU_BELIARSRUNE03));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE04,Npc_HasItems(Trader,ITRU_BELIARSRUNE04));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE05,Npc_HasItems(Trader,ITRU_BELIARSRUNE05));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE06) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE06,Npc_HasItems(Trader,ITRU_BELIARSRUNE06));};
	if(Npc_HasItems(Trader,ITRU_MORAULARTU) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_MORAULARTU,Npc_HasItems(Trader,ITRU_MORAULARTU));};
	if(Npc_HasItems(Trader,ITRU_CRESTELEMENTS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CRESTELEMENTS,Npc_HasItems(Trader,ITRU_CRESTELEMENTS));};
	if(Npc_HasItems(Trader,ItRu_PyroRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PyroRune,Npc_HasItems(Trader,ItRu_PyroRune));};
	if(Npc_HasItems(Trader,ITRU_DESTROYGUARDIANS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_DESTROYGUARDIANS,Npc_HasItems(Trader,ITRU_DESTROYGUARDIANS));};
	if(Npc_HasItems(Trader,ITRU_SUMTREANT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMTREANT,Npc_HasItems(Trader,ITRU_SUMTREANT));};
	if(Npc_HasItems(Trader,ItRu_EligorSummon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_EligorSummon,Npc_HasItems(Trader,ItRu_EligorSummon));};
	if(Npc_HasItems(Trader,ItRu_TrfBloodFly) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfBloodFly,Npc_HasItems(Trader,ItRu_TrfBloodFly));};
	if(Npc_HasItems(Trader,ItRu_TrfFireWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfFireWaran,Npc_HasItems(Trader,ItRu_TrfFireWaran));};
	if(Npc_HasItems(Trader,ItRu_TrfWarg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfWarg,Npc_HasItems(Trader,ItRu_TrfWarg));};
	if(Npc_HasItems(Trader,ItRu_TrfShadowbeast) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfShadowbeast,Npc_HasItems(Trader,ItRu_TrfShadowbeast));};
	if(Npc_HasItems(Trader,ItRu_TrfDragonSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfDragonSnapper,Npc_HasItems(Trader,ItRu_TrfDragonSnapper));};
	if(Npc_HasItems(Trader,ItRu_TrfTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfTroll,Npc_HasItems(Trader,ItRu_TrfTroll));};
	if(Npc_HasItems(Trader,ItRu_ShadowMount) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ShadowMount,Npc_HasItems(Trader,ItRu_ShadowMount));};
	if(Npc_HasItems(Trader,ItRu_GlobalTeleport) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GlobalTeleport,Npc_HasItems(Trader,ItRu_GlobalTeleport));};
	if(Npc_HasItems(Trader,ItSc_PalLight) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalLight,Npc_HasItems(Trader,ItSc_PalLight));};
	if(Npc_HasItems(Trader,ItSc_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Light,Npc_HasItems(Trader,ItSc_Light));};
	if(Npc_HasItems(Trader,ItSc_PalLightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalLightHeal,Npc_HasItems(Trader,ItSc_PalLightHeal));};
	if(Npc_HasItems(Trader,ItSc_PalHolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalHolyBolt,Npc_HasItems(Trader,ItSc_PalHolyBolt));};
	if(Npc_HasItems(Trader,ItSc_PalMediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalMediumHeal,Npc_HasItems(Trader,ItSc_PalMediumHeal));};
	if(Npc_HasItems(Trader,ItSc_PalRepelEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalRepelEvil,Npc_HasItems(Trader,ItSc_PalRepelEvil));};
	if(Npc_HasItems(Trader,ItSc_PalFullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalFullHeal,Npc_HasItems(Trader,ItSc_PalFullHeal));};
	if(Npc_HasItems(Trader,ItSc_PalDestroyEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalDestroyEvil,Npc_HasItems(Trader,ItSc_PalDestroyEvil));};
	if(Npc_HasItems(Trader,ItSc_LightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_LightHeal,Npc_HasItems(Trader,ItSc_LightHeal));};
	if(Npc_HasItems(Trader,ItSc_SumWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumWolf,Npc_HasItems(Trader,ItSc_SumWolf));};
	if(Npc_HasItems(Trader,ItSc_MediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_MediumHeal,Npc_HasItems(Trader,ItSc_MediumHeal));};
	if(Npc_HasItems(Trader,ItSc_HarmUndead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_HarmUndead,Npc_HasItems(Trader,ItSc_HarmUndead));};
	if(Npc_HasItems(Trader,ItSc_FullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_FullHeal,Npc_HasItems(Trader,ItSc_FullHeal));};
	if(Npc_HasItems(Trader,ItSc_Shrink) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Shrink,Npc_HasItems(Trader,ItSc_Shrink));};
	if(Npc_HasItems(Trader,ItSc_Firebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Firebolt,Npc_HasItems(Trader,ItSc_Firebolt));};
	if(Npc_HasItems(Trader,ItSc_Unlock) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Unlock,Npc_HasItems(Trader,ItSc_Unlock));
	};
	if(Npc_HasItems(Trader,ItSc_RapidFirebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_RapidFirebolt,Npc_HasItems(Trader,ItSc_RapidFirebolt));
	};
	if(Npc_HasItems(Trader,ItSc_RapidIcebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_RapidIcebolt,Npc_HasItems(Trader,ItSc_RapidIcebolt));
	};
	if(Npc_HasItems(Trader,ItSc_Rage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Rage,Npc_HasItems(Trader,ItSc_Rage));
	};
	if(Npc_HasItems(Trader,ItSc_Quake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Quake,Npc_HasItems(Trader,ItSc_Quake));
	};
	if(Npc_HasItems(Trader,ItSc_MagicCage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_MagicCage,Npc_HasItems(Trader,ItSc_MagicCage));
	};
	if(Npc_HasItems(Trader,ItSc_Lacerate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Lacerate,Npc_HasItems(Trader,ItSc_Lacerate));
	};
	if(Npc_HasItems(Trader,ItSc_Extricate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Extricate,Npc_HasItems(Trader,ItSc_Extricate));
	};
	if(Npc_HasItems(Trader,ItSc_Explosion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Explosion,Npc_HasItems(Trader,ItSc_Explosion));
	};
	if(Npc_HasItems(Trader,ItSc_Elevate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Elevate,Npc_HasItems(Trader,ItSc_Elevate));
	};
	if(Npc_HasItems(Trader,ItSc_AdanosBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_AdanosBall,Npc_HasItems(Trader,ItSc_AdanosBall));
	};
	if(Npc_HasItems(Trader,ItSc_Acid) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Acid,Npc_HasItems(Trader,ItSc_Acid));
	};
	if(Npc_HasItems(Trader,ItSc_InstantFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_InstantFireball,Npc_HasItems(Trader,ItSc_InstantFireball));};
	if(Npc_HasItems(Trader,ItSc_Firestorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Firestorm,Npc_HasItems(Trader,ItSc_Firestorm));};
	if(Npc_HasItems(Trader,ItSc_ChargeFireBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_ChargeFireBall,Npc_HasItems(Trader,ItSc_ChargeFireBall));};
	if(Npc_HasItems(Trader,ItSc_Pyrokinesis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Pyrokinesis,Npc_HasItems(Trader,ItSc_Pyrokinesis));};
	if(Npc_HasItems(Trader,ItSc_Firerain) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Firerain,Npc_HasItems(Trader,ItSc_Firerain));};
	if(Npc_HasItems(Trader,ItSc_Zap) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Zap,Npc_HasItems(Trader,ItSc_Zap));};
	if(Npc_HasItems(Trader,ItSc_Icelance) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Icelance,Npc_HasItems(Trader,ItSc_Icelance));};
	if(Npc_HasItems(Trader,ItSc_Icebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Icebolt,Npc_HasItems(Trader,ItSc_Icebolt));};
	if(Npc_HasItems(Trader,ItSc_IceCube) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_IceCube,Npc_HasItems(Trader,ItSc_IceCube));};
	if(Npc_HasItems(Trader,ItSc_ThunderBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_ThunderBall,Npc_HasItems(Trader,ItSc_ThunderBall));};
	if(Npc_HasItems(Trader,ITSC_SUMSHOAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMSHOAL,Npc_HasItems(Trader,ITSC_SUMSHOAL));};
	if(Npc_HasItems(Trader,ItSc_Waterfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Waterfist,Npc_HasItems(Trader,ItSc_Waterfist));};
	if(Npc_HasItems(Trader,ItSc_LightningFlash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_LightningFlash,Npc_HasItems(Trader,ItSc_LightningFlash));};
	if(Npc_HasItems(Trader,ItSc_IceWave) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_IceWave,Npc_HasItems(Trader,ItSc_IceWave));};
	if(Npc_HasItems(Trader,ItSc_Geyser) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Geyser,Npc_HasItems(Trader,ItSc_Geyser));};
	if(Npc_HasItems(Trader,ItSc_Thunderstorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Thunderstorm,Npc_HasItems(Trader,ItSc_Thunderstorm));};
	if(Npc_HasItems(Trader,ItSc_Sleep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Sleep,Npc_HasItems(Trader,ItSc_Sleep));};
	if(Npc_HasItems(Trader,ITSC_BERZERK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_BERZERK,Npc_HasItems(Trader,ITSC_BERZERK));};
	if(Npc_HasItems(Trader,ItSc_Windfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Windfist,Npc_HasItems(Trader,ItSc_Windfist));};
	if(Npc_HasItems(Trader,ItSc_Charm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Charm,Npc_HasItems(Trader,ItSc_Charm));};
	if(Npc_HasItems(Trader,ItSc_Fear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Fear,Npc_HasItems(Trader,ItSc_Fear));};
	if(Npc_HasItems(Trader,ITSC_GREENTENTACLE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_GREENTENTACLE,Npc_HasItems(Trader,ITSC_GREENTENTACLE));};
	if(Npc_HasItems(Trader,ITSC_SEVEREFETIDITY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SEVEREFETIDITY,Npc_HasItems(Trader,ITSC_SEVEREFETIDITY));};
	if(Npc_HasItems(Trader,ItSc_Whirlwind) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Whirlwind,Npc_HasItems(Trader,ItSc_Whirlwind));};
	if(Npc_HasItems(Trader,ItSc_SumGobSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumGobSkel,Npc_HasItems(Trader,ItSc_SumGobSkel));};
	if(Npc_HasItems(Trader,ItSc_SumSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumSkel,Npc_HasItems(Trader,ItSc_SumSkel));};
	if(Npc_HasItems(Trader,ItSc_SumDemon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumDemon,Npc_HasItems(Trader,ItSc_SumDemon));};
	if(Npc_HasItems(Trader,ItSc_ArmyOfDarkness) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_ArmyOfDarkness,Npc_HasItems(Trader,ItSc_ArmyOfDarkness));};
	if(Npc_HasItems(Trader,ITSC_DEATHBOLT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_DEATHBOLT,Npc_HasItems(Trader,ITSC_DEATHBOLT));};
	if(Npc_HasItems(Trader,ITSC_ManaForLife) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_ManaForLife,Npc_HasItems(Trader,ITSC_ManaForLife));};
	if(Npc_HasItems(Trader,ITSC_SUMZOMBIE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMZOMBIE,Npc_HasItems(Trader,ITSC_SUMZOMBIE));};
	if(Npc_HasItems(Trader,ITSC_SWARM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SWARM,Npc_HasItems(Trader,ITSC_SWARM));};
	if(Npc_HasItems(Trader,ITSC_ENERGYBALL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_ENERGYBALL,Npc_HasItems(Trader,ITSC_ENERGYBALL));};
	if(Npc_HasItems(Trader,ITSC_DEATHBALL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_DEATHBALL,Npc_HasItems(Trader,ITSC_DEATHBALL));};
	if(Npc_HasItems(Trader,ItSc_MassDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_MassDeath,Npc_HasItems(Trader,ItSc_MassDeath));};
	if(Npc_HasItems(Trader,ITSC_SKULL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SKULL,Npc_HasItems(Trader,ITSC_SKULL));};
	if(Npc_HasItems(Trader,ItSc_TrfSheep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfSheep,Npc_HasItems(Trader,ItSc_TrfSheep));};
	if(Npc_HasItems(Trader,ItSc_TrfScavenger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfScavenger,Npc_HasItems(Trader,ItSc_TrfScavenger));};
	if(Npc_HasItems(Trader,ItSc_TrfGiantBug) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfGiantBug,Npc_HasItems(Trader,ItSc_TrfGiantBug));};
	if(Npc_HasItems(Trader,ItSc_TrfWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfWolf,Npc_HasItems(Trader,ItSc_TrfWolf));};
	if(Npc_HasItems(Trader,ItSc_TrfWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfWaran,Npc_HasItems(Trader,ItSc_TrfWaran));};
	if(Npc_HasItems(Trader,ItSc_TrfSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfSnapper,Npc_HasItems(Trader,ItSc_TrfSnapper));};
	if(Npc_HasItems(Trader,ItSc_TrfWarg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfWarg,Npc_HasItems(Trader,ItSc_TrfWarg));};
	if(Npc_HasItems(Trader,ItSc_TrfFireWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfFireWaran,Npc_HasItems(Trader,ItSc_TrfFireWaran));};
	if(Npc_HasItems(Trader,ItSc_TrfLurker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfLurker,Npc_HasItems(Trader,ItSc_TrfLurker));};
	if(Npc_HasItems(Trader,ItSc_TrfShadowbeast) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfShadowbeast,Npc_HasItems(Trader,ItSc_TrfShadowbeast));};
	if(Npc_HasItems(Trader,ItSc_TrfDragonSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfDragonSnapper,Npc_HasItems(Trader,ItSc_TrfDragonSnapper));};
	if(Npc_HasItems(Trader,ItSc_TrfMeatBug) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfMeatBug,Npc_HasItems(Trader,ItSc_TrfMeatBug));};
	if(Npc_HasItems(Trader,ItSc_BreathOfDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_BreathOfDeath,Npc_HasItems(Trader,ItSc_BreathOfDeath));};
	if(Npc_HasItems(Trader,ItSc_SumGol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumGol,Npc_HasItems(Trader,ItSc_SumGol));};
	if(Npc_HasItems(Trader,ITSC_SUMFIREGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMFIREGOL,Npc_HasItems(Trader,ITSC_SUMFIREGOL));};
	if(Npc_HasItems(Trader,ITSC_SUMICEGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMICEGOL,Npc_HasItems(Trader,ITSC_SUMICEGOL));};
	if(Npc_HasItems(Trader,ITSC_SUMSWPGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMSWPGOL,Npc_HasItems(Trader,ITSC_SUMSWPGOL));};
	if(Npc_HasItems(Trader,ItSc_Ressurect) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Ressurect,Npc_HasItems(Trader,ItSc_Ressurect));};
	if(Npc_HasItems(Trader,ItMi_Addon_Shell_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Shell_01,Npc_HasItems(Trader,ItMi_Addon_Shell_01));};
	if(Npc_HasItems(Trader,ItMi_Addon_Shell_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Shell_02,Npc_HasItems(Trader,ItMi_Addon_Shell_02));};
	if(Npc_HasItems(Trader,ItSe_ErzFisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_ErzFisch,Npc_HasItems(Trader,ItSe_ErzFisch));};
	if(Npc_HasItems(Trader,ItSe_GoldFisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldFisch,Npc_HasItems(Trader,ItSe_GoldFisch));};
	if(Npc_HasItems(Trader,ItSe_Ringfisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Ringfisch,Npc_HasItems(Trader,ItSe_Ringfisch));};
	if(Npc_HasItems(Trader,ItSe_LockpickFisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_LockpickFisch,Npc_HasItems(Trader,ItSe_LockpickFisch));};
	if(Npc_HasItems(Trader,ItMi_PocketFingers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PocketFingers,Npc_HasItems(Trader,ItMi_PocketFingers));};
	if(Npc_HasItems(Trader,ItMi_VatrasPurse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VatrasPurse,Npc_HasItems(Trader,ItMi_VatrasPurse));};
	if(Npc_HasItems(Trader,ItMi_HaniarPurse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HaniarPurse,Npc_HasItems(Trader,ItMi_HaniarPurse));};
	if(Npc_HasItems(Trader,ItMi_PurseOsair) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PurseOsair,Npc_HasItems(Trader,ItMi_PurseOsair));};
	if(Npc_HasItems(Trader,ItSe_GoldPocket25) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldPocket25,Npc_HasItems(Trader,ItSe_GoldPocket25));};
	if(Npc_HasItems(Trader,ITSE_LANZPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_LANZPOCKET,Npc_HasItems(Trader,ITSE_LANZPOCKET));};
	if(Npc_HasItems(Trader,ItSe_GoldPocket50) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldPocket50,Npc_HasItems(Trader,ItSe_GoldPocket50));};
	if(Npc_HasItems(Trader,ItSe_GoldPocket100) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldPocket100,Npc_HasItems(Trader,ItSe_GoldPocket100));};
	if(Npc_HasItems(Trader,ITSE_GERBRANDPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_GERBRANDPOCKET,Npc_HasItems(Trader,ITSE_GERBRANDPOCKET));};
	if(Npc_HasItems(Trader,ITSE_NIGELPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_NIGELPOCKET,Npc_HasItems(Trader,ITSE_NIGELPOCKET));};
	if(Npc_HasItems(Trader,ITSE_TALIASANPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_TALIASANPOCKET,Npc_HasItems(Trader,ITSE_TALIASANPOCKET));};
	if(Npc_HasItems(Trader,ItSe_HannasBeutel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_HannasBeutel,Npc_HasItems(Trader,ItSe_HannasBeutel));};
	if(Npc_HasItems(Trader,ITSE_LUTTEROBIGPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_LUTTEROBIGPOCKET,Npc_HasItems(Trader,ITSE_LUTTEROBIGPOCKET));};
	if(Npc_HasItems(Trader,ItSe_Weapon_Sack) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Weapon_Sack,Npc_HasItems(Trader,ItSe_Weapon_Sack));};
	if(Npc_HasItems(Trader,ItSe_Arrow_Sack) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Arrow_Sack,Npc_HasItems(Trader,ItSe_Arrow_Sack));};
	if(Npc_HasItems(Trader,ItSe_GOLDSTACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GOLDSTACK,Npc_HasItems(Trader,ItSe_GOLDSTACK));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket,Npc_HasItems(Trader,ItSl_GoldPocket));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Woman,Npc_HasItems(Trader,ItSl_GoldPocket_Woman));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Woman_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Woman_New,Npc_HasItems(Trader,ItSl_GoldPocket_Woman_New));};
	if(Npc_HasItems(Trader,ItSl_HeroBags) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_HeroBags,Npc_HasItems(Trader,ItSl_HeroBags));};
	if(Npc_HasItems(Trader,ItSl_CraitBag) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_CraitBag,Npc_HasItems(Trader,ItSl_CraitBag));};
	if(Npc_HasItems(Trader,ItSl_HeroPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_HeroPocket,Npc_HasItems(Trader,ItSl_HeroPocket));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_None) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_None,Npc_HasItems(Trader,ItSl_GoldPocket_None));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Low,Npc_HasItems(Trader,ItSl_GoldPocket_Low));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Medium) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Medium,Npc_HasItems(Trader,ItSl_GoldPocket_Medium));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Full) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Full,Npc_HasItems(Trader,ItSl_GoldPocket_Full));};
	if(Npc_HasItems(Trader,Itar_Avabul_Wings) > 0)
	{
		Npc_RemoveInvItems(Trader,Itar_Avabul_Wings,Npc_HasItems(Trader,Itar_Avabul_Wings));};
	if(Npc_HasItems(Trader,Itar_Ghost_Candle) > 0)
	{
		Npc_RemoveInvItems(Trader,Itar_Ghost_Candle,Npc_HasItems(Trader,Itar_Ghost_Candle));};
	if(Npc_HasItems(Trader,ITMI_GHOST_TORCH_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_GHOST_TORCH_01,Npc_HasItems(Trader,ITMI_GHOST_TORCH_01));};
	if(Npc_HasItems(Trader,ItWr_StrStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StrStonePlate1_Addon,Npc_HasItems(Trader,ItWr_StrStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_StrStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StrStonePlate2_Addon,Npc_HasItems(Trader,ItWr_StrStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_StrStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StrStonePlate3_Addon,Npc_HasItems(Trader,ItWr_StrStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_DexStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexStonePlate1_Addon,Npc_HasItems(Trader,ItWr_DexStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_DexStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexStonePlate2_Addon,Npc_HasItems(Trader,ItWr_DexStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_DexStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexStonePlate3_Addon,Npc_HasItems(Trader,ItWr_DexStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_HitPointStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HitPointStonePlate1_Addon,Npc_HasItems(Trader,ItWr_HitPointStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_HitPointStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HitPointStonePlate2_Addon,Npc_HasItems(Trader,ItWr_HitPointStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_HitPointStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HitPointStonePlate3_Addon,Npc_HasItems(Trader,ItWr_HitPointStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_ManaStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaStonePlate1_Addon,Npc_HasItems(Trader,ItWr_ManaStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_ManaStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaStonePlate2_Addon,Npc_HasItems(Trader,ItWr_ManaStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_ManaStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaStonePlate3_Addon,Npc_HasItems(Trader,ItWr_ManaStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_OneHStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OneHStonePlate1_Addon,Npc_HasItems(Trader,ItWr_OneHStonePlate1_Addon));};
		if(Npc_HasItems(Trader,ItWr_OneHStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OneHStonePlate2_Addon,Npc_HasItems(Trader,ItWr_OneHStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_OneHStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OneHStonePlate3_Addon,Npc_HasItems(Trader,ItWr_OneHStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_TwoHStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_TwoHStonePlate1_Addon,Npc_HasItems(Trader,ItWr_TwoHStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_TwoHStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_TwoHStonePlate2_Addon,Npc_HasItems(Trader,ItWr_TwoHStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_TwoHStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_TwoHStonePlate3_Addon,Npc_HasItems(Trader,ItWr_TwoHStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_BowStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BowStonePlate1_Addon,Npc_HasItems(Trader,ItWr_BowStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_BowStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BowStonePlate2_Addon,Npc_HasItems(Trader,ItWr_BowStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_BowStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BowStonePlate3_Addon,Npc_HasItems(Trader,ItWr_BowStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_CrsBowStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CrsBowStonePlate1_Addon,Npc_HasItems(Trader,ItWr_CrsBowStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_CrsBowStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CrsBowStonePlate2_Addon,Npc_HasItems(Trader,ItWr_CrsBowStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_CrsBowStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CrsBowStonePlate3_Addon,Npc_HasItems(Trader,ItWr_CrsBowStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ITWR_STAMINAPOINTSTONEPLATE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_STAMINAPOINTSTONEPLATE,Npc_HasItems(Trader,ITWR_STAMINAPOINTSTONEPLATE));};
	if(Npc_HasItems(Trader,ItLsTorch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorch,Npc_HasItems(Trader,ItLsTorch));};
	if(Npc_HasItems(Trader,ItLsTorchburning) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorchburning,Npc_HasItems(Trader,ItLsTorchburning));};
	if(Npc_HasItems(Trader,ItLsTorchburned) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorchburned,Npc_HasItems(Trader,ItLsTorchburned));};
	if(Npc_HasItems(Trader,ItLsTorchFirespit) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorchFirespit,Npc_HasItems(Trader,ItLsTorchFirespit));};
	if(Npc_HasItems(Trader,ItLsFireTorch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsFireTorch,Npc_HasItems(Trader,ItLsFireTorch));};
	if(Npc_HasItems(Trader,ItWr_Canthars_KomproBrief_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(Trader,ItWr_Canthars_KomproBrief_MIS));};
	if(Npc_HasItems(Trader,ItMw_2h_Rod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Rod,Npc_HasItems(Trader,ItMw_2h_Rod));};
	if(Npc_HasItems(Trader,ItMw_2h_Rod_Fake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Rod_Fake,Npc_HasItems(Trader,ItMw_2h_Rod_Fake));};
	if(Npc_HasItems(Trader,ItMi_CoragonsSilber) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CoragonsSilber,Npc_HasItems(Trader,ItMi_CoragonsSilber));};
	if(Npc_HasItems(Trader,ItMi_TheklasPaket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TheklasPaket,Npc_HasItems(Trader,ItMi_TheklasPaket));};
	if(Npc_HasItems(Trader,ItMi_MariasGoldPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MariasGoldPlate,Npc_HasItems(Trader,ItMi_MariasGoldPlate));};
	if(Npc_HasItems(Trader,ItRi_ValentinosRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_ValentinosRing,Npc_HasItems(Trader,ItRi_ValentinosRing));};
	if(Npc_HasItems(Trader,ItWr_Kraeuterliste) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Kraeuterliste,Npc_HasItems(Trader,ItWr_Kraeuterliste));};
	if(Npc_HasItems(Trader,ItWr_ManaRezept) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaRezept,Npc_HasItems(Trader,ItWr_ManaRezept));};
	if(Npc_HasItems(Trader,ItWr_Passierschein) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Passierschein,Npc_HasItems(Trader,ItWr_Passierschein));};
	if(Npc_HasItems(Trader,ItMi_HerbPaket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HerbPaket,Npc_HasItems(Trader,ItMi_HerbPaket));};
	if(Npc_HasItems(Trader,ItMi_JointPacket_OW) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JointPacket_OW,Npc_HasItems(Trader,ItMi_JointPacket_OW));};
	if(Npc_HasItems(Trader,ITMI_DROGENPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DROGENPOCKET,Npc_HasItems(Trader,ITMI_DROGENPOCKET));};
	if(Npc_HasItems(Trader,ITMI_LARIUSGOLDPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_LARIUSGOLDPOCKET,Npc_HasItems(Trader,ITMI_LARIUSGOLDPOCKET));};
	if(Npc_HasItems(Trader,ItFo_SmellyFish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_SmellyFish,Npc_HasItems(Trader,ItFo_SmellyFish));};
	if(Npc_HasItems(Trader,ItFo_HalvorFish_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_HalvorFish_MIS,Npc_HasItems(Trader,ItFo_HalvorFish_MIS));};
	if(Npc_HasItems(Trader,ItWr_HalvorMessage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HalvorMessage,Npc_HasItems(Trader,ItWr_HalvorMessage));};
	if(Npc_HasItems(Trader,ItWr_DexterOrder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexterOrder,Npc_HasItems(Trader,ItWr_DexterOrder));};
	if(Npc_HasItems(Trader,ItWr_DexTrait) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexTrait,Npc_HasItems(Trader,ItWr_DexTrait));};
	if(Npc_HasItems(Trader,ItMw_AlriksSword_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_AlriksSword_Mis,Npc_HasItems(Trader,ItMw_AlriksSword_Mis));};
	if(Npc_HasItems(Trader,ItWr_VatrasMessage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VatrasMessage,Npc_HasItems(Trader,ItWr_VatrasMessage));};
	if(Npc_HasItems(Trader,ItWr_VatrasMessage_Open) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VatrasMessage_Open,Npc_HasItems(Trader,ItWr_VatrasMessage_Open));};
	if(Npc_HasItems(Trader,ItFo_Schafswurst) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Schafswurst,Npc_HasItems(Trader,ItFo_Schafswurst));};
	if(Npc_HasItems(Trader,ItPo_Perm_LittleMana) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_LittleMana,Npc_HasItems(Trader,ItPo_Perm_LittleMana));};
	if(Npc_HasItems(Trader,ItWr_Passage_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Passage_MIS,Npc_HasItems(Trader,ItWr_Passage_MIS));};
	if(Npc_HasItems(Trader,ItWr_BanditLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BanditLetter_MIS,Npc_HasItems(Trader,ItWr_BanditLetter_MIS));};
	if(Npc_HasItems(Trader,ItWr_Poster_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Poster_MIS,Npc_HasItems(Trader,ItWr_Poster_MIS));};
	if(Npc_HasItems(Trader,ItRw_Bow_L_03_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_03_MIS,Npc_HasItems(Trader,ItRw_Bow_L_03_MIS));};
	if(Npc_HasItems(Trader,ItRi_Prot_Point_01_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Point_01_MIS,Npc_HasItems(Trader,ItRi_Prot_Point_01_MIS));};
	if(Npc_HasItems(Trader,ItMi_EddasStatue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_EddasStatue,Npc_HasItems(Trader,ItMi_EddasStatue));};
	if(Npc_HasItems(Trader,ItWr_Schuldenbuch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Schuldenbuch,Npc_HasItems(Trader,ItWr_Schuldenbuch));};
	if(Npc_HasItems(Trader,ItPl_Xagitta_Herb_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Xagitta_Herb_MIS,Npc_HasItems(Trader,ItPl_Xagitta_Herb_MIS));};
	if(Npc_HasItems(Trader,ItRw_DragomirsArmbrust_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_DragomirsArmbrust_MIS,Npc_HasItems(Trader,ItRw_DragomirsArmbrust_MIS));};
	if(Npc_HasItems(Trader,Holy_Hammer_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,Holy_Hammer_MIS,Npc_HasItems(Trader,Holy_Hammer_MIS));};
	if(Npc_HasItems(Trader,HOLY_HAMMER_MIS_NEW) > 0)
	{
		Npc_RemoveInvItems(Trader,HOLY_HAMMER_MIS_NEW,Npc_HasItems(Trader,HOLY_HAMMER_MIS_NEW));};
	if(Npc_HasItems(Trader,ITRI_QUEST_PAL_RING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_QUEST_PAL_RING,Npc_HasItems(Trader,ITRI_QUEST_PAL_RING));};
	if(Npc_HasItems(Trader,ITWR_HOLGER_LETTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_HOLGER_LETTER,Npc_HasItems(Trader,ITWR_HOLGER_LETTER));};
	if(Npc_HasItems(Trader,ITMI_DARON_SUMA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DARON_SUMA,Npc_HasItems(Trader,ITMI_DARON_SUMA));};
	if(Npc_HasItems(Trader,ITAM_HOLGER_AMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_HOLGER_AMULET,Npc_HasItems(Trader,ITAM_HOLGER_AMULET));};
	if(Npc_HasItems(Trader,ItMi_StoneOfKnowlegde_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_StoneOfKnowlegde_MIS,Npc_HasItems(Trader,ItMi_StoneOfKnowlegde_MIS));};
	if(Npc_HasItems(Trader,ItMi_ParlanRelic_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ParlanRelic_MIS,Npc_HasItems(Trader,ItMi_ParlanRelic_MIS));};
	if(Npc_HasItems(Trader,ItWr_PaladinLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_PaladinLetter_MIS,Npc_HasItems(Trader,ItWr_PaladinLetter_MIS));};
	if(Npc_HasItems(Trader,ItWr_LetterForGorn_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LetterForGorn_MIS,Npc_HasItems(Trader,ItWr_LetterForGorn_MIS));};
	if(Npc_HasItems(Trader,ItMi_GornsTreasure_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GornsTreasure_MIS,Npc_HasItems(Trader,ItMi_GornsTreasure_MIS));};
	if(Npc_HasItems(Trader,ItWr_Silvestro_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Silvestro_MIS,Npc_HasItems(Trader,ItWr_Silvestro_MIS));};
	if(Npc_HasItems(Trader,ItAt_ClawLeader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ClawLeader,Npc_HasItems(Trader,ItAt_ClawLeader));};
	if(Npc_HasItems(Trader,ITAT_CLAWBLACKSNAPPER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_CLAWBLACKSNAPPER,Npc_HasItems(Trader,ITAT_CLAWBLACKSNAPPER));};
	if(Npc_HasItems(Trader,ITAT_VEPRFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_VEPRFUR,Npc_HasItems(Trader,ITAT_VEPRFUR));};
	if(Npc_HasItems(Trader,ITAT_NIGHTHUNTERFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_NIGHTHUNTERFUR,Npc_HasItems(Trader,ITAT_NIGHTHUNTERFUR));};
	if(Npc_HasItems(Trader,ITAT_LUKEREGG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_LUKEREGG,Npc_HasItems(Trader,ITAT_LUKEREGG));};
	if(Npc_HasItems(Trader,ItSe_Olav) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Olav,Npc_HasItems(Trader,ItSe_Olav));};
	if(Npc_HasItems(Trader,ItMi_Plate_MISGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Plate_MISGold,Npc_HasItems(Trader,ItMi_Plate_MISGold));};
	if(Npc_HasItems(Trader,ItWr_Bloody_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Bloody_MIS,Npc_HasItems(Trader,ItWr_Bloody_MIS));};
	if(Npc_HasItems(Trader,ItWr_Pfandbrief_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Pfandbrief_MIS,Npc_HasItems(Trader,ItWr_Pfandbrief_MIS));};
	if(Npc_HasItems(Trader,ITWR_LUTEROLOAN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_LUTEROLOAN,Npc_HasItems(Trader,ITWR_LUTEROLOAN));};
	if(Npc_HasItems(Trader,ITWR_MAP_OLDWORLD_OREMINES_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_OLDWORLD_OREMINES_MIS_1,Npc_HasItems(Trader,ITWR_MAP_OLDWORLD_OREMINES_MIS_1));};
	if(Npc_HasItems(Trader,ItWr_Manowar) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Manowar,Npc_HasItems(Trader,ItWr_Manowar));};
	if(Npc_HasItems(Trader,ItWr_KDWLetter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_KDWLetter,Npc_HasItems(Trader,ItWr_KDWLetter));};
	if(Npc_HasItems(Trader,ItWr_GilbertLetter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_GilbertLetter,Npc_HasItems(Trader,ItWr_GilbertLetter));};
	if(Npc_HasItems(Trader,ItRi_Tengron) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Tengron,Npc_HasItems(Trader,ItRi_Tengron));};
	if(Npc_HasItems(Trader,ItWr_Diofant_Paper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Diofant_Paper,Npc_HasItems(Trader,ItWr_Diofant_Paper));};
	if(Npc_HasItems(Trader,ItWr_LukasLetter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LukasLetter,Npc_HasItems(Trader,ItWr_LukasLetter));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_MIS,Npc_HasItems(Trader,ItMi_InnosEye_MIS));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_Bad) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_Bad,Npc_HasItems(Trader,ItMi_InnosEye_Bad));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_Discharged_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_Discharged_Mis,Npc_HasItems(Trader,ItMi_InnosEye_Discharged_Mis));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_Broken_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_Broken_Mis,Npc_HasItems(Trader,ItMi_InnosEye_Broken_Mis));};
	if(Npc_HasItems(Trader,ItWr_PermissionToWearInnosEye_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_PermissionToWearInnosEye_MIS,Npc_HasItems(Trader,ItWr_PermissionToWearInnosEye_MIS));};
	if(Npc_HasItems(Trader,ItWr_XardasBookForPyrokar_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasBookForPyrokar_Mis,Npc_HasItems(Trader,ItWr_XardasBookForPyrokar_Mis));};
	if(Npc_HasItems(Trader,ItWr_CorneliusTagebuch_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CorneliusTagebuch_Mis,Npc_HasItems(Trader,ItWr_CorneliusTagebuch_Mis));};
	if(Npc_HasItems(Trader,ITWR_DementorObsessionBook_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DementorObsessionBook_MIS,Npc_HasItems(Trader,ITWR_DementorObsessionBook_MIS));};
	if(Npc_HasItems(Trader,ItWr_PyrokarsObsessionList) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_PyrokarsObsessionList,Npc_HasItems(Trader,ItWr_PyrokarsObsessionList));};
	if(Npc_HasItems(Trader,ItPo_HealHilda_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_HealHilda_MIS,Npc_HasItems(Trader,ItPo_HealHilda_MIS));};
	if(Npc_HasItems(Trader,ItMw_MalethsGehstock_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_MalethsGehstock_MIS,Npc_HasItems(Trader,ItMw_MalethsGehstock_MIS));};
	if(Npc_HasItems(Trader,ItMi_MalethsBanditGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MalethsBanditGold,Npc_HasItems(Trader,ItMi_MalethsBanditGold));};
	if(Npc_HasItems(Trader,ItMi_Moleratlubric_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Moleratlubric_MIS,Npc_HasItems(Trader,ItMi_Moleratlubric_MIS));};
	if(Npc_HasItems(Trader,ItWr_BabosLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BabosLetter_MIS,Npc_HasItems(Trader,ItWr_BabosLetter_MIS));};
	if(Npc_HasItems(Trader,ItWr_BabosPinUp_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BabosPinUp_MIS,Npc_HasItems(Trader,ItWr_BabosPinUp_MIS));};
	if(Npc_HasItems(Trader,ItWr_BabosDocs_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BabosDocs_MIS,Npc_HasItems(Trader,ItWr_BabosDocs_MIS));};
	if(Npc_HasItems(Trader,ItWr_Astronomy_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Astronomy_Mis,Npc_HasItems(Trader,ItWr_Astronomy_Mis));};
	if(Npc_HasItems(Trader,ItPo_HealObsession_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_HealObsession_MIS,Npc_HasItems(Trader,ItPo_HealObsession_MIS));};
	if(Npc_HasItems(Trader,ItSe_Golemchest_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Golemchest_Mis,Npc_HasItems(Trader,ItSe_Golemchest_Mis));};
	if(Npc_HasItems(Trader,ITWR_SHATTEREDGOLEM_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_SHATTEREDGOLEM_MIS_1,Npc_HasItems(Trader,ITWR_SHATTEREDGOLEM_MIS_1));};
	if(Npc_HasItems(Trader,ItWr_DiegosLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DiegosLetter_MIS,Npc_HasItems(Trader,ItWr_DiegosLetter_MIS));};
	if(Npc_HasItems(Trader,ItSe_DiegosTreasure_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_DiegosTreasure_Mis,Npc_HasItems(Trader,ItSe_DiegosTreasure_Mis));};
	if(Npc_HasItems(Trader,ItMi_UltharsHolyWater_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UltharsHolyWater_Mis,Npc_HasItems(Trader,ItMi_UltharsHolyWater_Mis));};
	if(Npc_HasItems(Trader,ItWr_MinenAnteil_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_MinenAnteil_Mis,Npc_HasItems(Trader,ItWr_MinenAnteil_Mis));};
	if(Npc_HasItems(Trader,ItAm_Prot_BlackEye_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_BlackEye_Mis,Npc_HasItems(Trader,ItAm_Prot_BlackEye_Mis));};
	if(Npc_HasItems(Trader,ItMi_KarrasBlessedStone_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KarrasBlessedStone_Mis,Npc_HasItems(Trader,ItMi_KarrasBlessedStone_Mis));};
	if(Npc_HasItems(Trader,ItWr_RichterKomproBrief_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_RichterKomproBrief_MIS,Npc_HasItems(Trader,ItWr_RichterKomproBrief_MIS));};
	if(Npc_HasItems(Trader,ItWr_MorgahardTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_MorgahardTip,Npc_HasItems(Trader,ItWr_MorgahardTip));};
	if(Npc_HasItems(Trader,ITWR_MAP_SHRINE_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_SHRINE_MIS_1,Npc_HasItems(Trader,ITWR_MAP_SHRINE_MIS_1));};
	if(Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VinosKellergeister_Mis,Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis));};
	if(Npc_HasItems(Trader,ITWR_DEATH1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH1,Npc_HasItems(Trader,ITWR_DEATH1));};
	if(Npc_HasItems(Trader,ITWR_DEATH2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH2,Npc_HasItems(Trader,ITWR_DEATH2));};
	if(Npc_HasItems(Trader,ItAm_Mana_Angar_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Mana_Angar_MIS,Npc_HasItems(Trader,ItAm_Mana_Angar_MIS));};
	if(Npc_HasItems(Trader,ItMW_1H_FerrosSword_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_1H_FerrosSword_Mis,Npc_HasItems(Trader,ItMW_1H_FerrosSword_Mis));};
	if(Npc_HasItems(Trader,ItMi_KerolothsGeldbeutel_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerolothsGeldbeutel_MIS,Npc_HasItems(Trader,ItMi_KerolothsGeldbeutel_MIS));};
	if(Npc_HasItems(Trader,ItMi_KerolothsGeldbeutelLeer_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerolothsGeldbeutelLeer_MIS,Npc_HasItems(Trader,ItMi_KerolothsGeldbeutelLeer_MIS));};
	if(Npc_HasItems(Trader,ItRw_SengrathsArmbrust_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_SengrathsArmbrust_MIS,Npc_HasItems(Trader,ItRw_SengrathsArmbrust_MIS));};
	if(Npc_HasItems(Trader,ItAt_TalbinsLurkerSkin) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TalbinsLurkerSkin,Npc_HasItems(Trader,ItAt_TalbinsLurkerSkin));};
	if(Npc_HasItems(Trader,ItAt_DragonEgg_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonEgg_MIS,Npc_HasItems(Trader,ItAt_DragonEgg_MIS));};
	if(Npc_HasItems(Trader,ItRi_OrcEliteRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_OrcEliteRing,Npc_HasItems(Trader,ItRi_OrcEliteRing));};
	if(Npc_HasItems(Trader,ItPo_DragonEggDrinkNeoras_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_DragonEggDrinkNeoras_MIS,Npc_HasItems(Trader,ItPo_DragonEggDrinkNeoras_MIS));};
	if(Npc_HasItems(Trader,ITWR_MAP_ORCELITE_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_ORCELITE_MIS_1,Npc_HasItems(Trader,ITWR_MAP_ORCELITE_MIS_1));};
	if(Npc_HasItems(Trader,ITWR_MAP_CAVES_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_CAVES_MIS_1,Npc_HasItems(Trader,ITWR_MAP_CAVES_MIS_1));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT1,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT1));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT2,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT2));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT3,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT3));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT4,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT4));};
	if(Npc_HasItems(Trader,ItRi_Ulf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ulf,Npc_HasItems(Trader,ItRi_Ulf));};
	if(Npc_HasItems(Trader,ItWr_XardasLetterToOpenBook_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasLetterToOpenBook_MIS,Npc_HasItems(Trader,ItWr_XardasLetterToOpenBook_MIS));};
	if(Npc_HasItems(Trader,ItWr_HallsofIrdorath_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HallsofIrdorath_Mis,Npc_HasItems(Trader,ItWr_HallsofIrdorath_Mis));};
	if(Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HallsofIrdorath_Open_Mis,Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis));};
	if(Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasSeamapBook_Mis,Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis));};
	if(Npc_HasItems(Trader,ItWr_UseLampIdiot_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_UseLampIdiot_Mis,Npc_HasItems(Trader,ItWr_UseLampIdiot_Mis));};
	if(Npc_HasItems(Trader,ItWr_Seamap_Irdorath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Seamap_Irdorath,Npc_HasItems(Trader,ItWr_Seamap_Irdorath));};
	if(Npc_HasItems(Trader,ITMI_SEAMAPLOSTISLAND) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SEAMAPLOSTISLAND,Npc_HasItems(Trader,ITMI_SEAMAPLOSTISLAND));};
	if(Npc_HasItems(Trader,ITWr_ForgedShipLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWr_ForgedShipLetter_MIS,Npc_HasItems(Trader,ITWr_ForgedShipLetter_MIS));};
	if(Npc_HasItems(Trader,ItPo_PotionOfDeath_01_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_PotionOfDeath_01_Mis,Npc_HasItems(Trader,ItPo_PotionOfDeath_01_Mis));};
	if(Npc_HasItems(Trader,ItPo_PotionOfDeath_02_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_PotionOfDeath_02_Mis,Npc_HasItems(Trader,ItPo_PotionOfDeath_02_Mis));};
	if(Npc_HasItems(Trader,ItAm_AmulettOfDeath_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_AmulettOfDeath_Mis,Npc_HasItems(Trader,ItAm_AmulettOfDeath_Mis));};
	if(Npc_HasItems(Trader,ItPo_HealRandolph_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_HealRandolph_MIS,Npc_HasItems(Trader,ItPo_HealRandolph_MIS));};
	if(Npc_HasItems(Trader,ItSe_XardasNotfallBeutel_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_XardasNotfallBeutel_MIS,Npc_HasItems(Trader,ItSe_XardasNotfallBeutel_MIS));};
	if(Npc_HasItems(Trader,ItWr_XardasErmahnungFuerIdioten_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasErmahnungFuerIdioten_MIS,Npc_HasItems(Trader,ItWr_XardasErmahnungFuerIdioten_MIS));};
	if(Npc_HasItems(Trader,ItWr_Krypta_Garon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Krypta_Garon,Npc_HasItems(Trader,ItWr_Krypta_Garon));};
	if(Npc_HasItems(Trader,ItWr_LastDoorToUndeadDrgDI_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LastDoorToUndeadDrgDI_MIS,Npc_HasItems(Trader,ItWr_LastDoorToUndeadDrgDI_MIS));};
	if(Npc_HasItems(Trader,ItWr_Rezept_MegaDrink_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Rezept_MegaDrink_MIS,Npc_HasItems(Trader,ItWr_Rezept_MegaDrink_MIS));};
	if(Npc_HasItems(Trader,ItWr_Diary_BlackNovice_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Diary_BlackNovice_MIS,Npc_HasItems(Trader,ItWr_Diary_BlackNovice_MIS));};
	if(Npc_HasItems(Trader,ItWr_ZugBruecke_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ZugBruecke_MIS,Npc_HasItems(Trader,ItWr_ZugBruecke_MIS));};
	if(Npc_HasItems(Trader,ItMi_PowerEye) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PowerEye,Npc_HasItems(Trader,ItMi_PowerEye));};
	if(Npc_HasItems(Trader,ITMI_PRISONSOUL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PRISONSOUL,Npc_HasItems(Trader,ITMI_PRISONSOUL));};
	if(Npc_HasItems(Trader,ITMI_PRISONSOUL_AWAKE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PRISONSOUL_AWAKE,Npc_HasItems(Trader,ITMI_PRISONSOUL_AWAKE));};
	if(Npc_HasItems(Trader,ITMI_ORCBLOOD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCBLOOD,Npc_HasItems(Trader,ITMI_ORCBLOOD));};
	if(Npc_HasItems(Trader,ITMI_BARLOKHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BARLOKHEART,Npc_HasItems(Trader,ITMI_BARLOKHEART));};
	if(Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon_Sealed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_SaturasFirstMessage_Addon_Sealed,Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon_Sealed));};
	if(Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_SaturasFirstMessage_Addon,Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon));};
	if(Npc_HasItems(Trader,ItMi_Ornament_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Ornament_Addon,Npc_HasItems(Trader,ItMi_Ornament_Addon));};
	if(Npc_HasItems(Trader,ItMi_Ornament_Addon_Vatras) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Ornament_Addon_Vatras,Npc_HasItems(Trader,ItMi_Ornament_Addon_Vatras));};
	if(Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1,Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1));};
	if(Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_DEXTER_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_NEWWORLD_DEXTER_1,Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_DEXTER_1));};
	if(Npc_HasItems(Trader,ItRi_Ranger_Lares_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ranger_Lares_Addon,Npc_HasItems(Trader,ItRi_Ranger_Lares_Addon));};
	if(Npc_HasItems(Trader,ItRi_Ranger_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ranger_Addon,Npc_HasItems(Trader,ItRi_Ranger_Addon));};
	if(Npc_HasItems(Trader,ItRi_LanceRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_LanceRing,Npc_HasItems(Trader,ItRi_LanceRing));};
	if(Npc_HasItems(Trader,ItMi_PortalRing_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PortalRing_Addon,Npc_HasItems(Trader,ItMi_PortalRing_Addon));};
	if(Npc_HasItems(Trader,ItWr_Martin_MilizEmpfehlung_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Martin_MilizEmpfehlung_Addon,Npc_HasItems(Trader,ItWr_Martin_MilizEmpfehlung_Addon));};
	if(Npc_HasItems(Trader,ItWr_RavensKidnapperMission_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_RavensKidnapperMission_Addon,Npc_HasItems(Trader,ItWr_RavensKidnapperMission_Addon));};
	if(Npc_HasItems(Trader,ItWr_Vatras_KDFEmpfehlung_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Vatras_KDFEmpfehlung_Addon,Npc_HasItems(Trader,ItWr_Vatras_KDFEmpfehlung_Addon));};
	if(Npc_HasItems(Trader,ItMi_LostInnosStatue_Daron) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_LostInnosStatue_Daron,Npc_HasItems(Trader,ItMi_LostInnosStatue_Daron));};
	if(Npc_HasItems(Trader,ItMi_GoblinnosStatue_Daron_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GoblinnosStatue_Daron_New,Npc_HasItems(Trader,ItMi_GoblinnosStatue_Daron_New));};
	if(Npc_HasItems(Trader,ItWr_LuciasLoveLetter_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LuciasLoveLetter_Addon,Npc_HasItems(Trader,ItWr_LuciasLoveLetter_Addon));};
	if(Npc_HasItems(Trader,ItMi_Rake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Rake,Npc_HasItems(Trader,ItMi_Rake));};
	if(Npc_HasItems(Trader,ItRi_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_BanditTrader,Npc_HasItems(Trader,ItRi_Addon_BanditTrader));};
	if(Npc_HasItems(Trader,ItWr_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Addon_BanditTrader,Npc_HasItems(Trader,ItWr_Addon_BanditTrader));};
	if(Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven));};
	if(Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven_opened) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven_opened));};
	if(Npc_HasItems(Trader,ItAm_Addon_WispDetector) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_WispDetector,Npc_HasItems(Trader,ItAm_Addon_WispDetector));};
	if(Npc_HasItems(Trader,ItFo_Addon_Krokofleisch_Mission) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Krokofleisch_Mission,Npc_HasItems(Trader,ItFo_Addon_Krokofleisch_Mission));};
	if(Npc_HasItems(Trader,ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_MorgansRing_Mission,Npc_HasItems(Trader,ItRi_Addon_MorgansRing_Mission));};
	if(Npc_HasItems(Trader,FakeUnitor) > 0)
	{
		Npc_RemoveInvItems(Trader,FakeUnitor,Npc_HasItems(Trader,FakeUnitor));};
	if(Npc_HasItems(Trader,ItMi_Focus) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Focus,Npc_HasItems(Trader,ItMi_Focus));};
	if(Npc_HasItems(Trader,ItMi_UnSharp_MagicCrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UnSharp_MagicCrystal,Npc_HasItems(Trader,ItMi_UnSharp_MagicCrystal));};
	if(Npc_HasItems(Trader,ItMi_MagicCrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicCrystal,Npc_HasItems(Trader,ItMi_MagicCrystal));};
	if(Npc_HasItems(Trader,ItMi_Addon_Steel_Paket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Steel_Paket,Npc_HasItems(Trader,ItMi_Addon_Steel_Paket));};
	if(Npc_HasItems(Trader,ItWr_StonePlateCommon_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StonePlateCommon_Addon,Npc_HasItems(Trader,ItWr_StonePlateCommon_Addon));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_01,Npc_HasItems(Trader,ItMi_Addon_Stone_01));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_05,Npc_HasItems(Trader,ItMi_Addon_Stone_05));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_03,Npc_HasItems(Trader,ItMi_Addon_Stone_03));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_04,Npc_HasItems(Trader,ItMi_Addon_Stone_04));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_02,Npc_HasItems(Trader,ItMi_Addon_Stone_02));};
	if(Npc_HasItems(Trader,ItMI_Addon_Kompass_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMI_Addon_Kompass_Mis,Npc_HasItems(Trader,ItMI_Addon_Kompass_Mis));};
	if(Npc_HasItems(Trader,ItSE_Addon_FrancisChest) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSE_Addon_FrancisChest,Npc_HasItems(Trader,ItSE_Addon_FrancisChest));};
	if(Npc_HasItems(Trader,ITWR_Addon_FrancisAbrechnung_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_Addon_FrancisAbrechnung_Mis,Npc_HasItems(Trader,ITWR_Addon_FrancisAbrechnung_Mis));};
	if(Npc_HasItems(Trader,ITWR_Addon_GregsLogbuch_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_Addon_GregsLogbuch_Mis,Npc_HasItems(Trader,ITWR_Addon_GregsLogbuch_Mis));};
	if(Npc_HasItems(Trader,ItMi_TempelTorKey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TempelTorKey,Npc_HasItems(Trader,ItMi_TempelTorKey));};
	if(Npc_HasItems(Trader,ItMi_Addon_Masiafadept_Kopf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Masiafadept_Kopf,Npc_HasItems(Trader,ItMi_Addon_Masiafadept_Kopf));};
	if(Npc_HasItems(Trader,ITWR_ADDON_TREASUREMAP_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_ADDON_TREASUREMAP_1,Npc_HasItems(Trader,ITWR_ADDON_TREASUREMAP_1));};
	if(Npc_HasItems(Trader,ItMi_Addon_GregsTreasureBottle_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_GregsTreasureBottle_MIS,Npc_HasItems(Trader,ItMi_Addon_GregsTreasureBottle_MIS));};
	if(Npc_HasItems(Trader,itmi_erolskelch) > 0)
	{
		Npc_RemoveInvItems(Trader,itmi_erolskelch,Npc_HasItems(Trader,itmi_erolskelch));};
	if(Npc_HasItems(Trader,ItSc_OrcHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_OrcHeal,Npc_HasItems(Trader,ItSc_OrcHeal));};
	if(Npc_HasItems(Trader,ItKe_OrcGonez) > 0)
	{
		Npc_RemoveInvItems(Trader,ItKe_OrcGonez,Npc_HasItems(Trader,ItKe_OrcGonez));};
	if(Npc_HasItems(Trader,ItWr_AboutNagDumgar_P1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AboutNagDumgar_P1,Npc_HasItems(Trader,ItWr_AboutNagDumgar_P1));};
	if(Npc_HasItems(Trader,ItWr_AboutNagDumgar_P2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AboutNagDumgar_P2,Npc_HasItems(Trader,ItWr_AboutNagDumgar_P2));};
	if(Npc_HasItems(Trader,ItWr_AboutNagDumgar_P3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AboutNagDumgar_P3,Npc_HasItems(Trader,ItWr_AboutNagDumgar_P3));};
	if(Npc_HasItems(Trader,ITWR_CBOW_T1) > 0)
	{
	Npc_RemoveInvItems(Trader,ITWR_CBOW_T1,Npc_HasItems(Trader,ITWR_CBOW_T1));};
	if(Npc_HasItems(Trader,ITWR_CBOW_T2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_CBOW_T2,Npc_HasItems(Trader,ITWR_CBOW_T2));};
	if(Npc_HasItems(Trader,ItWr_EinhandBuch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_EinhandBuch,Npc_HasItems(Trader,ItWr_EinhandBuch));};
	if(Npc_HasItems(Trader,ItWr_ZweihandBuch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ZweihandBuch,Npc_HasItems(Trader,ItWr_ZweihandBuch));};
	if(Npc_HasItems(Trader,ASTRONOMIE) > 0)
	{
		Npc_RemoveInvItems(Trader,ASTRONOMIE,Npc_HasItems(Trader,ASTRONOMIE));};
	if(Npc_HasItems(Trader,ITWR_DEMONLANG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEMONLANG,Npc_HasItems(Trader,ITWR_DEMONLANG));};
	if(Npc_HasItems(Trader,LEHREN_DER_GOETTER1) > 0)
	{
		Npc_RemoveInvItems(Trader,LEHREN_DER_GOETTER1,Npc_HasItems(Trader,LEHREN_DER_GOETTER1));};
	if(Npc_HasItems(Trader,LEHREN_DER_GOETTER2) > 0)
	{
		Npc_RemoveInvItems(Trader,LEHREN_DER_GOETTER2,Npc_HasItems(Trader,LEHREN_DER_GOETTER2));};
	if(Npc_HasItems(Trader,LEHREN_DER_GOETTER3) > 0)
	{
		Npc_RemoveInvItems(Trader,LEHREN_DER_GOETTER3,Npc_HasItems(Trader,LEHREN_DER_GOETTER3));};
	if(Npc_HasItems(Trader,DAS_MAGISCHE_ERZ) > 0)
	{
		Npc_RemoveInvItems(Trader,DAS_MAGISCHE_ERZ,Npc_HasItems(Trader,DAS_MAGISCHE_ERZ));};
	if(Npc_HasItems(Trader,SCHLACHT_UM_VARANT1) > 0)
	{
		Npc_RemoveInvItems(Trader,SCHLACHT_UM_VARANT1,Npc_HasItems(Trader,SCHLACHT_UM_VARANT1));};
	if(Npc_HasItems(Trader,SCHLACHT_UM_VARANT2) > 0)
	{
		Npc_RemoveInvItems(Trader,SCHLACHT_UM_VARANT2,Npc_HasItems(Trader,SCHLACHT_UM_VARANT2));};
	if(Npc_HasItems(Trader,ITWR_SOULRIVER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_SOULRIVER,Npc_HasItems(Trader,ITWR_SOULRIVER));};
	if(Npc_HasItems(Trader,ITWR_AZGOLOR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_AZGOLOR,Npc_HasItems(Trader,ITWR_AZGOLOR));};
	if(Npc_HasItems(Trader,ITWR_INNOSPRAY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_INNOSPRAY,Npc_HasItems(Trader,ITWR_INNOSPRAY));};
	if(Npc_HasItems(Trader,ITWR_MANIAC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MANIAC,Npc_HasItems(Trader,ITWR_MANIAC));};
	if(Npc_HasItems(Trader,ITWR_KAMPFKUNST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_KAMPFKUNST,Npc_HasItems(Trader,ITWR_KAMPFKUNST));};
	if(Npc_HasItems(Trader,ITWR_ELEMENTAREARCANEI) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_ELEMENTAREARCANEI,Npc_HasItems(Trader,ITWR_ELEMENTAREARCANEI));};
	if(Npc_HasItems(Trader,ITWR_JAGD_UND_BEUTE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_JAGD_UND_BEUTE,Npc_HasItems(Trader,ITWR_JAGD_UND_BEUTE));};
	if(Npc_HasItems(Trader,MYRTANAS_LYRIK) > 0)
	{
		Npc_RemoveInvItems(Trader,MYRTANAS_LYRIK,Npc_HasItems(Trader,MYRTANAS_LYRIK));};
	if(Npc_HasItems(Trader,WAHRE_MACHT) > 0)
	{
		Npc_RemoveInvItems(Trader,WAHRE_MACHT,Npc_HasItems(Trader,WAHRE_MACHT));};
	if(Npc_HasItems(Trader,MACHTVOLLE_KUNST) > 0)
	{
		Npc_RemoveInvItems(Trader,MACHTVOLLE_KUNST,Npc_HasItems(Trader,MACHTVOLLE_KUNST));};
	if(Npc_HasItems(Trader,GOETTERGABE) > 0)
	{
		Npc_RemoveInvItems(Trader,GOETTERGABE,Npc_HasItems(Trader,GOETTERGABE));};
	if(Npc_HasItems(Trader,GEHEIMNISSE_DER_ZAUBEREI) > 0)
	{
		Npc_RemoveInvItems(Trader,GEHEIMNISSE_DER_ZAUBEREI,Npc_HasItems(Trader,GEHEIMNISSE_DER_ZAUBEREI));};
	if(Npc_HasItems(Trader,ITWR_UMSONST_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_UMSONST_01,Npc_HasItems(Trader,ITWR_UMSONST_01));};
	if(Npc_HasItems(Trader,ITWR_ANCIENT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_ANCIENT,Npc_HasItems(Trader,ITWR_ANCIENT));};
	if(Npc_HasItems(Trader,ITWR_DRAGONTALE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DRAGONTALE,Npc_HasItems(Trader,ITWR_DRAGONTALE));};
	if(Npc_HasItems(Trader,ITWR_DRAGONTALE_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DRAGONTALE_2,Npc_HasItems(Trader,ITWR_DRAGONTALE_2));};
	if(Npc_HasItems(Trader,ITWR_DEMONTALE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEMONTALE,Npc_HasItems(Trader,ITWR_DEMONTALE));};
	if(Npc_HasItems(Trader,ITWR_SKELETONTALE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_SKELETONTALE,Npc_HasItems(Trader,ITWR_SKELETONTALE));};
	if(Npc_HasItems(Trader,ITWR_GOLEMBOOK1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_GOLEMBOOK1,Npc_HasItems(Trader,ITWR_GOLEMBOOK1));};
	if(Npc_HasItems(Trader,ITWR_GOLEMBOOK2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_GOLEMBOOK2,Npc_HasItems(Trader,ITWR_GOLEMBOOK2));};
	if(Npc_HasItems(Trader,ELEMENTARE_ARCANEI) > 0)
	{
		Npc_RemoveInvItems(Trader,ELEMENTARE_ARCANEI,Npc_HasItems(Trader,ELEMENTARE_ARCANEI));};
	if(Npc_HasItems(Trader,ItWr_MonasterySecret) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_MonasterySecret,Npc_HasItems(Trader,ItWr_MonasterySecret));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK1,Npc_HasItems(Trader,ITWR_OLDBOOK1));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK2,Npc_HasItems(Trader,ITWR_OLDBOOK2));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK3,Npc_HasItems(Trader,ITWR_OLDBOOK3));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK4,Npc_HasItems(Trader,ITWR_OLDBOOK4));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK5,Npc_HasItems(Trader,ITWR_OLDBOOK5));};
	if(Npc_HasItems(Trader,ItWr_Astronomy_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Astronomy_Mis,Npc_HasItems(Trader,ItWr_Astronomy_Mis));};
	if(Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VinosKellergeister_Mis,Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis));};
	if(Npc_HasItems(Trader,ITWR_DEATH1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH1,Npc_HasItems(Trader,ITWR_DEATH1));};
	if(Npc_HasItems(Trader,ITWR_DEATH2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH2,Npc_HasItems(Trader,ITWR_DEATH2));};
	if(Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HallsofIrdorath_Open_Mis,Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis));};
	if(Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasSeamapBook_Mis,Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis));};
	if(Npc_HasItems(Trader,ItWr_Alchemy_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Alchemy_01,Npc_HasItems(Trader,ItWr_Alchemy_01));
	};
	if(Npc_HasItems(Trader,ItWr_Druid_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Druid_01,Npc_HasItems(Trader,ItWr_Druid_01));
	};
	if(Npc_HasItems(Trader,REZEPTUREN2) > 0)
	{
		Npc_RemoveInvItems(Trader,REZEPTUREN2,Npc_HasItems(Trader,REZEPTUREN2));
	};
	if(Npc_HasItems(Trader,REZEPTUREN) > 0)
	{
		Npc_RemoveInvItems(Trader,REZEPTUREN,Npc_HasItems(Trader,REZEPTUREN));
	};
	if(Trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(Trader);
	};

	Trader.aivar[AIV_ChapterInv] = Kapitel - 1;
};


func void B_ClearWeapons(var C_Npc Trader)
{
	if(Npc_HasItems(Trader,ITMW_2H_ORCPRESTIGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCPRESTIGE,Npc_HasItems(Trader,ITMW_2H_ORCPRESTIGE));
	};
	if(Npc_HasItems(Trader,ITMW_ADANOSMOLOT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ADANOSMOLOT,Npc_HasItems(Trader,ITMW_ADANOSMOLOT));
	};
	if(Npc_HasItems(Trader,ITMI_TARACOTHAMMER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TARACOTHAMMER,Npc_HasItems(Trader,ITMI_TARACOTHAMMER));
	};
	if(Npc_HasItems(Trader,ItMw_1h_TributeDagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_TributeDagger,Npc_HasItems(Trader,ItMw_1h_TributeDagger));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MOONBLADE_LEFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MOONBLADE_LEFT,Npc_HasItems(Trader,ITMW_1H_MOONBLADE_LEFT));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MOONBLADE_RIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MOONBLADE_RIGHT,Npc_HasItems(Trader,ITMW_1H_MOONBLADE_RIGHT));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Left) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Npc_Left,Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Left));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Left) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Left,Npc_HasItems(Trader,ItMw_1H_AssBlade_Left));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Right) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Npc_Right,Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Right));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Right) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Right,Npc_HasItems(Trader,ItMw_1H_AssBlade_Right));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert5,Npc_HasItems(Trader,ItMw_Schwert5));
	};
	if(Npc_HasItems(Trader,ItMw_HartSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_HartSword,Npc_HasItems(Trader,ItMw_HartSword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender3,Npc_HasItems(Trader,ItMw_Zweihaender3));
	};
	if(Npc_HasItems(Trader,ItMw_Meisterdegen) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Meisterdegen,Npc_HasItems(Trader,ItMw_Meisterdegen));
	};
	if(Npc_HasItems(Trader,ItMw_Krummschwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Krummschwert,Npc_HasItems(Trader,ItMw_Krummschwert));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_Betty) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_Betty,Npc_HasItems(Trader,ItMw_Addon_Betty));
	};
	if(Npc_HasItems(Trader,ITMW_DIEGO_DEGEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_DIEGO_DEGEN,Npc_HasItems(Trader,ITMW_DIEGO_DEGEN));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoldBrand_Greg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoldBrand_Greg,Npc_HasItems(Trader,ItMw_1H_GoldBrand_Greg));
	};
	if(Npc_HasItems(Trader,ITMW_GORN_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_GORN_AXT,Npc_HasItems(Trader,ITMW_GORN_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_LEE_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LEE_AXT,Npc_HasItems(Trader,ITMW_LEE_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_KORD_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_KORD_AXT,Npc_HasItems(Trader,ITMW_KORD_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_LARES_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LARES_AXT,Npc_HasItems(Trader,ITMW_LARES_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_TORLOF_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TORLOF_AXT,Npc_HasItems(Trader,ITMW_TORLOF_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_SENTENCA_SWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SENTENCA_SWORD,Npc_HasItems(Trader,ITMW_SENTENCA_SWORD));
	};
	if(Npc_HasItems(Trader,ITMW_JARVIS_WAFFER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_JARVIS_WAFFER,Npc_HasItems(Trader,ITMW_JARVIS_WAFFER));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_Venzel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_Venzel,Npc_HasItems(Trader,ItMw_1H_Blessed_Venzel));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH,Npc_HasItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH));
	};
	if(Npc_HasItems(Trader,ITMW_WOLF_WAFFER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_WOLF_WAFFER,Npc_HasItems(Trader,ITMW_WOLF_WAFFER));
	};
	if(Npc_HasItems(Trader,ITMW_LESTER_SWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LESTER_SWORD,Npc_HasItems(Trader,ITMW_LESTER_SWORD));
	};
	if(Npc_HasItems(Trader,ITMW_KURGANSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_KURGANSWORD,Npc_HasItems(Trader,ITMW_KURGANSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASTER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASTER_01,Npc_HasItems(Trader,ITMW_2H_MASTER_01));
	};
	if(Npc_HasItems(Trader,ITMW_SCORPIONSPEC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SCORPIONSPEC,Npc_HasItems(Trader,ITMW_SCORPIONSPEC));
	};
	if(Npc_HasItems(Trader,ITMW_ABIGEILSPAGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ABIGEILSPAGE,Npc_HasItems(Trader,ITMW_ABIGEILSPAGE));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_GESTATH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_GESTATH,Npc_HasItems(Trader,ITMW_2H_AXE_GESTATH));
	};
	if(Npc_HasItems(Trader,ANGAR_SCHWERT) > 0)
	{
		Npc_RemoveInvItems(Trader,ANGAR_SCHWERT,Npc_HasItems(Trader,ANGAR_SCHWERT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_TIAMANT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_TIAMANT,Npc_HasItems(Trader,ITMW_2H_MASIAF_TIAMANT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_HANIAR,Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon,Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_OSAIR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_OSAIR,Npc_HasItems(Trader,ITMW_2H_MASIAF_OSAIR));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_NROZAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_NROZAS,Npc_HasItems(Trader,ITMW_2H_MASIAF_NROZAS));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_01,Npc_HasItems(Trader,ItMw_2H_OrcAxe_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_02,Npc_HasItems(Trader,ItMw_2H_OrcAxe_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_03,Npc_HasItems(Trader,ItMw_2H_OrcAxe_03));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_04,Npc_HasItems(Trader,ItMw_2H_OrcAxe_04));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcSword_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcSword_01,Npc_HasItems(Trader,ItMw_2H_OrcSword_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcSword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcSword_02,Npc_HasItems(Trader,ItMw_2H_OrcSword_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_03,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_03));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_04,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_04));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_05,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_05));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCMACE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCMACE_01,Npc_HasItems(Trader,ITMW_2H_ORCMACE_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCMACE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCMACE_02,Npc_HasItems(Trader,ITMW_2H_ORCMACE_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRACONSWORD_01,Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF,Npc_HasItems(Trader,ITMW_ORCSTAFF));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF_ELITE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF_ELITE,Npc_HasItems(Trader,ITMW_ORCSTAFF_ELITE));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF_UNDEAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF_UNDEAD,Npc_HasItems(Trader,ITMW_ORCSTAFF_UNDEAD));
	};
	if(Npc_HasItems(Trader,ITMW_ADDON_KEULE_1H_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ADDON_KEULE_1H_03,Npc_HasItems(Trader,ITMW_ADDON_KEULE_1H_03));
	};
	if(Npc_HasItems(Trader,ItMw_2h_OrcStab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_OrcStab,Npc_HasItems(Trader,ItMw_2h_OrcStab));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSTAFF_01,Npc_HasItems(Trader,ITMW_2H_ORCSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01,Npc_HasItems(Trader,ItAr_Shield_01));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01_Alrik) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01_Alrik,Npc_HasItems(Trader,ItAr_Shield_01_Alrik));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_02,Npc_HasItems(Trader,ItAr_Shield_02));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_03,Npc_HasItems(Trader,ItAr_Shield_03));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_04,Npc_HasItems(Trader,ItAr_Shield_04));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_05,Npc_HasItems(Trader,ItAr_Shield_05));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_06,Npc_HasItems(Trader,ItAr_Shield_06));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_Caracust) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_Caracust,Npc_HasItems(Trader,ItAr_Shield_Caracust));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_07,Npc_HasItems(Trader,ItAr_Shield_07));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_07_Cedrik) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_07_Cedrik,Npc_HasItems(Trader,ItAr_Shield_07_Cedrik));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01_Damn,Npc_HasItems(Trader,ItAr_Shield_01_Damn));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_02_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_02_Damn,Npc_HasItems(Trader,ItAr_Shield_02_Damn));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_03_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_03_Damn,Npc_HasItems(Trader,ItAr_Shield_03_Damn));
	};
	if(Npc_HasItems(Trader,ITMW_MEATKNIFE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_MEATKNIFE,Npc_HasItems(Trader,ITMW_MEATKNIFE));
	};
	if(Npc_HasItems(Trader,ItMi_CutKnife) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CutKnife,Npc_HasItems(Trader,ItMi_CutKnife));
	};
	if(Npc_HasItems(Trader,ITMW_2H_SCYTHE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_SCYTHE,Npc_HasItems(Trader,ITMW_2H_SCYTHE));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_01,Npc_HasItems(Trader,ItMw_1H_Mace_L_01));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Bau_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Bau_Axe,Npc_HasItems(Trader,ItMw_1h_Bau_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Mace,Npc_HasItems(Trader,ItMw_1h_Vlk_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_StoneHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_StoneHammer,Npc_HasItems(Trader,ItMw_StoneHammer));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_04,Npc_HasItems(Trader,ItMw_1H_Mace_L_04));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G3_SMITHHAMMER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G3_SMITHHAMMER_01,Npc_HasItems(Trader,ITMW_1H_G3_SMITHHAMMER_01));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G4_AXESMALL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G4_AXESMALL_01,Npc_HasItems(Trader,ITMW_1H_G4_AXESMALL_01));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Bau_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Bau_Axe,Npc_HasItems(Trader,ItMw_2h_Bau_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Bau_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Bau_Mace,Npc_HasItems(Trader,ItMw_1h_Bau_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_Simple_Spear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Simple_Spear,Npc_HasItems(Trader,ItMw_Simple_Spear));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_03,Npc_HasItems(Trader,ItMw_1H_Mace_L_03));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelknueppel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelknueppel,Npc_HasItems(Trader,ItMw_Nagelknueppel));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Gobbo_Hammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Gobbo_Hammer,Npc_HasItems(Trader,ItMw_1h_Gobbo_Hammer));
	};
	if(Npc_HasItems(Trader,ItMw_OgreHummer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OgreHummer,Npc_HasItems(Trader,ItMw_OgreHummer));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegskeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegskeule,Npc_HasItems(Trader,ItMw_Kriegskeule));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoblinTotem) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoblinTotem,Npc_HasItems(Trader,ItMw_1H_GoblinTotem));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Nov_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Nov_Mace,Npc_HasItems(Trader,ItMw_1h_Nov_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_Richtstab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Richtstab,Npc_HasItems(Trader,ItMw_Richtstab));
	};
	if(Npc_HasItems(Trader,ItMw_Stabkeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Stabkeule,Npc_HasItems(Trader,ItMw_Stabkeule));
	};
	if(Npc_HasItems(Trader,ITMW_BATTLEMAGE_STAB_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_BATTLEMAGE_STAB_02,Npc_HasItems(Trader,ITMW_BATTLEMAGE_STAB_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Keule_1h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Keule_1h_01,Npc_HasItems(Trader,ItMW_Addon_Keule_1h_01));
	};
	if(Npc_HasItems(Trader,ItMw_RangerStaff_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_RangerStaff_Addon,Npc_HasItems(Trader,ItMw_RangerStaff_Addon));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFDRUID_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFDRUID_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFDRUID_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFFIRE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFFIRE_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFFIRE_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFWATER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFWATER_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFWATER_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01,Npc_HasItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab01,Npc_HasItems(Trader,ItMW_Addon_Stab01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab02,Npc_HasItems(Trader,ItMW_Addon_Stab02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab03,Npc_HasItems(Trader,ItMW_Addon_Stab03));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab04,Npc_HasItems(Trader,ItMW_Addon_Stab04));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01,Npc_HasItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab01_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab01_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab01_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab02_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab02_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab02_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab03_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab03_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab03_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab04_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab04_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab04_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Xardas_Stab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Xardas_Stab,Npc_HasItems(Trader,ItMW_Xardas_Stab));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword,Npc_HasItems(Trader,ItMw_1h_MISC_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Sum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Sum,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Sum));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Str) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Str,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Str));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Mst) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Mst,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Mst));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MISC_GSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MISC_GSWORD,Npc_HasItems(Trader,ITMW_1H_MISC_GSWORD));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Misc_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Misc_Axe,Npc_HasItems(Trader,ItMw_1h_Misc_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OldSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OldSword,Npc_HasItems(Trader,ItMw_2H_OldSword));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Sword_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Sword_M_01,Npc_HasItems(Trader,ItMw_2H_Sword_M_01));
	};
	if(Npc_HasItems(Trader,ITMW_SHADOWPRIEST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SHADOWPRIEST,Npc_HasItems(Trader,ITMW_SHADOWPRIEST));
	};
	if(Npc_HasItems(Trader,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(Trader,ITMW_SHADOWPRIEST_Elite));
	};
	if(Npc_HasItems(Trader,ItMw_Doom_OldPiratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Doom_OldPiratensaebel,Npc_HasItems(Trader,ItMw_Doom_OldPiratensaebel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DOOMSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DOOMSWORD,Npc_HasItems(Trader,ITMW_1H_DOOMSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_GHOSTSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_GHOSTSWORD,Npc_HasItems(Trader,ITMW_1H_GHOSTSWORD));
	};
	if(Npc_HasItems(Trader,ItMw_2H_IzgulScy) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_IzgulScy,Npc_HasItems(Trader,ItMw_2H_IzgulScy));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DoomSpeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DoomSpeer,Npc_HasItems(Trader,ITMW_1H_DoomSpeer));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_DEAD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(Trader,ITMW_1H_DOOMSWORD_Elite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_PreElite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD_PreElite,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_PreElite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD_Elite,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_Elite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_RAVENELITE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_RAVENELITE,Npc_HasItems(Trader,ITMW_2H_RAVENELITE));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_DAMN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_DAMN,Npc_HasItems(Trader,ITMW_2H_MASIAF_DAMN));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon,Npc_HasItems(Trader,ItMw_DS_MonWeapon));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_Med) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_Med,Npc_HasItems(Trader,ItMw_DS_MonWeapon_Med));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_Elite,Npc_HasItems(Trader,ItMw_DS_MonWeapon_Elite));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_ExElite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_ExElite,Npc_HasItems(Trader,ItMw_DS_MonWeapon_ExElite));
	};
	if(Npc_HasItems(Trader,ItMi_GongDrum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GongDrum,Npc_HasItems(Trader,ItMi_GongDrum));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Sword,Npc_HasItems(Trader,ItMw_1h_Sld_Sword));
	};
	if(Npc_HasItems(Trader,Bdmn_vob) > 0)
	{
		Npc_RemoveInvItems(Trader,Bdmn_vob,Npc_HasItems(Trader,Bdmn_vob));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Dagger,Npc_HasItems(Trader,ItMw_1h_Vlk_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Sword_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Sword_L_03,Npc_HasItems(Trader,ItMw_1H_Sword_L_03));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Knife01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Knife01,Npc_HasItems(Trader,ItMW_Addon_Knife01));
	};
	if(Npc_HasItems(Trader,ItMW_Rich_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Rich_Sword,Npc_HasItems(Trader,ItMW_Rich_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_FrancisDagger_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_FrancisDagger_Mis,Npc_HasItems(Trader,ItMw_FrancisDagger_Mis));
	};
	if(Npc_HasItems(Trader,ItMw_OldPiratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OldPiratensaebel,Npc_HasItems(Trader,ItMw_OldPiratensaebel));
	};
	if(Npc_HasItems(Trader,ItMw_Piratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Piratensaebel,Npc_HasItems(Trader,ItMw_Piratensaebel));
	};
	if(Npc_HasItems(Trader,ItMw_Sense) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sense,Npc_HasItems(Trader,ItMw_Sense));
	};
	if(Npc_HasItems(Trader,ItMw_BartokSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_BartokSword,Npc_HasItems(Trader,ItMw_BartokSword));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_1h_02,Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_1h_01,Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_2h_02,Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_2h_01,Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_01));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR1hAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR1hAxe,Npc_HasItems(Trader,ItMw_Addon_PIR1hAxe));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR1hSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR1hSword,Npc_HasItems(Trader,ItMw_Addon_PIR1hSword));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR2hAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR2hAxe,Npc_HasItems(Trader,ItMw_Addon_PIR2hAxe));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR2hSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR2hSword,Npc_HasItems(Trader,ItMw_Addon_PIR2hSword));
	};
	if(Npc_HasItems(Trader,ItMw_Schiffsaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schiffsaxt,Npc_HasItems(Trader,ItMw_Schiffsaxt));
	};
	if(Npc_HasItems(Trader,ItMw_OldSpage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OldSpage,Npc_HasItems(Trader,ItMw_OldSpage));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Sword,Npc_HasItems(Trader,ItMw_1h_Vlk_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_BanditTrader,Npc_HasItems(Trader,ItMw_Addon_BanditTrader));
	};
	if(Npc_HasItems(Trader,ItMw_Rapier) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rapier,Npc_HasItems(Trader,ItMw_Rapier));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_01,Npc_HasItems(Trader,ItMw_ChiefRapier_01));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_02,Npc_HasItems(Trader,ItMw_ChiefRapier_02));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_03,Npc_HasItems(Trader,ItMw_ChiefRapier_03));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_04,Npc_HasItems(Trader,ItMw_ChiefRapier_04));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_05,Npc_HasItems(Trader,ItMw_ChiefRapier_05));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_06,Npc_HasItems(Trader,ItMw_ChiefRapier_06));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_Loa,Npc_HasItems(Trader,ItMw_ChiefRapier_Loa));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_07,Npc_HasItems(Trader,ItMw_ChiefRapier_07));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_08) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_08,Npc_HasItems(Trader,ItMw_ChiefRapier_08));
	};
	if(Npc_HasItems(Trader,ItMw_Avabul_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Avabul_Dagger,Npc_HasItems(Trader,ItMw_Avabul_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoldBrand) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoldBrand,Npc_HasItems(Trader,ItMw_1H_GoldBrand));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA,Npc_HasItems(Trader,ITMW_2H_KATANA));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA_GIFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA_GIFT,Npc_HasItems(Trader,ITMW_2H_KATANA_GIFT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA_Gonsales) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA_Gonsales,Npc_HasItems(Trader,ITMW_2H_KATANA_Gonsales));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade,Npc_HasItems(Trader,ItMw_1H_AssBlade));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_View) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_View,Npc_HasItems(Trader,ItMw_1H_AssBlade_View));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Known) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Known,Npc_HasItems(Trader,ItMw_1H_AssBlade_Known));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Hero) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Hero,Npc_HasItems(Trader,ItMw_1H_AssBlade_Hero));
	};
	if(Npc_HasItems(Trader,ITMW_FAKESWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_FAKESWORD_01,Npc_HasItems(Trader,ITMW_FAKESWORD_01));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Axe,Npc_HasItems(Trader,ItMw_1h_Vlk_Axe));
	};
	if(Npc_HasItems(Trader,HEERSCHERSTAB) > 0)
	{
		Npc_RemoveInvItems(Trader,HEERSCHERSTAB,Npc_HasItems(Trader,HEERSCHERSTAB));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword2,Npc_HasItems(Trader,ItMw_ShortSword2));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword3,Npc_HasItems(Trader,ItMw_ShortSword3));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword4,Npc_HasItems(Trader,ItMw_ShortSword4));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword5,Npc_HasItems(Trader,ItMw_ShortSword5));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword1,Npc_HasItems(Trader,ItMw_ShortSword1));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert,Npc_HasItems(Trader,ItMw_Schwert));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Mil_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Mil_Sword,Npc_HasItems(Trader,ItMw_1h_Mil_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Sword_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Sword_New,Npc_HasItems(Trader,ItMw_1h_Sld_Sword_New));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert3,Npc_HasItems(Trader,ItMw_Schwert3));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert2,Npc_HasItems(Trader,ItMw_Schwert2));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Pal_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Pal_Sword,Npc_HasItems(Trader,ItMw_1h_Pal_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender1,Npc_HasItems(Trader,ItMw_Zweihaender1));
	};
	if(Npc_HasItems(Trader,ItMw_Hellebarde) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Hellebarde,Npc_HasItems(Trader,ItMw_Hellebarde));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Sld_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Sld_Sword,Npc_HasItems(Trader,ItMw_2h_Sld_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender2,Npc_HasItems(Trader,ItMw_Zweihaender2));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Pal_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Pal_Sword,Npc_HasItems(Trader,ItMw_2h_Pal_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender4,Npc_HasItems(Trader,ItMw_Zweihaender4));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Claymore) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Claymore,Npc_HasItems(Trader,ItMw_2H_Claymore));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Pal_Sword_Etlu) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Pal_Sword_Etlu,Npc_HasItems(Trader,ItMw_1h_Pal_Sword_Etlu));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Pal_Sword_Etlu) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Pal_Sword_Etlu,Npc_HasItems(Trader,ItMw_2h_Pal_Sword_Etlu));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelkeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelkeule,Npc_HasItems(Trader,ItMw_Nagelkeule));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelkeule2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelkeule2,Npc_HasItems(Trader,ItMw_Nagelkeule2));
	};
	if(Npc_HasItems(Trader,ItMw_Streitkolben) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitkolben,Npc_HasItems(Trader,ItMw_Streitkolben));
	};
	if(Npc_HasItems(Trader,ItMw_Steinbrecher) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Steinbrecher,Npc_HasItems(Trader,ItMw_Steinbrecher));
	};
	if(Npc_HasItems(Trader,ItMw_Spicker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Spicker,Npc_HasItems(Trader,ItMw_Spicker));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegshammer1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegshammer1,Npc_HasItems(Trader,ItMw_Kriegshammer1));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegshammer2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegshammer2,Npc_HasItems(Trader,ItMw_Kriegshammer2));
	};
	if(Npc_HasItems(Trader,ItMw_Morgenstern) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Morgenstern,Npc_HasItems(Trader,ItMw_Morgenstern));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MACE_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MACE_107,Npc_HasItems(Trader,ITMW_1H_MACE_107));
	};
	if(Npc_HasItems(Trader,ItMw_Inquisitor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Inquisitor,Npc_HasItems(Trader,ItMw_Inquisitor));
	};
	if(Npc_HasItems(Trader,ItMw_Rabenschnabel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rabenschnabel,Npc_HasItems(Trader,ItMw_Rabenschnabel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MACE_BANDOS_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MACE_BANDOS_107,Npc_HasItems(Trader,ITMW_1H_MACE_BANDOS_107));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Warhammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Warhammer,Npc_HasItems(Trader,ItMw_2H_Warhammer));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MACE_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MACE_107,Npc_HasItems(Trader,ITMW_2H_MACE_107));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Volebir) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Volebir,Npc_HasItems(Trader,ItMw_2H_Volebir));
	};
	if(Npc_HasItems(Trader,ItMw_2H_IceHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_IceHammer,Npc_HasItems(Trader,ItMw_2H_IceHammer));
	};
	if(Npc_HasItems(Trader,ItMw_2H_NordmarWarHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_NordmarWarHammer,Npc_HasItems(Trader,ItMw_2H_NordmarWarHammer));
	};
	if(Npc_HasItems(Trader,ItMw_1H_MolagBarMace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_MolagBarMace,Npc_HasItems(Trader,ItMw_1H_MolagBarMace));
	};
	if(Npc_HasItems(Trader,ItMw_2H_SharpTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_SharpTeeth,Npc_HasItems(Trader,ItMw_2H_SharpTeeth));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Axe,Npc_HasItems(Trader,ItMw_1h_Sld_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_Bartaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Bartaxt,Npc_HasItems(Trader,ItMw_Bartaxt));
	};
	if(Npc_HasItems(Trader,ItMw_Doppelaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Doppelaxt,Npc_HasItems(Trader,ItMw_Doppelaxt));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Sld_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Sld_Axe,Npc_HasItems(Trader,ItMw_2h_Sld_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt1,Npc_HasItems(Trader,ItMw_Streitaxt1));
	};
	if(Npc_HasItems(Trader,ItMw_Folteraxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Folteraxt,Npc_HasItems(Trader,ItMw_Folteraxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_BERSERK_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_BERSERK_107,Npc_HasItems(Trader,ITMW_2H_AXE_BERSERK_107));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3A_ORCAXE_02,Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_02));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt2,Npc_HasItems(Trader,ItMw_Streitaxt2));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt3,Npc_HasItems(Trader,ItMw_Streitaxt3));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Common_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Common_01,Npc_HasItems(Trader,ItMw_1H_Common_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Common_01_Blade) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Common_01_Blade,Npc_HasItems(Trader,ItMw_1H_Common_01_Blade));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert1,Npc_HasItems(Trader,ItMw_Schwert1));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert4,Npc_HasItems(Trader,ItMw_Schwert4));
	};
	if(Npc_HasItems(Trader,ItMw_Rubinklinge) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rubinklinge,Npc_HasItems(Trader,ItMw_Rubinklinge));
	};
	if(Npc_HasItems(Trader,ItMw_ElBastardo) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ElBastardo,Npc_HasItems(Trader,ItMw_ElBastardo));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_01,Npc_HasItems(Trader,ItMw_1H_Special_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_02,Npc_HasItems(Trader,ItMw_1H_Special_02));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_03,Npc_HasItems(Trader,ItMw_1H_Special_03));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_04,Npc_HasItems(Trader,ItMw_1H_Special_04));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_01,Npc_HasItems(Trader,ItMw_2H_Special_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_02,Npc_HasItems(Trader,ItMw_2H_Special_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_03,Npc_HasItems(Trader,ItMw_2H_Special_03));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_04,Npc_HasItems(Trader,ItMw_2H_Special_04));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_01,Npc_HasItems(Trader,ItMw_1H_Blessed_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_02,Npc_HasItems(Trader,ItMw_1H_Blessed_02));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_03,Npc_HasItems(Trader,ItMw_1H_Blessed_03));
	};
	if(Npc_HasItems(Trader,ItMw_Axe_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Axe_Blood,Npc_HasItems(Trader,ItMw_Axe_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Sword_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sword_Blood,Npc_HasItems(Trader,ItMw_Sword_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_Blood,Npc_HasItems(Trader,ItMw_Speer_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_01,Npc_HasItems(Trader,ItMw_Halleberde_01));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_02,Npc_HasItems(Trader,ItMw_Halleberde_02));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_03,Npc_HasItems(Trader,ItMw_Halleberde_03));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_04,Npc_HasItems(Trader,ItMw_Halleberde_04));
	};
	if(Npc_HasItems(Trader,ItMw_Staff_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Staff_Blood,Npc_HasItems(Trader,ItMw_Staff_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_01,Npc_HasItems(Trader,ItMw_2H_Blessed_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_02,Npc_HasItems(Trader,ItMw_2H_Blessed_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_03,Npc_HasItems(Trader,ItMw_2H_Blessed_03));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SIMPLEBLACK,Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SIMPLEBLACK_DEX,Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK_DEX));
	};
	if(Npc_HasItems(Trader,ITMW_2H_SIMPLEBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_SIMPLEBLACK,Npc_HasItems(Trader,ITMW_2H_SIMPLEBLACK));
	};
	if(Npc_HasItems(Trader,ItMw_Drakesaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drakesaebel,Npc_HasItems(Trader,ItMw_Drakesaebel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_KMR_GREATLONG_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_KMR_GREATLONG_01,Npc_HasItems(Trader,ITMW_1H_KMR_GREATLONG_01));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SWORD_LONG_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SWORD_LONG_05,Npc_HasItems(Trader,ITMW_1H_SWORD_LONG_05));
	};
	if(Npc_HasItems(Trader,ItMw_Runenschwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Runenschwert,Npc_HasItems(Trader,ItMw_Runenschwert));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01,Npc_HasItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01));
	};
	if(Npc_HasItems(Trader,ItMw_Sturmbringer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sturmbringer,Npc_HasItems(Trader,ItMw_Sturmbringer));
	};
	if(Npc_HasItems(Trader,ITMW_1H_CREST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_CREST,Npc_HasItems(Trader,ITMW_1H_CREST));
	};
	if(Npc_HasItems(Trader,ItMw_Orkschlaechter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Orkschlaechter,Npc_HasItems(Trader,ItMw_Orkschlaechter));
	};
	if(Npc_HasItems(Trader,ITMW_FEARUND) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_FEARUND,Npc_HasItems(Trader,ITMW_FEARUND));
	};
	if(Npc_HasItems(Trader,ItMw_Drachen_Sword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drachen_Sword_02,Npc_HasItems(Trader,ItMw_Drachen_Sword_02));
	};
	if(Npc_HasItems(Trader,ITMW_1H_KMR_SNAKESWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_KMR_SNAKESWORD_01,Npc_HasItems(Trader,ITMW_1H_KMR_SNAKESWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_NORMARDSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_NORMARDSWORD,Npc_HasItems(Trader,ITMW_NORMARDSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLACKSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLACKSWORD,Npc_HasItems(Trader,ITMW_1H_BLACKSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01,Npc_HasItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GinnokSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GinnokSword,Npc_HasItems(Trader,ItMw_1H_GinnokSword));
	};
	if(Npc_HasItems(Trader,ITMW_1H_XARADRIM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_XARADRIM,Npc_HasItems(Trader,ITMW_1H_XARADRIM));
	};
	if(Npc_HasItems(Trader,ITMW_1H_LostSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_LostSoul,Npc_HasItems(Trader,ITMW_1H_LostSoul));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DEATHBRINGER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DEATHBRINGER,Npc_HasItems(Trader,ITMW_1H_DEATHBRINGER));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC,Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX,Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_KOLUN_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_KOLUN_107,Npc_HasItems(Trader,ITMW_2H_AXE_KOLUN_107));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3A_ORCAXE_03,Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_03));
	};
	if(Npc_HasItems(Trader,ItMw_Schlachtaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schlachtaxt,Npc_HasItems(Trader,ItMw_Schlachtaxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_AXE_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_AXE_H_02,Npc_HasItems(Trader,ITMW_2H_KMR_AXE_H_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_SOULSWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_SOULSWORD_01,Npc_HasItems(Trader,ITMW_2H_KMR_SOULSWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01,Npc_HasItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01));
	};
	if(Npc_HasItems(Trader,Orc_Blade) > 0)
	{
		Npc_RemoveInvItems(Trader,Orc_Blade,Npc_HasItems(Trader,Orc_Blade));
	};
	if(Npc_HasItems(Trader,ItMw_Drachenschneide) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drachenschneide,Npc_HasItems(Trader,ItMw_Drachenschneide));
	};
	if(Npc_HasItems(Trader,ItMw_RuneAxeAncient) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_RuneAxeAncient,Npc_HasItems(Trader,ItMw_RuneAxeAncient));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_RHOBAR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_RHOBAR_01,Npc_HasItems(Trader,ITMW_2H_KMR_RHOBAR_01));
	};
	if(Npc_HasItems(Trader,ItMw_DemonHand) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DemonHand,Npc_HasItems(Trader,ItMw_DemonHand));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_GREATORCAXE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_GREATORCAXE_01,Npc_HasItems(Trader,ITMW_2H_KMR_GREATORCAXE_01));
	};
	if(Npc_HasItems(Trader,ItMw_DragonBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DragonBone,Npc_HasItems(Trader,ItMw_DragonBone));
	};
	if(Npc_HasItems(Trader,ITMW_2H_URIZEL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_URIZEL,Npc_HasItems(Trader,ITMW_2H_URIZEL));
	};
	if(Npc_HasItems(Trader,ITMW_2H_URIZEL_NOMAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_URIZEL_NOMAGIC,Npc_HasItems(Trader,ITMW_2H_URIZEL_NOMAGIC));
	};
	if(Npc_HasItems(Trader,ITMW_2H_XARADRIM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_XARADRIM,Npc_HasItems(Trader,ITMW_2H_XARADRIM));
	};
	if(Npc_HasItems(Trader,ItMw_2H_DarkSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_DarkSoul,Npc_HasItems(Trader,ItMw_2H_DarkSoul));
	};
	if(Npc_HasItems(Trader,ItMw_Berserkeraxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Berserkeraxt,Npc_HasItems(Trader,ItMw_Berserkeraxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRAGONMASTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRAGONMASTER,Npc_HasItems(Trader,ITMW_2H_DRAGONMASTER));
	};
	if(Npc_HasItems(Trader,ITMW_2H_WELTENSPALTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_WELTENSPALTER,Npc_HasItems(Trader,ITMW_2H_WELTENSPALTER));
	};
	if(Npc_HasItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC,Npc_HasItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanAxe_01,Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanSword_01,Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanGreatAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanGreatAxe,Npc_HasItems(Trader,ItMw_2H_OrcHumanGreatAxe));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanAxe_02,Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanSword_02,Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanDoppelAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanDoppelAxe,Npc_HasItems(Trader,ItMw_2H_OrcHumanDoppelAxe));
	};
	if(Npc_HasItems(Trader,ITMW_2H_OrcHumanClaymore) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_OrcHumanClaymore,Npc_HasItems(Trader,ITMW_2H_OrcHumanClaymore));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER5,Npc_HasItems(Trader,ITMW_ZWEIHAENDER5));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER6) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER6,Npc_HasItems(Trader,ITMW_ZWEIHAENDER6));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5));
	};
	if(Npc_HasItems(Trader,ItMw_Iron_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Iron_Dagger,Npc_HasItems(Trader,ItMw_Iron_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_Steel_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Steel_Dagger,Npc_HasItems(Trader,ItMw_Steel_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_Speer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer,Npc_HasItems(Trader,ItMw_Speer));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_01,Npc_HasItems(Trader,ItMw_Speer_01));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_02,Npc_HasItems(Trader,ItMw_Speer_02));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_03,Npc_HasItems(Trader,ItMw_Speer_03));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_04,Npc_HasItems(Trader,ItMw_Speer_04));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_05,Npc_HasItems(Trader,ItMw_Speer_05));
	};
	if(Npc_HasItems(Trader,ItMw_SwordSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_SwordSpear,Npc_HasItems(Trader,ItMw_SwordSpear));
	};
	if(Npc_HasItems(Trader,ItMw_HeavySwordSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_HeavySwordSpear,Npc_HasItems(Trader,ItMw_HeavySwordSpear));
	};
	if(Npc_HasItems(Trader,ItMw_ButcherSpeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ButcherSpeer,Npc_HasItems(Trader,ItMw_ButcherSpeer));
	};
	if(Npc_HasItems(Trader,ItMw_DemonSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DemonSpear,Npc_HasItems(Trader,ItMw_DemonSpear));
	};
	if(Npc_HasItems(Trader,ITMW_1H_WOLF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_WOLF,Npc_HasItems(Trader,ITMW_1H_WOLF));
	};
	if(Npc_HasItems(Trader,ItMi_ArrowTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ArrowTip,Npc_HasItems(Trader,ItMi_ArrowTip));
	};
	if(Npc_HasItems(Trader,ItMi_KerArrowTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerArrowTip,Npc_HasItems(Trader,ItMi_KerArrowTip));
	};
	if(Npc_HasItems(Trader,ItMi_BoltTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BoltTip,Npc_HasItems(Trader,ItMi_BoltTip));
	};
	if(Npc_HasItems(Trader,ItMi_ArrowShaft) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ArrowShaft,Npc_HasItems(Trader,ItMi_ArrowShaft));
	};
	if(Npc_HasItems(Trader,ItMi_BoltShaft) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BoltShaft,Npc_HasItems(Trader,ItMi_BoltShaft));
	};
	if(Npc_HasItems(Trader,ItRw_Arrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Arrow,Npc_HasItems(Trader,ItRw_Arrow));
	};
	if(Npc_HasItems(Trader,ItRw_PoisonArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_PoisonArrow,Npc_HasItems(Trader,ItRw_PoisonArrow));
	};
	if(Npc_HasItems(Trader,ItRw_HolyArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_HolyArrow,Npc_HasItems(Trader,ItRw_HolyArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_MagicArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_MagicArrow,Npc_HasItems(Trader,ItRw_Addon_MagicArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_FireArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_FireArrow,Npc_HasItems(Trader,ItRw_Addon_FireArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Bolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bolt,Npc_HasItems(Trader,ItRw_Bolt));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_MagicBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_MagicBolt,Npc_HasItems(Trader,ItRw_Addon_MagicBolt));
	};
	if(Npc_HasItems(Trader,ItRw_HolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_HolyBolt,Npc_HasItems(Trader,ItRw_HolyBolt));
	};
	if(Npc_HasItems(Trader,ITRW_ZUNTARROW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ZUNTARROW,Npc_HasItems(Trader,ITRW_ZUNTARROW));
	};
	if(Npc_HasItems(Trader,ITRW_MYHUNTARROW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_MYHUNTARROW,Npc_HasItems(Trader,ITRW_MYHUNTARROW));
	};
	if(Npc_HasItems(Trader,ItRw_Ass_2x2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Ass_2x2,Npc_HasItems(Trader,ItRw_Ass_2x2));
	};
	if(Npc_HasItems(Trader,ITRW_ADDON_MAGICBOLT_SHV) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ADDON_MAGICBOLT_SHV,Npc_HasItems(Trader,ITRW_ADDON_MAGICBOLT_SHV));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_01,Npc_HasItems(Trader,ItRw_Bow_L_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_02,Npc_HasItems(Trader,ItRw_Bow_L_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_03,Npc_HasItems(Trader,ItRw_Bow_L_03));
	};
	if(Npc_HasItems(Trader,ITRW_BOSPBOW_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOSPBOW_L_03,Npc_HasItems(Trader,ITRW_BOSPBOW_L_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_04,Npc_HasItems(Trader,ItRw_Bow_L_04));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_01,Npc_HasItems(Trader,ItRw_Bow_M_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_02,Npc_HasItems(Trader,ItRw_Bow_M_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_03,Npc_HasItems(Trader,ItRw_Bow_M_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_04,Npc_HasItems(Trader,ItRw_Bow_M_04));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_01,Npc_HasItems(Trader,ItRw_BowCraft_01));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_02,Npc_HasItems(Trader,ItRw_BowCraft_02));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_03,Npc_HasItems(Trader,ItRw_BowCraft_03));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_04,Npc_HasItems(Trader,ItRw_BowCraft_04));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_05,Npc_HasItems(Trader,ItRw_BowCraft_05));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_01,Npc_HasItems(Trader,ItRw_Bow_H_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_02,Npc_HasItems(Trader,ItRw_Bow_H_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_03,Npc_HasItems(Trader,ItRw_Bow_H_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_04,Npc_HasItems(Trader,ItRw_Bow_H_04));
	};
	if(Npc_HasItems(Trader,ITRW_WHITEBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_WHITEBOW,Npc_HasItems(Trader,ITRW_WHITEBOW));
	};
	if(Npc_HasItems(Trader,ItRw_Sld_Bow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Sld_Bow,Npc_HasItems(Trader,ItRw_Sld_Bow));
	};
	if(Npc_HasItems(Trader,ITRW_DIEGO_BOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_DIEGO_BOW,Npc_HasItems(Trader,ITRW_DIEGO_BOW));
	};
	if(Npc_HasItems(Trader,ItRw_Arabic_Bow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Arabic_Bow,Npc_HasItems(Trader,ItRw_Arabic_Bow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_Light,Npc_HasItems(Trader,ItRw_Crossbow_Light));
	};
	if(Npc_HasItems(Trader,ItRw_Mil_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Mil_Crossbow,Npc_HasItems(Trader,ItRw_Mil_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_BDT_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BDT_Crossbow,Npc_HasItems(Trader,ItRw_BDT_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_L_01,Npc_HasItems(Trader,ItRw_Crossbow_L_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_L_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_L_02,Npc_HasItems(Trader,ItRw_Crossbow_L_02));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_M_01,Npc_HasItems(Trader,ItRw_Crossbow_M_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_M_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_M_02,Npc_HasItems(Trader,ItRw_Crossbow_M_02));
	};
	if(Npc_HasItems(Trader,ItRw_PAL_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_PAL_Crossbow,Npc_HasItems(Trader,ItRw_PAL_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_H_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_H_01,Npc_HasItems(Trader,ItRw_Crossbow_H_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_H_02,Npc_HasItems(Trader,ItRw_Crossbow_H_02));
	};
	if(Npc_HasItems(Trader,ITRW_CROSSBOW_ORC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_CROSSBOW_ORC,Npc_HasItems(Trader,ITRW_CROSSBOW_ORC));
	};
	if(Npc_HasItems(Trader,ITRW_CROSSBOW_ORC_LIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_CROSSBOW_ORC_LIGHT,Npc_HasItems(Trader,ITRW_CROSSBOW_ORC_LIGHT));
	};
	if(Npc_HasItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV,Npc_HasItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_01,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_02,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_03,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_04,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_05,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_05));
	};
	if(Npc_HasItems(Trader,ITRW_BOW_DOUBLE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOW_DOUBLE_01,Npc_HasItems(Trader,ITRW_BOW_DOUBLE_01));
	};
	if(Npc_HasItems(Trader,ITRW_G3_LONG_BOW_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_LONG_BOW_02,Npc_HasItems(Trader,ITRW_G3_LONG_BOW_02));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_KADAT_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_KADAT_BOW_01,Npc_HasItems(Trader,ITRW_KMR_KADAT_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_DARKLONG_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_DARKLONG_BOW_01,Npc_HasItems(Trader,ITRW_KMR_DARKLONG_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_SHADOWS_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_SHADOWS_BOW_01,Npc_HasItems(Trader,ITRW_KMR_SHADOWS_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC,Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC));
	};
	if(Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_SILENTDEATH_BOW_01,Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_SHADOWBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_SHADOWBOW,Npc_HasItems(Trader,ITRW_SHADOWBOW));
	};
	if(Npc_HasItems(Trader,ITRW_BOW_BONES) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOW_BONES,Npc_HasItems(Trader,ITRW_BOW_BONES));
	};
	if(Npc_HasItems(Trader,ITRW_G4_OAK_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G4_OAK_BOW_01,Npc_HasItems(Trader,ITRW_G4_OAK_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_HOLYBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_HOLYBOW,Npc_HasItems(Trader,ITRW_HOLYBOW));
	};
	if(Npc_HasItems(Trader,ITRW_G3_DEMON_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_DEMON_BOW_01,Npc_HasItems(Trader,ITRW_G3_DEMON_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_HAOS_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_HAOS_BOW_01,Npc_HasItems(Trader,ITRW_HAOS_BOW_01));
	};
	if(Npc_HasItems(Trader,ItRw_Undead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Undead,Npc_HasItems(Trader,ItRw_Undead));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_Undead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_Undead,Npc_HasItems(Trader,ItRw_Crossbow_Undead));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_01,Npc_HasItems(Trader,ItSl_BackArrowSack_01));
	};	
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_02,Npc_HasItems(Trader,ItSl_BackArrowSack_02));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_04,Npc_HasItems(Trader,ItSl_BackArrowSack_04));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_05,Npc_HasItems(Trader,ItSl_BackArrowSack_05));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_06,Npc_HasItems(Trader,ItSl_BackArrowSack_06));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_07,Npc_HasItems(Trader,ItSl_BackArrowSack_07));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_08) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_08,Npc_HasItems(Trader,ItSl_BackArrowSack_08));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_09) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_09,Npc_HasItems(Trader,ItSl_BackArrowSack_09));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_10,Npc_HasItems(Trader,ItSl_BackArrowSack_10));
	};
	if(Npc_HasItems(Trader,ItSl_BackBoltSack_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackBoltSack_01,Npc_HasItems(Trader,ItSl_BackBoltSack_01));
	};
};

func void B_ClearDeadTrader_Juan(var C_Npc Trader)
{
	if(Npc_HasItems(Trader,ItAt_Addon_BCKopf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Addon_BCKopf,Npc_HasItems(Trader,ItAt_Addon_BCKopf));
	};
	if(Npc_HasItems(Trader,ItAt_Meatbugflesh) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Meatbugflesh,Npc_HasItems(Trader,ItAt_Meatbugflesh));
	};
	if(Npc_HasItems(Trader,ItAt_SheepFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SheepFur,Npc_HasItems(Trader,ItAt_SheepFur));
	};
	if(Npc_HasItems(Trader,ItAt_RabbitFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_RabbitFur,Npc_HasItems(Trader,ItAt_RabbitFur));
	};
	if(Npc_HasItems(Trader,ItAt_WolfFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WolfFur,Npc_HasItems(Trader,ItAt_WolfFur));
	};
	if(Npc_HasItems(Trader,ItAt_IceWolfFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_IceWolfFur,Npc_HasItems(Trader,ItAt_IceWolfFur));
	};
	if(Npc_HasItems(Trader,ItAt_WhitePuma) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WhitePuma,Npc_HasItems(Trader,ItAt_WhitePuma));
	};
	if(Npc_HasItems(Trader,ItAt_WhiteTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WhiteTroll,Npc_HasItems(Trader,ItAt_WhiteTroll));
	};
	if(Npc_HasItems(Trader,ItAt_BugMandibles) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BugMandibles,Npc_HasItems(Trader,ItAt_BugMandibles));
	};
	if(Npc_HasItems(Trader,ItAt_Claw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Claw,Npc_HasItems(Trader,ItAt_Claw));
	};
	if(Npc_HasItems(Trader,ItAt_OreBugClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_OreBugClaw,Npc_HasItems(Trader,ItAt_OreBugClaw));
	};
	if(Npc_HasItems(Trader,ItAt_LurkerClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_LurkerClaw,Npc_HasItems(Trader,ItAt_LurkerClaw));
	};
	if(Npc_HasItems(Trader,ItAt_Teeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Teeth,Npc_HasItems(Trader,ItAt_Teeth));
	};
	if(Npc_HasItems(Trader,ItAt_CrawlerMandibles) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CrawlerMandibles,Npc_HasItems(Trader,ItAt_CrawlerMandibles));
	};
	if(Npc_HasItems(Trader,ItAt_SpiderMandibles) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SpiderMandibles,Npc_HasItems(Trader,ItAt_SpiderMandibles));	
	};
	if(Npc_HasItems(Trader,ItAt_Wing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Wing,Npc_HasItems(Trader,ItAt_Wing));
	};
	if(Npc_HasItems(Trader,ItAt_Sting) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Sting,Npc_HasItems(Trader,ItAt_Sting));
	};
	if(Npc_HasItems(Trader,itat_LurkerSkin) > 0)
	{
		Npc_RemoveInvItems(Trader,itat_LurkerSkin,Npc_HasItems(Trader,itat_LurkerSkin));
	};
	if(Npc_HasItems(Trader,ItAt_WargFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WargFur,Npc_HasItems(Trader,ItAt_WargFur));
	};
	if(Npc_HasItems(Trader,ItAt_OrcDogFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_OrcDogFur,Npc_HasItems(Trader,ItAt_OrcDogFur));
	};
	if(Npc_HasItems(Trader,ItAt_Addon_KeilerFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_Addon_KeilerFur,Npc_HasItems(Trader,ItAt_Addon_KeilerFur));
	};
	if(Npc_HasItems(Trader,ItAt_DrgSnapperHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DrgSnapperHorn,Npc_HasItems(Trader,ItAt_DrgSnapperHorn));
	};
	if(Npc_HasItems(Trader,ItAt_CrawlerPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CrawlerPlate,Npc_HasItems(Trader,ItAt_CrawlerPlate));
	};
	if(Npc_HasItems(Trader,ItAt_ShadowFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ShadowFur,Npc_HasItems(Trader,ItAt_ShadowFur));
	};
	if(Npc_HasItems(Trader,ItAt_SharkSkin) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SharkSkin,Npc_HasItems(Trader,ItAt_SharkSkin));
	};
	if(Npc_HasItems(Trader,ItAt_TrollFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollFur,Npc_HasItems(Trader,ItAt_TrollFur));
	};
	if(Npc_HasItems(Trader,ItAt_TrollBlackFur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollBlackFur,Npc_HasItems(Trader,ItAt_TrollBlackFur));
	};
	if(Npc_HasItems(Trader,ItAt_CaveBlackFurTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CaveBlackFurTroll,Npc_HasItems(Trader,ItAt_CaveBlackFurTroll));
	};
	if(Npc_HasItems(Trader,ItAt_WaranFiretongue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_WaranFiretongue,Npc_HasItems(Trader,ItAt_WaranFiretongue));
	};
	if(Npc_HasItems(Trader,ItAt_TrollPoisonTongue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollPoisonTongue,Npc_HasItems(Trader,ItAt_TrollPoisonTongue));
	};
	if(Npc_HasItems(Trader,ItAt_ShadowHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ShadowHorn,Npc_HasItems(Trader,ItAt_ShadowHorn));
	};
	if(Npc_HasItems(Trader,ItAt_SharkTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SharkTeeth,Npc_HasItems(Trader,ItAt_SharkTeeth));
	};
	if(Npc_HasItems(Trader,ItAt_DesertSharkTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DesertSharkTeeth,Npc_HasItems(Trader,ItAt_DesertSharkTeeth));
	};
	if(Npc_HasItems(Trader,ItAt_TrollTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TrollTooth,Npc_HasItems(Trader,ItAt_TrollTooth));
	};
	if(Npc_HasItems(Trader,ItAt_StoneGolemHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_StoneGolemHeart,Npc_HasItems(Trader,ItAt_StoneGolemHeart));
	};
	if(Npc_HasItems(Trader,ItAt_FireGolemHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_FireGolemHeart,Npc_HasItems(Trader,ItAt_FireGolemHeart));
	};
	if(Npc_HasItems(Trader,ItAt_IceGolemHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_IceGolemHeart,Npc_HasItems(Trader,ItAt_IceGolemHeart));
	};
	if(Npc_HasItems(Trader,ITAT_SWAMPGOLEMHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SWAMPGOLEMHEART,Npc_HasItems(Trader,ITAT_SWAMPGOLEMHEART));
	};
	if(Npc_HasItems(Trader,ItAt_GoblinBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_GoblinBone,Npc_HasItems(Trader,ItAt_GoblinBone));
	};
	if(Npc_HasItems(Trader,ItAt_SkeletonBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SkeletonBone,Npc_HasItems(Trader,ItAt_SkeletonBone));
	};
	if(Npc_HasItems(Trader,ItAt_DragonBlood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonBlood,Npc_HasItems(Trader,ItAt_DragonBlood));
	};
	if(Npc_HasItems(Trader,ItAt_DragonScale) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonScale,Npc_HasItems(Trader,ItAt_DragonScale));
	};
	if(Npc_HasItems(Trader,ITAT_PUMAFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_PUMAFUR,Npc_HasItems(Trader,ITAT_PUMAFUR));
	};
	if(Npc_HasItems(Trader,ITAT_SLOKERSFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SLOKERSFUR,Npc_HasItems(Trader,ITAT_SLOKERSFUR));
	};
	if(Npc_HasItems(Trader,ITAT_CRAWLERQUEEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_CRAWLERQUEEN,Npc_HasItems(Trader,ITAT_CRAWLERQUEEN));
	};
	if(Npc_HasItems(Trader,ItAt_BlackSnapperLiver) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BlackSnapperLiver,Npc_HasItems(Trader,ItAt_BlackSnapperLiver));
	};
	if(Npc_HasItems(Trader,ITAT_MEATBUGFLESH_GEBRATEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_MEATBUGFLESH_GEBRATEN,Npc_HasItems(Trader,ITAT_MEATBUGFLESH_GEBRATEN));
	};
	if(Npc_HasItems(Trader,ITFO_FISH_GEBRATEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_FISH_GEBRATEN,Npc_HasItems(Trader,ITFO_FISH_GEBRATEN));
	};
	if(Npc_HasItems(Trader,ITFO_PILZSUPPE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_PILZSUPPE,Npc_HasItems(Trader,ITFO_PILZSUPPE));
	};
	if(Npc_HasItems(Trader,ITFO_FLEISCHWANZENRAGOUT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_FLEISCHWANZENRAGOUT,Npc_HasItems(Trader,ITFO_FLEISCHWANZENRAGOUT));
	};
	if(Npc_HasItems(Trader,ITAT_SHEEPGRIMGASH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SHEEPGRIMGASH,Npc_HasItems(Trader,ITAT_SHEEPGRIMGASH));
	};
	if(Npc_HasItems(Trader,ItAt_OlderHead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_OlderHead,Npc_HasItems(Trader,ItAt_OlderHead));
	};
	if(Npc_HasItems(Trader,ITAT_SKELETONBONEALEF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_SKELETONBONEALEF,Npc_HasItems(Trader,ITAT_SKELETONBONEALEF));
	};
	if(Npc_HasItems(Trader,ItAt_DemonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DemonHeart,Npc_HasItems(Trader,ItAt_DemonHeart));
	};
	if(Npc_HasItems(Trader,ITAT_LUZIANHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_LUZIANHEART,Npc_HasItems(Trader,ITAT_LUZIANHEART));
	};
	if(Npc_HasItems(Trader,ItAt_UndeadDragonSoulStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_UndeadDragonSoulStone,Npc_HasItems(Trader,ItAt_UndeadDragonSoulStone));
	};
	if(Npc_HasItems(Trader,ItAt_IcedragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_IcedragonHeart,Npc_HasItems(Trader,ItAt_IcedragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_RockdragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_RockdragonHeart,Npc_HasItems(Trader,ItAt_RockdragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_SwampdragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SwampdragonHeart,Npc_HasItems(Trader,ItAt_SwampdragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_FiredragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_FiredragonHeart,Npc_HasItems(Trader,ItAt_FiredragonHeart));
	};
	if(Npc_HasItems(Trader,ItAt_DragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonHeart,Npc_HasItems(Trader,ItAt_DragonHeart));
	};
	if(Npc_HasItems(Trader,ITAT_REDDRAGONHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_REDDRAGONHEART,Npc_HasItems(Trader,ITAT_REDDRAGONHEART));
	};
	if(Npc_HasItems(Trader,ITAT_BLACKDRAGONHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_BLACKDRAGONHEART,Npc_HasItems(Trader,ITAT_BLACKDRAGONHEART));
	};
	if(Npc_HasItems(Trader,ItAt_UzdragonHeart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_UzdragonHeart,Npc_HasItems(Trader,ItAt_UzdragonHeart));
	};
	if(Npc_HasItems(Trader,ITAT_GOLDDRAGONHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_GOLDDRAGONHEART,Npc_HasItems(Trader,ITAT_GOLDDRAGONHEART));
	};
	if(Npc_HasItems(Trader,ItAt_SpiderEgg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SpiderEgg,Npc_HasItems(Trader,ItAt_SpiderEgg));
	};
	if(Npc_HasItems(Trader,ItAt_XtoneClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_XtoneClaw,Npc_HasItems(Trader,ItAt_XtoneClaw));
	};
	if(Npc_HasItems(Trader,ItUt_StoneClaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_StoneClaw,Npc_HasItems(Trader,ItUt_StoneClaw));
	};
	if(Npc_HasItems(Trader,ItAt_DlackTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DlackTeeth,Npc_HasItems(Trader,ItAt_DlackTeeth));
	};
	if(Npc_HasItems(Trader,ItUt_BlackTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_BlackTeeth,Npc_HasItems(Trader,ItUt_BlackTeeth));
	};
	if(Npc_HasItems(Trader,ItAt_CurratIshi) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_CurratIshi,Npc_HasItems(Trader,ItAt_CurratIshi));
	};
	if(Npc_HasItems(Trader,ItUt_IshiCurrat) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_IshiCurrat,Npc_HasItems(Trader,ItUt_IshiCurrat));
	};
	if(Npc_HasItems(Trader,ItAt_GturTrollHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_GturTrollHorn,Npc_HasItems(Trader,ItAt_GturTrollHorn));
	};
	if(Npc_HasItems(Trader,ItUt_UturTrollHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_UturTrollHorn,Npc_HasItems(Trader,ItUt_UturTrollHorn));
	};
	if(Npc_HasItems(Trader,ItAt_ZaracustPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ZaracustPlate,Npc_HasItems(Trader,ItAt_ZaracustPlate));
	};
	if(Npc_HasItems(Trader,ItUt_CaracustPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_CaracustPlate,Npc_HasItems(Trader,ItUt_CaracustPlate));
	};
	if(Npc_HasItems(Trader,ItAt_BuritanTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BuritanTooth,Npc_HasItems(Trader,ItAt_BuritanTooth));
	};
	if(Npc_HasItems(Trader,ItAt_PW_MuritanTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_PW_MuritanTooth,Npc_HasItems(Trader,ItAt_PW_MuritanTooth));
	};
	if(Npc_HasItems(Trader,ItUt_MuritanTooth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_MuritanTooth,Npc_HasItems(Trader,ItUt_MuritanTooth));
	};
	if(Npc_HasItems(Trader,ITAT_LEADERLURKER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_LEADERLURKER,Npc_HasItems(Trader,ITAT_LEADERLURKER));
	};
	if(Npc_HasItems(Trader,ITUT_LURKERLEADER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITUT_LURKERLEADER,Npc_HasItems(Trader,ITUT_LURKERLEADER));
	};
	if(Npc_HasItems(Trader,ITAT_GARPIISERDCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_GARPIISERDCE,Npc_HasItems(Trader,ITAT_GARPIISERDCE));
	};
	if(Npc_HasItems(Trader,ITUT_SERDCEGARPII) > 0)
	{
		Npc_RemoveInvItems(Trader,ITUT_SERDCEGARPII,Npc_HasItems(Trader,ITUT_SERDCEGARPII));
	};
	if(Npc_HasItems(Trader,ItAt_ZubSkalo) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ZubSkalo,Npc_HasItems(Trader,ItAt_ZubSkalo));
	};
	if(Npc_HasItems(Trader,ItUt_Skalozub) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_Skalozub,Npc_HasItems(Trader,ItUt_Skalozub));
	};
	if(Npc_HasItems(Trader,ITMI_UTONEPUMAPIECE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_UTONEPUMAPIECE,Npc_HasItems(Trader,ITMI_UTONEPUMAPIECE));
	};
	if(Npc_HasItems(Trader,ItUt_STONEPUMAPIECE) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_STONEPUMAPIECE,Npc_HasItems(Trader,ItUt_STONEPUMAPIECE));
	};
	if(Npc_HasItems(Trader,ItAt_XragonSkull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_XragonSkull,Npc_HasItems(Trader,ItAt_XragonSkull));
	};
	if(Npc_HasItems(Trader,ItUt_DragonSkull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_DragonSkull,Npc_HasItems(Trader,ItUt_DragonSkull));
	};
	if(Npc_HasItems(Trader,ItAt_HeadUrTrall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_HeadUrTrall,Npc_HasItems(Trader,ItAt_HeadUrTrall));
	};
	if(Npc_HasItems(Trader,ItUt_UrTrallHead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_UrTrallHead,Npc_HasItems(Trader,ItUt_UrTrallHead));
	};
	if(Npc_HasItems(Trader,ItAt_SkullWhiteTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_SkullWhiteTroll,Npc_HasItems(Trader,ItAt_SkullWhiteTroll));
	};
	if(Npc_HasItems(Trader,ItUt_WhiteTrollSkull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItUt_WhiteTrollSkull,Npc_HasItems(Trader,ItUt_WhiteTrollSkull));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_Leather_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_Leather_01,Npc_HasItems(Trader,ItBE_Addon_Leather_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_MIL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_MIL_01,Npc_HasItems(Trader,ItBE_Addon_MIL_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_MIL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_MIL_02,Npc_HasItems(Trader,ItBE_Addon_MIL_02));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_SLD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SLD_01,Npc_HasItems(Trader,ItBE_Addon_SLD_01));
	}
	if(Npc_HasItems(Trader,ItBE_Addon_SLD_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SLD_02,Npc_HasItems(Trader,ItBE_Addon_SLD_02));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_SLD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SLD_03,Npc_HasItems(Trader,ItBE_Addon_SLD_03));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_MC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_MC,Npc_HasItems(Trader,ItBE_Addon_MC));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_NOV_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_NOV_01,Npc_HasItems(Trader,ItBE_Addon_NOV_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_KDF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_KDF_01,Npc_HasItems(Trader,ItBE_Addon_KDF_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_KDF_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_KDF_02,Npc_HasItems(Trader,ItBE_Addon_KDF_02));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_KDF_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_KDF_03,Npc_HasItems(Trader,ItBE_Addon_KDF_03));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_DJG_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_DJG_01,Npc_HasItems(Trader,ItBE_Addon_DJG_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_SEK_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_SEK_01,Npc_HasItems(Trader,ItBE_Addon_SEK_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_TPL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_TPL_01,Npc_HasItems(Trader,ItBE_Addon_TPL_01));
	};
	if(Npc_HasItems(Trader,ItBE_Addon_GUR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBE_Addon_GUR_01,Npc_HasItems(Trader,ItBE_Addon_GUR_01));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Thief_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Thief_01,Npc_HasItems(Trader,ItBe_Addon_Thief_01));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Thief_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Thief_02,Npc_HasItems(Trader,ItBe_Addon_Thief_02));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Thief_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Thief_03,Npc_HasItems(Trader,ItBe_Addon_Thief_03));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_STR_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_STR_5,Npc_HasItems(Trader,ItBe_Addon_STR_5));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_STR_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_STR_10,Npc_HasItems(Trader,ItBe_Addon_STR_10));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_DEX_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_DEX_5,Npc_HasItems(Trader,ItBe_Addon_DEX_5));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_DEX_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_DEX_10,Npc_HasItems(Trader,ItBe_Addon_DEX_10));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_EDGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_EDGE,Npc_HasItems(Trader,ItBe_Addon_Prot_EDGE));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_Point) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_Point,Npc_HasItems(Trader,ItBe_Addon_Prot_Point));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_MAGIC,Npc_HasItems(Trader,ItBe_Addon_Prot_MAGIC));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_FIRE) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_FIRE,Npc_HasItems(Trader,ItBe_Addon_Prot_FIRE));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_EdgPoi) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_EdgPoi,Npc_HasItems(Trader,ItBe_Addon_Prot_EdgPoi));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Prot_TOTAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Prot_TOTAL,Npc_HasItems(Trader,ItBe_Addon_Prot_TOTAL));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_01,Npc_HasItems(Trader,ItBe_Addon_Custom_01));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_02,Npc_HasItems(Trader,ItBe_Addon_Custom_02));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_03,Npc_HasItems(Trader,ItBe_Addon_Custom_03));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_Custom_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_Custom_04,Npc_HasItems(Trader,ItBe_Addon_Custom_04));
	};
	if(Npc_HasItems(Trader,ItBe_Addon_BT_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_Addon_BT_01,Npc_HasItems(Trader,ItBe_Addon_BT_01));
	};
	if(Npc_HasItems(Trader,ItBe_NordmarBelt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_NordmarBelt,Npc_HasItems(Trader,ItBe_NordmarBelt));
	};
	if(Npc_HasItems(Trader,ItBe_DragonBelt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBe_DragonBelt,Npc_HasItems(Trader,ItBe_DragonBelt));
	};
	if(Npc_HasItems(Trader,Fakescroll) > 0)
	{
		Npc_RemoveInvItems(Trader,Fakescroll,Npc_HasItems(Trader,Fakescroll));
	};
	if(Npc_HasItems(Trader,ITWR_MAGICPAPER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAGICPAPER,Npc_HasItems(Trader,ITWR_MAGICPAPER));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK1,Npc_HasItems(Trader,ITWR_OLDBOOK1));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK2,Npc_HasItems(Trader,ITWR_OLDBOOK2));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK3,Npc_HasItems(Trader,ITWR_OLDBOOK3));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK4,Npc_HasItems(Trader,ITWR_OLDBOOK4));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK5,Npc_HasItems(Trader,ITWR_OLDBOOK5));
	};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK6) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK6,Npc_HasItems(Trader,ITWR_OLDBOOK6));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Shellflesh) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Shellflesh,Npc_HasItems(Trader,ItFo_Addon_Shellflesh));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Rum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Rum,Npc_HasItems(Trader,ItFo_Addon_Rum));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Rum_Skip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Rum_Skip,Npc_HasItems(Trader,ItFo_Addon_Rum_Skip));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_ORCRUM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_ORCRUM,Npc_HasItems(Trader,ITFO_ADDON_ORCRUM));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_ORCRUMSAL,Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSAL));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSALBETA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_ORCRUMSALBETA,Npc_HasItems(Trader,ITFO_ADDON_ORCRUMSALBETA));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_LousHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_LousHammer,Npc_HasItems(Trader,ItFo_Addon_LousHammer));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_SchlafHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_SchlafHammer,Npc_HasItems(Trader,ItFo_Addon_SchlafHammer));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_SchnellerHering) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_SchnellerHering,Npc_HasItems(Trader,ItFo_Addon_SchnellerHering));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_SchnellerHering_Ext) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_SchnellerHering_Ext,Npc_HasItems(Trader,ItFo_Addon_SchnellerHering_Ext));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Pfeffer_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Pfeffer_01,Npc_HasItems(Trader,ItFo_Addon_Pfeffer_01));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_FireStew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_FireStew,Npc_HasItems(Trader,ItFo_Addon_FireStew));
	};
	if(Npc_HasItems(Trader,ItFo_Addon_Meatsoup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Meatsoup,Npc_HasItems(Trader,ItFo_Addon_Meatsoup));
	};
	if(Npc_HasItems(Trader,ITFO_ADDON_SHNAPS_ORKS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_ADDON_SHNAPS_ORKS,Npc_HasItems(Trader,ITFO_ADDON_SHNAPS_ORKS));
	};
	if(Npc_HasItems(Trader,ItFo_Apple) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Apple,Npc_HasItems(Trader,ItFo_Apple));
	};
	if(Npc_HasItems(Trader,ItFo_GoatCheese) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_GoatCheese,Npc_HasItems(Trader,ItFo_GoatCheese));
	};
	if(Npc_HasItems(Trader,ItFo_Cheese) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cheese,Npc_HasItems(Trader,ItFo_Cheese));
	};
	if(Npc_HasItems(Trader,ItFo_Bacon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Bacon,Npc_HasItems(Trader,ItFo_Bacon));
	};
	if(Npc_HasItems(Trader,ItFo_Bread) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Bread,Npc_HasItems(Trader,ItFo_Bread));
	};
	if(Npc_HasItems(Trader,ItFo_Fish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Fish,Npc_HasItems(Trader,ItFo_Fish));
	};
	if(Npc_HasItems(Trader,ITFOSCHILDKROETERAW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFOSCHILDKROETERAW,Npc_HasItems(Trader,ITFOSCHILDKROETERAW));
	};
	if(Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SCHILDKROETESOUP,Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP));
	};
	if(Npc_HasItems(Trader,ItFoMuttonRaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFoMuttonRaw,Npc_HasItems(Trader,ItFoMuttonRaw));
	};
	if(Npc_HasItems(Trader,ItFoMutton) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFoMutton,Npc_HasItems(Trader,ItFoMutton));
	};
	if(Npc_HasItems(Trader,ItMi_BretMeet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BretMeet,Npc_HasItems(Trader,ItMi_BretMeet));
	};
	if(Npc_HasItems(Trader,ITFOMUTTON_NICLAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFOMUTTON_NICLAS,Npc_HasItems(Trader,ITFOMUTTON_NICLAS));
	};
	if(Npc_HasItems(Trader,ItFo_Stew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Stew,Npc_HasItems(Trader,ItFo_Stew));
	};
	if(Npc_HasItems(Trader,ItFo_XPStew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_XPStew,Npc_HasItems(Trader,ItFo_XPStew));
	};
	if(Npc_HasItems(Trader,ITFO_NASHSOUP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_NASHSOUP,Npc_HasItems(Trader,ITFO_NASHSOUP));
	};
	if(Npc_HasItems(Trader,ItFo_CoragonsBeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_CoragonsBeer,Npc_HasItems(Trader,ItFo_CoragonsBeer));
	};
	if(Npc_HasItems(Trader,ItFo_FishSoup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_FishSoup,Npc_HasItems(Trader,ItFo_FishSoup));
	};
	if(Npc_HasItems(Trader,ItFo_Sausage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Sausage,Npc_HasItems(Trader,ItFo_Sausage));
	};
	if(Npc_HasItems(Trader,ItFo_Honey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Honey,Npc_HasItems(Trader,ItFo_Honey));
	};
	if(Npc_HasItems(Trader,ItFo_Water) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Water,Npc_HasItems(Trader,ItFo_Water));
	};
	if(Npc_HasItems(Trader,ItFo_AdanosWater) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_AdanosWater,Npc_HasItems(Trader,ItFo_AdanosWater));
	};
	if(Npc_HasItems(Trader,ItFo_Beer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Beer,Npc_HasItems(Trader,ItFo_Beer));
	};
	if(Npc_HasItems(Trader,ItFo_Booze) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Booze,Npc_HasItems(Trader,ItFo_Booze));
	};
	if(Npc_HasItems(Trader,ITFO_BOOZE_EXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_BOOZE_EXT,Npc_HasItems(Trader,ITFO_BOOZE_EXT));
	};
	if(Npc_HasItems(Trader,ITFO_WINEBERRYS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_WINEBERRYS,Npc_HasItems(Trader,ITFO_WINEBERRYS));
	};
	if(Npc_HasItems(Trader,ItFo_Wine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Wine,Npc_HasItems(Trader,ItFo_Wine));
	};
	if(Npc_HasItems(Trader,ItFo_Wine_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Wine_Loa,Npc_HasItems(Trader,ItFo_Wine_Loa));
	};
	if(Npc_HasItems(Trader,ItFo_Milk) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Milk,Npc_HasItems(Trader,ItFo_Milk));
	};
	if(Npc_HasItems(Trader,ItPo_AssasinsRareWine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_AssasinsRareWine,Npc_HasItems(Trader,ItPo_AssasinsRareWine));
	};
	if(Npc_HasItems(Trader,ItPo_AssasinsRareWine_Use) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_AssasinsRareWine_Use,Npc_HasItems(Trader,ItPo_AssasinsRareWine_Use));
	};
	if(Npc_HasItems(Trader,ITFO_SPECWINE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SPECWINE,Npc_HasItems(Trader,ITFO_SPECWINE));
	};
	if(Npc_HasItems(Trader,ITFO_SPECWINE_HP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SPECWINE_HP,Npc_HasItems(Trader,ITFO_SPECWINE_HP));
	};
	if(Npc_HasItems(Trader,ITFO_EALBALZAM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_EALBALZAM,Npc_HasItems(Trader,ITFO_EALBALZAM));
	};
	if(Npc_HasItems(Trader,ITFO_EALBALZAMTWO) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_EALBALZAMTWO,Npc_HasItems(Trader,ITFO_EALBALZAMTWO));
	};
	if(Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_POTTAGE_MUSHROOM,Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM));
	};
	if(Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM_BLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_POTTAGE_MUSHROOM_BLACK,Npc_HasItems(Trader,ITFO_POTTAGE_MUSHROOM_BLACK));
	};
	if(Npc_HasItems(Trader,ITFO_COMPOTE_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_COMPOTE_00,Npc_HasItems(Trader,ITFO_COMPOTE_00));
	};
	if(Npc_HasItems(Trader,ITFO_COMPOTE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_COMPOTE_01,Npc_HasItems(Trader,ITFO_COMPOTE_01));
	};
	if(Npc_HasItems(Trader,ItFo_RiceStew) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_RiceStew,Npc_HasItems(Trader,ItFo_RiceStew));
	};
	if(Npc_HasItems(Trader,ItFo_Meatbugragout) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Meatbugragout,Npc_HasItems(Trader,ItFo_Meatbugragout));
	};
	if(Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP_SBORKA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITFO_SCHILDKROETESOUP_SBORKA,Npc_HasItems(Trader,ITFO_SCHILDKROETESOUP_SBORKA));
	};
	if(Npc_HasItems(Trader,ItFoMuttonRaw_Mount) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFoMuttonRaw_Mount,Npc_HasItems(Trader,ItFoMuttonRaw_Mount));
	};
	if(Npc_HasItems(Trader,ItFo_BeliarTear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_BeliarTear,Npc_HasItems(Trader,ItFo_BeliarTear));
	};
	if(Npc_HasItems(Trader,ItFo_BeliarTear_Haniar) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_BeliarTear_Haniar,Npc_HasItems(Trader,ItFo_BeliarTear_Haniar));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Apple) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Apple,Npc_HasItems(Trader,ItFo_Cake_Apple));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Meat) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Meat,Npc_HasItems(Trader,ItFo_Cake_Meat));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Mushroom) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Mushroom,Npc_HasItems(Trader,ItFo_Cake_Mushroom));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Fish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Fish,Npc_HasItems(Trader,ItFo_Cake_Fish));
	};
	if(Npc_HasItems(Trader,ItFo_Cake_Honey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Cake_Honey,Npc_HasItems(Trader,ItFo_Cake_Honey));
	};
	if(Npc_HasItems(Trader,ItFo_Alcohol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Alcohol,Npc_HasItems(Trader,ItFo_Alcohol));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCPRESTIGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCPRESTIGE,Npc_HasItems(Trader,ITMW_2H_ORCPRESTIGE));
	};
	if(Npc_HasItems(Trader,ITMW_ADANOSMOLOT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ADANOSMOLOT,Npc_HasItems(Trader,ITMW_ADANOSMOLOT));
	};
	if(Npc_HasItems(Trader,ITMI_TARACOTHAMMER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TARACOTHAMMER,Npc_HasItems(Trader,ITMI_TARACOTHAMMER));
	};
	if(Npc_HasItems(Trader,ItMw_1h_TributeDagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_TributeDagger,Npc_HasItems(Trader,ItMw_1h_TributeDagger));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MOONBLADE_LEFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MOONBLADE_LEFT,Npc_HasItems(Trader,ITMW_1H_MOONBLADE_LEFT));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MOONBLADE_RIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MOONBLADE_RIGHT,Npc_HasItems(Trader,ITMW_1H_MOONBLADE_RIGHT));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Left) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Npc_Left,Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Left));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Left) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Left,Npc_HasItems(Trader,ItMw_1H_AssBlade_Left));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Right) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Npc_Right,Npc_HasItems(Trader,ItMw_1H_AssBlade_Npc_Right));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Right) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Right,Npc_HasItems(Trader,ItMw_1H_AssBlade_Right));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert5,Npc_HasItems(Trader,ItMw_Schwert5));
	};
	if(Npc_HasItems(Trader,ItMw_HartSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_HartSword,Npc_HasItems(Trader,ItMw_HartSword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender3,Npc_HasItems(Trader,ItMw_Zweihaender3));
	};
	if(Npc_HasItems(Trader,ItMw_Meisterdegen) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Meisterdegen,Npc_HasItems(Trader,ItMw_Meisterdegen));
	};
	if(Npc_HasItems(Trader,ItMw_Krummschwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Krummschwert,Npc_HasItems(Trader,ItMw_Krummschwert));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_Betty) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_Betty,Npc_HasItems(Trader,ItMw_Addon_Betty));
	};
	if(Npc_HasItems(Trader,ITMW_DIEGO_DEGEN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_DIEGO_DEGEN,Npc_HasItems(Trader,ITMW_DIEGO_DEGEN));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoldBrand_Greg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoldBrand_Greg,Npc_HasItems(Trader,ItMw_1H_GoldBrand_Greg));
	};
	if(Npc_HasItems(Trader,ITMW_GORN_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_GORN_AXT,Npc_HasItems(Trader,ITMW_GORN_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_LEE_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LEE_AXT,Npc_HasItems(Trader,ITMW_LEE_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_KORD_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_KORD_AXT,Npc_HasItems(Trader,ITMW_KORD_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_LARES_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LARES_AXT,Npc_HasItems(Trader,ITMW_LARES_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_TORLOF_AXT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TORLOF_AXT,Npc_HasItems(Trader,ITMW_TORLOF_AXT));
	};
	if(Npc_HasItems(Trader,ITMW_SENTENCA_SWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SENTENCA_SWORD,Npc_HasItems(Trader,ITMW_SENTENCA_SWORD));
	};
	if(Npc_HasItems(Trader,ITMW_JARVIS_WAFFER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_JARVIS_WAFFER,Npc_HasItems(Trader,ITMW_JARVIS_WAFFER));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_Venzel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_Venzel,Npc_HasItems(Trader,ItMw_1H_Blessed_Venzel));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH,Npc_HasItems(Trader,ITMW_ZWEIHAENDER_GORNAKOSH));
	};
	if(Npc_HasItems(Trader,ITMW_WOLF_WAFFER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_WOLF_WAFFER,Npc_HasItems(Trader,ITMW_WOLF_WAFFER));
	};
	if(Npc_HasItems(Trader,ITMW_LESTER_SWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_LESTER_SWORD,Npc_HasItems(Trader,ITMW_LESTER_SWORD));
	};
	if(Npc_HasItems(Trader,ITMW_KURGANSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_KURGANSWORD,Npc_HasItems(Trader,ITMW_KURGANSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASTER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASTER_01,Npc_HasItems(Trader,ITMW_2H_MASTER_01));
	};
	if(Npc_HasItems(Trader,ITMW_SCORPIONSPEC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SCORPIONSPEC,Npc_HasItems(Trader,ITMW_SCORPIONSPEC));
	};
	if(Npc_HasItems(Trader,ITMW_ABIGEILSPAGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ABIGEILSPAGE,Npc_HasItems(Trader,ITMW_ABIGEILSPAGE));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_GESTATH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_GESTATH,Npc_HasItems(Trader,ITMW_2H_AXE_GESTATH));
	};
	if(Npc_HasItems(Trader,ANGAR_SCHWERT) > 0)
	{
		Npc_RemoveInvItems(Trader,ANGAR_SCHWERT,Npc_HasItems(Trader,ANGAR_SCHWERT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_TIAMANT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_TIAMANT,Npc_HasItems(Trader,ITMW_2H_MASIAF_TIAMANT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_HANIAR,Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon,Npc_HasItems(Trader,ITMW_2H_MASIAF_HANIAR_Demon));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_OSAIR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_OSAIR,Npc_HasItems(Trader,ITMW_2H_MASIAF_OSAIR));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_NROZAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_NROZAS,Npc_HasItems(Trader,ITMW_2H_MASIAF_NROZAS));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_01,Npc_HasItems(Trader,ItMw_2H_OrcAxe_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_02,Npc_HasItems(Trader,ItMw_2H_OrcAxe_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_03,Npc_HasItems(Trader,ItMw_2H_OrcAxe_03));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcAxe_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcAxe_04,Npc_HasItems(Trader,ItMw_2H_OrcAxe_04));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcSword_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcSword_01,Npc_HasItems(Trader,ItMw_2H_OrcSword_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcSword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcSword_02,Npc_HasItems(Trader,ItMw_2H_OrcSword_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_03,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_03));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_04,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_04));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSWORD_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSWORD_05,Npc_HasItems(Trader,ITMW_2H_ORCSWORD_05));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCMACE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCMACE_01,Npc_HasItems(Trader,ITMW_2H_ORCMACE_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCMACE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCMACE_02,Npc_HasItems(Trader,ITMW_2H_ORCMACE_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRACONSWORD_01,Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF,Npc_HasItems(Trader,ITMW_ORCSTAFF));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF_ELITE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF_ELITE,Npc_HasItems(Trader,ITMW_ORCSTAFF_ELITE));
	};
	if(Npc_HasItems(Trader,ITMW_ORCSTAFF_UNDEAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ORCSTAFF_UNDEAD,Npc_HasItems(Trader,ITMW_ORCSTAFF_UNDEAD));
	};
	if(Npc_HasItems(Trader,ITMW_ADDON_KEULE_1H_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ADDON_KEULE_1H_03,Npc_HasItems(Trader,ITMW_ADDON_KEULE_1H_03));
	};
	if(Npc_HasItems(Trader,ItMw_2h_OrcStab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_OrcStab,Npc_HasItems(Trader,ItMw_2h_OrcStab));
	};
	if(Npc_HasItems(Trader,ITMW_2H_ORCSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_ORCSTAFF_01,Npc_HasItems(Trader,ITMW_2H_ORCSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01,Npc_HasItems(Trader,ItAr_Shield_01));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01_Alrik) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01_Alrik,Npc_HasItems(Trader,ItAr_Shield_01_Alrik));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_02,Npc_HasItems(Trader,ItAr_Shield_02));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_03,Npc_HasItems(Trader,ItAr_Shield_03));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_04,Npc_HasItems(Trader,ItAr_Shield_04));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_05,Npc_HasItems(Trader,ItAr_Shield_05));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_06,Npc_HasItems(Trader,ItAr_Shield_06));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_Caracust) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_Caracust,Npc_HasItems(Trader,ItAr_Shield_Caracust));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_07,Npc_HasItems(Trader,ItAr_Shield_07));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_07_Cedrik) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_07_Cedrik,Npc_HasItems(Trader,ItAr_Shield_07_Cedrik));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_01_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_01_Damn,Npc_HasItems(Trader,ItAr_Shield_01_Damn));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_02_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_02_Damn,Npc_HasItems(Trader,ItAr_Shield_02_Damn));
	};
	if(Npc_HasItems(Trader,ItAr_Shield_03_Damn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Shield_03_Damn,Npc_HasItems(Trader,ItAr_Shield_03_Damn));
	};
	if(Npc_HasItems(Trader,ITMW_MEATKNIFE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_MEATKNIFE,Npc_HasItems(Trader,ITMW_MEATKNIFE));
	};
	if(Npc_HasItems(Trader,ItMi_CutKnife) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CutKnife,Npc_HasItems(Trader,ItMi_CutKnife));
	};
	if(Npc_HasItems(Trader,ITMW_2H_SCYTHE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_SCYTHE,Npc_HasItems(Trader,ITMW_2H_SCYTHE));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_01,Npc_HasItems(Trader,ItMw_1H_Mace_L_01));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Bau_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Bau_Axe,Npc_HasItems(Trader,ItMw_1h_Bau_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Mace,Npc_HasItems(Trader,ItMw_1h_Vlk_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_StoneHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_StoneHammer,Npc_HasItems(Trader,ItMw_StoneHammer));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_04,Npc_HasItems(Trader,ItMw_1H_Mace_L_04));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G3_SMITHHAMMER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G3_SMITHHAMMER_01,Npc_HasItems(Trader,ITMW_1H_G3_SMITHHAMMER_01));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G4_AXESMALL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G4_AXESMALL_01,Npc_HasItems(Trader,ITMW_1H_G4_AXESMALL_01));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Bau_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Bau_Axe,Npc_HasItems(Trader,ItMw_2h_Bau_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Bau_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Bau_Mace,Npc_HasItems(Trader,ItMw_1h_Bau_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_Simple_Spear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Simple_Spear,Npc_HasItems(Trader,ItMw_Simple_Spear));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Mace_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Mace_L_03,Npc_HasItems(Trader,ItMw_1H_Mace_L_03));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelknueppel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelknueppel,Npc_HasItems(Trader,ItMw_Nagelknueppel));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Gobbo_Hammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Gobbo_Hammer,Npc_HasItems(Trader,ItMw_1h_Gobbo_Hammer));
	};
	if(Npc_HasItems(Trader,ItMw_OgreHummer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OgreHummer,Npc_HasItems(Trader,ItMw_OgreHummer));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegskeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegskeule,Npc_HasItems(Trader,ItMw_Kriegskeule));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoblinTotem) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoblinTotem,Npc_HasItems(Trader,ItMw_1H_GoblinTotem));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Nov_Mace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Nov_Mace,Npc_HasItems(Trader,ItMw_1h_Nov_Mace));
	};
	if(Npc_HasItems(Trader,ItMw_Richtstab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Richtstab,Npc_HasItems(Trader,ItMw_Richtstab));
	};
	if(Npc_HasItems(Trader,ItMw_Stabkeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Stabkeule,Npc_HasItems(Trader,ItMw_Stabkeule));
	};
	if(Npc_HasItems(Trader,ITMW_BATTLEMAGE_STAB_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_BATTLEMAGE_STAB_02,Npc_HasItems(Trader,ITMW_BATTLEMAGE_STAB_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Keule_1h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Keule_1h_01,Npc_HasItems(Trader,ItMW_Addon_Keule_1h_01));
	};
	if(Npc_HasItems(Trader,ItMw_RangerStaff_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_RangerStaff_Addon,Npc_HasItems(Trader,ItMw_RangerStaff_Addon));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFDRUID_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFDRUID_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFDRUID_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFFIRE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFFIRE_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFFIRE_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3_STAFFWATER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3_STAFFWATER_01,Npc_HasItems(Trader,ITMW_2H_G3_STAFFWATER_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01,Npc_HasItems(Trader,ITMW_2H_KMR_BLACKSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab01,Npc_HasItems(Trader,ItMW_Addon_Stab01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab02,Npc_HasItems(Trader,ItMW_Addon_Stab02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab03,Npc_HasItems(Trader,ItMW_Addon_Stab03));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab04,Npc_HasItems(Trader,ItMW_Addon_Stab04));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01,Npc_HasItems(Trader,ITMW_2H_KMR_DAEMONSTAFF_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab01_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab01_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab01_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab02_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab02_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab02_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab03_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab03_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab03_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Stab04_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Stab04_NPC,Npc_HasItems(Trader,ItMW_Addon_Stab04_NPC));
	};
	if(Npc_HasItems(Trader,ItMW_Xardas_Stab) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Xardas_Stab,Npc_HasItems(Trader,ItMW_Xardas_Stab));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword,Npc_HasItems(Trader,ItMw_1h_MISC_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Sum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Sum,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Sum));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Str) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Str,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Str));
	};
	if(Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Mst) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_MISC_Sword_Mst,Npc_HasItems(Trader,ItMw_1h_MISC_Sword_Mst));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MISC_GSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MISC_GSWORD,Npc_HasItems(Trader,ITMW_1H_MISC_GSWORD));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Misc_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Misc_Axe,Npc_HasItems(Trader,ItMw_1h_Misc_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OldSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OldSword,Npc_HasItems(Trader,ItMw_2H_OldSword));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Sword_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Sword_M_01,Npc_HasItems(Trader,ItMw_2H_Sword_M_01));
	};
	if(Npc_HasItems(Trader,ITMW_SHADOWPRIEST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SHADOWPRIEST,Npc_HasItems(Trader,ITMW_SHADOWPRIEST));
	};
	if(Npc_HasItems(Trader,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(Trader,ITMW_SHADOWPRIEST_Elite));
	};
	if(Npc_HasItems(Trader,ItMw_Doom_OldPiratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Doom_OldPiratensaebel,Npc_HasItems(Trader,ItMw_Doom_OldPiratensaebel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DOOMSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DOOMSWORD,Npc_HasItems(Trader,ITMW_1H_DOOMSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_GHOSTSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_GHOSTSWORD,Npc_HasItems(Trader,ITMW_1H_GHOSTSWORD));
	};
	if(Npc_HasItems(Trader,ItMw_2H_IzgulScy) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_IzgulScy,Npc_HasItems(Trader,ItMw_2H_IzgulScy));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DoomSpeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DoomSpeer,Npc_HasItems(Trader,ITMW_1H_DoomSpeer));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(Trader,ITMW_2H_DRACONSWORD_DEAD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(Trader,ITMW_1H_DOOMSWORD_Elite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_PreElite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD_PreElite,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_PreElite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DOOMSWORD_Elite,Npc_HasItems(Trader,ITMW_2H_DOOMSWORD_Elite));
	};
	if(Npc_HasItems(Trader,ITMW_2H_RAVENELITE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_RAVENELITE,Npc_HasItems(Trader,ITMW_2H_RAVENELITE));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MASIAF_DAMN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MASIAF_DAMN,Npc_HasItems(Trader,ITMW_2H_MASIAF_DAMN));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon,Npc_HasItems(Trader,ItMw_DS_MonWeapon));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_Med) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_Med,Npc_HasItems(Trader,ItMw_DS_MonWeapon_Med));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_Elite,Npc_HasItems(Trader,ItMw_DS_MonWeapon_Elite));
	};
	if(Npc_HasItems(Trader,ItMw_DS_MonWeapon_ExElite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DS_MonWeapon_ExElite,Npc_HasItems(Trader,ItMw_DS_MonWeapon_ExElite));
	};
	if(Npc_HasItems(Trader,ItMi_GongDrum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GongDrum,Npc_HasItems(Trader,ItMi_GongDrum));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Sword,Npc_HasItems(Trader,ItMw_1h_Sld_Sword));
	};
	if(Npc_HasItems(Trader,Bdmn_vob) > 0)
	{
		Npc_RemoveInvItems(Trader,Bdmn_vob,Npc_HasItems(Trader,Bdmn_vob));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Dagger,Npc_HasItems(Trader,ItMw_1h_Vlk_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Sword_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Sword_L_03,Npc_HasItems(Trader,ItMw_1H_Sword_L_03));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Knife01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Knife01,Npc_HasItems(Trader,ItMW_Addon_Knife01));
	};
	if(Npc_HasItems(Trader,ItMW_Rich_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Rich_Sword,Npc_HasItems(Trader,ItMW_Rich_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_FrancisDagger_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_FrancisDagger_Mis,Npc_HasItems(Trader,ItMw_FrancisDagger_Mis));
	};
	if(Npc_HasItems(Trader,ItMw_OldPiratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OldPiratensaebel,Npc_HasItems(Trader,ItMw_OldPiratensaebel));
	};
	if(Npc_HasItems(Trader,ItMw_Piratensaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Piratensaebel,Npc_HasItems(Trader,ItMw_Piratensaebel));
	};
	if(Npc_HasItems(Trader,ItMw_Sense) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sense,Npc_HasItems(Trader,ItMw_Sense));
	};
	if(Npc_HasItems(Trader,ItMw_BartokSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_BartokSword,Npc_HasItems(Trader,ItMw_BartokSword));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_1h_02,Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_1h_01,Npc_HasItems(Trader,ItMW_Addon_Hacker_1h_01));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_2h_02,Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_02));
	};
	if(Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_Addon_Hacker_2h_01,Npc_HasItems(Trader,ItMW_Addon_Hacker_2h_01));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR1hAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR1hAxe,Npc_HasItems(Trader,ItMw_Addon_PIR1hAxe));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR1hSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR1hSword,Npc_HasItems(Trader,ItMw_Addon_PIR1hSword));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR2hAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR2hAxe,Npc_HasItems(Trader,ItMw_Addon_PIR2hAxe));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_PIR2hSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_PIR2hSword,Npc_HasItems(Trader,ItMw_Addon_PIR2hSword));
	};
	if(Npc_HasItems(Trader,ItMw_Schiffsaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schiffsaxt,Npc_HasItems(Trader,ItMw_Schiffsaxt));
	};
	if(Npc_HasItems(Trader,ItMw_OldSpage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_OldSpage,Npc_HasItems(Trader,ItMw_OldSpage));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Sword,Npc_HasItems(Trader,ItMw_1h_Vlk_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Addon_BanditTrader,Npc_HasItems(Trader,ItMw_Addon_BanditTrader));
	};
	if(Npc_HasItems(Trader,ItMw_Rapier) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rapier,Npc_HasItems(Trader,ItMw_Rapier));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_01,Npc_HasItems(Trader,ItMw_ChiefRapier_01));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_02,Npc_HasItems(Trader,ItMw_ChiefRapier_02));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_03,Npc_HasItems(Trader,ItMw_ChiefRapier_03));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_04,Npc_HasItems(Trader,ItMw_ChiefRapier_04));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_05,Npc_HasItems(Trader,ItMw_ChiefRapier_05));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_06,Npc_HasItems(Trader,ItMw_ChiefRapier_06));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_Loa,Npc_HasItems(Trader,ItMw_ChiefRapier_Loa));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_07,Npc_HasItems(Trader,ItMw_ChiefRapier_07));
	};
	if(Npc_HasItems(Trader,ItMw_ChiefRapier_08) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ChiefRapier_08,Npc_HasItems(Trader,ItMw_ChiefRapier_08));
	};
	if(Npc_HasItems(Trader,ItMw_Avabul_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Avabul_Dagger,Npc_HasItems(Trader,ItMw_Avabul_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GoldBrand) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GoldBrand,Npc_HasItems(Trader,ItMw_1H_GoldBrand));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA,Npc_HasItems(Trader,ITMW_2H_KATANA));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA_GIFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA_GIFT,Npc_HasItems(Trader,ITMW_2H_KATANA_GIFT));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KATANA_Gonsales) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KATANA_Gonsales,Npc_HasItems(Trader,ITMW_2H_KATANA_Gonsales));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade,Npc_HasItems(Trader,ItMw_1H_AssBlade));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_View) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_View,Npc_HasItems(Trader,ItMw_1H_AssBlade_View));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Known) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Known,Npc_HasItems(Trader,ItMw_1H_AssBlade_Known));
	};
	if(Npc_HasItems(Trader,ItMw_1H_AssBlade_Hero) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_AssBlade_Hero,Npc_HasItems(Trader,ItMw_1H_AssBlade_Hero));
	};
	if(Npc_HasItems(Trader,ITMW_FAKESWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_FAKESWORD_01,Npc_HasItems(Trader,ITMW_FAKESWORD_01));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Vlk_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Vlk_Axe,Npc_HasItems(Trader,ItMw_1h_Vlk_Axe));
	};
	if(Npc_HasItems(Trader,HEERSCHERSTAB) > 0)
	{
		Npc_RemoveInvItems(Trader,HEERSCHERSTAB,Npc_HasItems(Trader,HEERSCHERSTAB));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword2,Npc_HasItems(Trader,ItMw_ShortSword2));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword3,Npc_HasItems(Trader,ItMw_ShortSword3));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword4,Npc_HasItems(Trader,ItMw_ShortSword4));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword5,Npc_HasItems(Trader,ItMw_ShortSword5));
	};
	if(Npc_HasItems(Trader,ItMw_ShortSword1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ShortSword1,Npc_HasItems(Trader,ItMw_ShortSword1));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert,Npc_HasItems(Trader,ItMw_Schwert));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Mil_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Mil_Sword,Npc_HasItems(Trader,ItMw_1h_Mil_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Sword_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Sword_New,Npc_HasItems(Trader,ItMw_1h_Sld_Sword_New));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert3,Npc_HasItems(Trader,ItMw_Schwert3));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert2,Npc_HasItems(Trader,ItMw_Schwert2));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Pal_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Pal_Sword,Npc_HasItems(Trader,ItMw_1h_Pal_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender1,Npc_HasItems(Trader,ItMw_Zweihaender1));
	};
	if(Npc_HasItems(Trader,ItMw_Hellebarde) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Hellebarde,Npc_HasItems(Trader,ItMw_Hellebarde));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Sld_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Sld_Sword,Npc_HasItems(Trader,ItMw_2h_Sld_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender2,Npc_HasItems(Trader,ItMw_Zweihaender2));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Pal_Sword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Pal_Sword,Npc_HasItems(Trader,ItMw_2h_Pal_Sword));
	};
	if(Npc_HasItems(Trader,ItMw_Zweihaender4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Zweihaender4,Npc_HasItems(Trader,ItMw_Zweihaender4));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Claymore) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Claymore,Npc_HasItems(Trader,ItMw_2H_Claymore));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Pal_Sword_Etlu) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Pal_Sword_Etlu,Npc_HasItems(Trader,ItMw_1h_Pal_Sword_Etlu));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Pal_Sword_Etlu) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Pal_Sword_Etlu,Npc_HasItems(Trader,ItMw_2h_Pal_Sword_Etlu));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelkeule) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelkeule,Npc_HasItems(Trader,ItMw_Nagelkeule));
	};
	if(Npc_HasItems(Trader,ItMw_Nagelkeule2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Nagelkeule2,Npc_HasItems(Trader,ItMw_Nagelkeule2));
	};
	if(Npc_HasItems(Trader,ItMw_Streitkolben) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitkolben,Npc_HasItems(Trader,ItMw_Streitkolben));
	};
	if(Npc_HasItems(Trader,ItMw_Steinbrecher) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Steinbrecher,Npc_HasItems(Trader,ItMw_Steinbrecher));
	};
	if(Npc_HasItems(Trader,ItMw_Spicker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Spicker,Npc_HasItems(Trader,ItMw_Spicker));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegshammer1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegshammer1,Npc_HasItems(Trader,ItMw_Kriegshammer1));
	};
	if(Npc_HasItems(Trader,ItMw_Kriegshammer2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kriegshammer2,Npc_HasItems(Trader,ItMw_Kriegshammer2));
	};
	if(Npc_HasItems(Trader,ItMw_Morgenstern) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Morgenstern,Npc_HasItems(Trader,ItMw_Morgenstern));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MACE_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MACE_107,Npc_HasItems(Trader,ITMW_1H_MACE_107));
	};
	if(Npc_HasItems(Trader,ItMw_Inquisitor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Inquisitor,Npc_HasItems(Trader,ItMw_Inquisitor));
	};
	if(Npc_HasItems(Trader,ItMw_Rabenschnabel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rabenschnabel,Npc_HasItems(Trader,ItMw_Rabenschnabel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_MACE_BANDOS_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_MACE_BANDOS_107,Npc_HasItems(Trader,ITMW_1H_MACE_BANDOS_107));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Warhammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Warhammer,Npc_HasItems(Trader,ItMw_2H_Warhammer));
	};
	if(Npc_HasItems(Trader,ITMW_2H_MACE_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_MACE_107,Npc_HasItems(Trader,ITMW_2H_MACE_107));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Volebir) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Volebir,Npc_HasItems(Trader,ItMw_2H_Volebir));
	};
	if(Npc_HasItems(Trader,ItMw_2H_IceHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_IceHammer,Npc_HasItems(Trader,ItMw_2H_IceHammer));
	};
	if(Npc_HasItems(Trader,ItMw_2H_NordmarWarHammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_NordmarWarHammer,Npc_HasItems(Trader,ItMw_2H_NordmarWarHammer));
	};
	if(Npc_HasItems(Trader,ItMw_1H_MolagBarMace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_MolagBarMace,Npc_HasItems(Trader,ItMw_1H_MolagBarMace));
	};
	if(Npc_HasItems(Trader,ItMw_2H_SharpTeeth) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_SharpTeeth,Npc_HasItems(Trader,ItMw_2H_SharpTeeth));
	};
	if(Npc_HasItems(Trader,ItMw_1h_Sld_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1h_Sld_Axe,Npc_HasItems(Trader,ItMw_1h_Sld_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_Bartaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Bartaxt,Npc_HasItems(Trader,ItMw_Bartaxt));
	};
	if(Npc_HasItems(Trader,ItMw_Doppelaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Doppelaxt,Npc_HasItems(Trader,ItMw_Doppelaxt));
	};
	if(Npc_HasItems(Trader,ItMw_2h_Sld_Axe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Sld_Axe,Npc_HasItems(Trader,ItMw_2h_Sld_Axe));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt1,Npc_HasItems(Trader,ItMw_Streitaxt1));
	};
	if(Npc_HasItems(Trader,ItMw_Folteraxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Folteraxt,Npc_HasItems(Trader,ItMw_Folteraxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_BERSERK_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_BERSERK_107,Npc_HasItems(Trader,ITMW_2H_AXE_BERSERK_107));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3A_ORCAXE_02,Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_02));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt2,Npc_HasItems(Trader,ItMw_Streitaxt2));
	};
	if(Npc_HasItems(Trader,ItMw_Streitaxt3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Streitaxt3,Npc_HasItems(Trader,ItMw_Streitaxt3));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Common_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Common_01,Npc_HasItems(Trader,ItMw_1H_Common_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Common_01_Blade) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Common_01_Blade,Npc_HasItems(Trader,ItMw_1H_Common_01_Blade));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert1,Npc_HasItems(Trader,ItMw_Schwert1));
	};
	if(Npc_HasItems(Trader,ItMw_Schwert4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schwert4,Npc_HasItems(Trader,ItMw_Schwert4));
	};
	if(Npc_HasItems(Trader,ItMw_Rubinklinge) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Rubinklinge,Npc_HasItems(Trader,ItMw_Rubinklinge));
	};
	if(Npc_HasItems(Trader,ItMw_ElBastardo) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ElBastardo,Npc_HasItems(Trader,ItMw_ElBastardo));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_01,Npc_HasItems(Trader,ItMw_1H_Special_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_02,Npc_HasItems(Trader,ItMw_1H_Special_02));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_03,Npc_HasItems(Trader,ItMw_1H_Special_03));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Special_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Special_04,Npc_HasItems(Trader,ItMw_1H_Special_04));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_01,Npc_HasItems(Trader,ItMw_2H_Special_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_02,Npc_HasItems(Trader,ItMw_2H_Special_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_03,Npc_HasItems(Trader,ItMw_2H_Special_03));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Special_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Special_04,Npc_HasItems(Trader,ItMw_2H_Special_04));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_01,Npc_HasItems(Trader,ItMw_1H_Blessed_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_02,Npc_HasItems(Trader,ItMw_1H_Blessed_02));
	};
	if(Npc_HasItems(Trader,ItMw_1H_Blessed_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_Blessed_03,Npc_HasItems(Trader,ItMw_1H_Blessed_03));
	};
	if(Npc_HasItems(Trader,ItMw_Axe_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Axe_Blood,Npc_HasItems(Trader,ItMw_Axe_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Sword_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sword_Blood,Npc_HasItems(Trader,ItMw_Sword_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_Blood,Npc_HasItems(Trader,ItMw_Speer_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_01,Npc_HasItems(Trader,ItMw_Halleberde_01));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_02,Npc_HasItems(Trader,ItMw_Halleberde_02));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_03,Npc_HasItems(Trader,ItMw_Halleberde_03));
	};
	if(Npc_HasItems(Trader,ItMw_Halleberde_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Halleberde_04,Npc_HasItems(Trader,ItMw_Halleberde_04));
	};
	if(Npc_HasItems(Trader,ItMw_Staff_Blood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Staff_Blood,Npc_HasItems(Trader,ItMw_Staff_Blood));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_01,Npc_HasItems(Trader,ItMw_2H_Blessed_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_02,Npc_HasItems(Trader,ItMw_2H_Blessed_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Blessed_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Blessed_03,Npc_HasItems(Trader,ItMw_2H_Blessed_03));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SIMPLEBLACK,Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SIMPLEBLACK_DEX,Npc_HasItems(Trader,ITMW_1H_SIMPLEBLACK_DEX));
	};
	if(Npc_HasItems(Trader,ITMW_2H_SIMPLEBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_SIMPLEBLACK,Npc_HasItems(Trader,ITMW_2H_SIMPLEBLACK));
	};
	if(Npc_HasItems(Trader,ItMw_Drakesaebel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drakesaebel,Npc_HasItems(Trader,ItMw_Drakesaebel));
	};
	if(Npc_HasItems(Trader,ITMW_1H_KMR_GREATLONG_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_KMR_GREATLONG_01,Npc_HasItems(Trader,ITMW_1H_KMR_GREATLONG_01));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SWORD_LONG_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SWORD_LONG_05,Npc_HasItems(Trader,ITMW_1H_SWORD_LONG_05));
	};
	if(Npc_HasItems(Trader,ItMw_Runenschwert) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Runenschwert,Npc_HasItems(Trader,ItMw_Runenschwert));
	};
	if(Npc_HasItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01,Npc_HasItems(Trader,ITMW_1H_SWORD_ORCSLAYER_01));
	};
	if(Npc_HasItems(Trader,ItMw_Sturmbringer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Sturmbringer,Npc_HasItems(Trader,ItMw_Sturmbringer));
	};
	if(Npc_HasItems(Trader,ITMW_1H_CREST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_CREST,Npc_HasItems(Trader,ITMW_1H_CREST));
	};
	if(Npc_HasItems(Trader,ItMw_Orkschlaechter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Orkschlaechter,Npc_HasItems(Trader,ItMw_Orkschlaechter));
	};
	if(Npc_HasItems(Trader,ITMW_FEARUND) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_FEARUND,Npc_HasItems(Trader,ITMW_FEARUND));
	};
	if(Npc_HasItems(Trader,ItMw_Drachen_Sword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drachen_Sword_02,Npc_HasItems(Trader,ItMw_Drachen_Sword_02));
	};
	if(Npc_HasItems(Trader,ITMW_1H_KMR_SNAKESWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_KMR_SNAKESWORD_01,Npc_HasItems(Trader,ITMW_1H_KMR_SNAKESWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_NORMARDSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_NORMARDSWORD,Npc_HasItems(Trader,ITMW_NORMARDSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLACKSWORD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLACKSWORD,Npc_HasItems(Trader,ITMW_1H_BLACKSWORD));
	};
	if(Npc_HasItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01,Npc_HasItems(Trader,ITMW_1H_G3A_DAEMONBLADE_01));
	};
	if(Npc_HasItems(Trader,ItMw_1H_GinnokSword) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_1H_GinnokSword,Npc_HasItems(Trader,ItMw_1H_GinnokSword));
	};
	if(Npc_HasItems(Trader,ITMW_1H_XARADRIM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_XARADRIM,Npc_HasItems(Trader,ITMW_1H_XARADRIM));
	};
	if(Npc_HasItems(Trader,ITMW_1H_LostSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_LostSoul,Npc_HasItems(Trader,ITMW_1H_LostSoul));
	};
	if(Npc_HasItems(Trader,ITMW_1H_DEATHBRINGER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_DEATHBRINGER,Npc_HasItems(Trader,ITMW_1H_DEATHBRINGER));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC,Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC));
	};
	if(Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX,Npc_HasItems(Trader,ITMW_1H_BLESSEDBLACK_MAGIC_DEX));
	};
	if(Npc_HasItems(Trader,ITMW_2H_AXE_KOLUN_107) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_AXE_KOLUN_107,Npc_HasItems(Trader,ITMW_2H_AXE_KOLUN_107));
	};
	if(Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_G3A_ORCAXE_03,Npc_HasItems(Trader,ITMW_2H_G3A_ORCAXE_03));
	};
	if(Npc_HasItems(Trader,ItMw_Schlachtaxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Schlachtaxt,Npc_HasItems(Trader,ItMw_Schlachtaxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_AXE_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_AXE_H_02,Npc_HasItems(Trader,ITMW_2H_KMR_AXE_H_02));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_SOULSWORD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_SOULSWORD_01,Npc_HasItems(Trader,ITMW_2H_KMR_SOULSWORD_01));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01,Npc_HasItems(Trader,ITMW_2H_KMR_WITCHCLAYMORE_01));
	};
	if(Npc_HasItems(Trader,Orc_Blade) > 0)
	{
		Npc_RemoveInvItems(Trader,Orc_Blade,Npc_HasItems(Trader,Orc_Blade));
	};
	if(Npc_HasItems(Trader,ItMw_Drachenschneide) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Drachenschneide,Npc_HasItems(Trader,ItMw_Drachenschneide));
	};
	if(Npc_HasItems(Trader,ItMw_RuneAxeAncient) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_RuneAxeAncient,Npc_HasItems(Trader,ItMw_RuneAxeAncient));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_RHOBAR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_RHOBAR_01,Npc_HasItems(Trader,ITMW_2H_KMR_RHOBAR_01));
	};
	if(Npc_HasItems(Trader,ItMw_DemonHand) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DemonHand,Npc_HasItems(Trader,ItMw_DemonHand));
	};
	if(Npc_HasItems(Trader,ITMW_2H_KMR_GREATORCAXE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_KMR_GREATORCAXE_01,Npc_HasItems(Trader,ITMW_2H_KMR_GREATORCAXE_01));
	};
	if(Npc_HasItems(Trader,ItMw_DragonBone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DragonBone,Npc_HasItems(Trader,ItMw_DragonBone));
	};
	if(Npc_HasItems(Trader,ITMW_2H_URIZEL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_URIZEL,Npc_HasItems(Trader,ITMW_2H_URIZEL));
	};
	if(Npc_HasItems(Trader,ITMW_2H_URIZEL_NOMAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_URIZEL_NOMAGIC,Npc_HasItems(Trader,ITMW_2H_URIZEL_NOMAGIC));
	};
	if(Npc_HasItems(Trader,ITMW_2H_XARADRIM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_XARADRIM,Npc_HasItems(Trader,ITMW_2H_XARADRIM));
	};
	if(Npc_HasItems(Trader,ItMw_2H_DarkSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_DarkSoul,Npc_HasItems(Trader,ItMw_2H_DarkSoul));
	};
	if(Npc_HasItems(Trader,ItMw_Berserkeraxt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Berserkeraxt,Npc_HasItems(Trader,ItMw_Berserkeraxt));
	};
	if(Npc_HasItems(Trader,ITMW_2H_DRAGONMASTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_DRAGONMASTER,Npc_HasItems(Trader,ITMW_2H_DRAGONMASTER));
	};
	if(Npc_HasItems(Trader,ITMW_2H_WELTENSPALTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_WELTENSPALTER,Npc_HasItems(Trader,ITMW_2H_WELTENSPALTER));
	};
	if(Npc_HasItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC,Npc_HasItems(Trader,ITMW_2H_BLESSEDBLACK_MAGIC));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanAxe_01,Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanSword_01,Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_01));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanGreatAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanGreatAxe,Npc_HasItems(Trader,ItMw_2H_OrcHumanGreatAxe));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanAxe_02,Npc_HasItems(Trader,ItMw_2H_OrcHumanAxe_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanSword_02,Npc_HasItems(Trader,ItMw_2H_OrcHumanSword_02));
	};
	if(Npc_HasItems(Trader,ItMw_2H_OrcHumanDoppelAxe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_OrcHumanDoppelAxe,Npc_HasItems(Trader,ItMw_2H_OrcHumanDoppelAxe));
	};
	if(Npc_HasItems(Trader,ITMW_2H_OrcHumanClaymore) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_2H_OrcHumanClaymore,Npc_HasItems(Trader,ITMW_2H_OrcHumanClaymore));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER5,Npc_HasItems(Trader,ITMW_ZWEIHAENDER5));
	};
	if(Npc_HasItems(Trader,ITMW_ZWEIHAENDER6) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_ZWEIHAENDER6,Npc_HasItems(Trader,ITMW_ZWEIHAENDER6));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4));
	};
	if(Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5,Npc_HasItems(Trader,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5));
	};
	if(Npc_HasItems(Trader,ItMw_Iron_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Iron_Dagger,Npc_HasItems(Trader,ItMw_Iron_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_Steel_Dagger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Steel_Dagger,Npc_HasItems(Trader,ItMw_Steel_Dagger));
	};
	if(Npc_HasItems(Trader,ItMw_Speer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer,Npc_HasItems(Trader,ItMw_Speer));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_01,Npc_HasItems(Trader,ItMw_Speer_01));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_02,Npc_HasItems(Trader,ItMw_Speer_02));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_03,Npc_HasItems(Trader,ItMw_Speer_03));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_04,Npc_HasItems(Trader,ItMw_Speer_04));
	};
	if(Npc_HasItems(Trader,ItMw_Speer_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Speer_05,Npc_HasItems(Trader,ItMw_Speer_05));
	};
	if(Npc_HasItems(Trader,ItMw_SwordSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_SwordSpear,Npc_HasItems(Trader,ItMw_SwordSpear));
	};
	if(Npc_HasItems(Trader,ItMw_HeavySwordSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_HeavySwordSpear,Npc_HasItems(Trader,ItMw_HeavySwordSpear));
	};
	if(Npc_HasItems(Trader,ItMw_ButcherSpeer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_ButcherSpeer,Npc_HasItems(Trader,ItMw_ButcherSpeer));
	};
	if(Npc_HasItems(Trader,ItMw_DemonSpear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_DemonSpear,Npc_HasItems(Trader,ItMw_DemonSpear));
	};
	if(Npc_HasItems(Trader,ITMW_1H_WOLF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMW_1H_WOLF,Npc_HasItems(Trader,ITMW_1H_WOLF));
	};
	if(Npc_HasItems(Trader,ItSc_Scarband_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Scarband_01,Npc_HasItems(Trader,ItSc_Scarband_01));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_GoldNugget) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_GoldNugget,Npc_HasItems(Trader,ItMi_Addon_GoldNugget));
	};
	if(Npc_HasItems(Trader,ItMi_Osair_GoldNugget) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Osair_GoldNugget,Npc_HasItems(Trader,ItMi_Osair_GoldNugget));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_WhitePearl) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_WhitePearl,Npc_HasItems(Trader,ItMi_Addon_WhitePearl));
	};
	if(Npc_HasItems(Trader,ITMI_SPECIALJOINT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SPECIALJOINT,Npc_HasItems(Trader,ITMI_SPECIALJOINT));
	};
	if(Npc_HasItems(Trader,ItMi_BaltramPaket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BaltramPaket,Npc_HasItems(Trader,ItMi_BaltramPaket));
	};
	if(Npc_HasItems(Trader,ItMi_Packet_Baltram4Skip_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Packet_Baltram4Skip_Addon,Npc_HasItems(Trader,ItMi_Packet_Baltram4Skip_Addon));
	};
	if(Npc_HasItems(Trader,ItMi_BromorsGeld_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BromorsGeld_Addon,Npc_HasItems(Trader,ItMi_BromorsGeld_Addon));
	};
	if(Npc_HasItems(Trader,ItSe_ADDON_CavalornsBeutel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_ADDON_CavalornsBeutel,Npc_HasItems(Trader,ItSe_ADDON_CavalornsBeutel));	
	};
	if(Npc_HasItems(Trader,ItMi_Skull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Skull,Npc_HasItems(Trader,ItMi_Skull));
	};
	if(Npc_HasItems(Trader,ItMi_IECello) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IECello,Npc_HasItems(Trader,ItMi_IECello));
	};
	if(Npc_HasItems(Trader,ItMi_IEDrum) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDrum,Npc_HasItems(Trader,ItMi_IEDrum));
	};
	if(Npc_HasItems(Trader,ItMi_IEDrumScheit) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDrumScheit,Npc_HasItems(Trader,ItMi_IEDrumScheit));
	};
	if(Npc_HasItems(Trader,ItMi_IEDrumStick) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDrumStick,Npc_HasItems(Trader,ItMi_IEDrumStick));
	};
	if(Npc_HasItems(Trader,ItMi_IEDudelBlau) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDudelBlau,Npc_HasItems(Trader,ItMi_IEDudelBlau));
	};
	if(Npc_HasItems(Trader,ItMi_IEDudelGelb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEDudelGelb,Npc_HasItems(Trader,ItMi_IEDudelGelb));
	};
	if(Npc_HasItems(Trader,ItMi_IEHarfe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IEHarfe,Npc_HasItems(Trader,ItMi_IEHarfe));
	};
	if(Npc_HasItems(Trader,ItMi_IELaute) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IELaute,Npc_HasItems(Trader,ItMi_IELaute));
	};
	if(Npc_HasItems(Trader,ItMi_Zeitspalt_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Zeitspalt_Addon,Npc_HasItems(Trader,ItMi_Zeitspalt_Addon));
	};
	if(Npc_HasItems(Trader,ItMi_MoonStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MoonStone,Npc_HasItems(Trader,ItMi_MoonStone));
	};
	if(Npc_HasItems(Trader,ItMi_Adamant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Adamant,Npc_HasItems(Trader,ItMi_Adamant));
	};
	if(Npc_HasItems(Trader,ItMi_Addon_Joint_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Joint_01,Npc_HasItems(Trader,ItMi_Addon_Joint_01));
	};
	if(Npc_HasItems(Trader,ITMI_JOINT_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_JOINT_02,Npc_HasItems(Trader,ITMI_JOINT_02));
	};
	if(Npc_HasItems(Trader,ITMI_JOINT_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_JOINT_03,Npc_HasItems(Trader,ITMI_JOINT_03));
	};
	if(Npc_HasItems(Trader,ItMi_Stomper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Stomper,Npc_HasItems(Trader,ItMi_Stomper));
	};
	if(Npc_HasItems(Trader,ITMI_BROTSCHIEBER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BROTSCHIEBER,Npc_HasItems(Trader,ITMI_BROTSCHIEBER));
	};
	if(Npc_HasItems(Trader,ItMi_RuneBlank) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_RuneBlank,Npc_HasItems(Trader,ItMi_RuneBlank));
	};
	if(Npc_HasItems(Trader,ItMi_PyroRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PyroRune,Npc_HasItems(Trader,ItMi_PyroRune));
	};
	if(Npc_HasItems(Trader,ItMi_GalomRuneBack) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GalomRuneBack,Npc_HasItems(Trader,ItMi_GalomRuneBack));
	};
	if(Npc_HasItems(Trader,ItMi_Pliers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pliers,Npc_HasItems(Trader,ItMi_Pliers));
	};
	if(Npc_HasItems(Trader,ItMi_AnvilPliers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AnvilPliers,Npc_HasItems(Trader,ItMi_AnvilPliers));
	};
	if(Npc_HasItems(Trader,ItMi_Flask) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Flask,Npc_HasItems(Trader,ItMi_Flask));
	};
	if(Npc_HasItems(Trader,ItMi_Hammer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Hammer,Npc_HasItems(Trader,ItMi_Hammer));
	};
	if(Npc_HasItems(Trader,ItMi_Scoop) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Scoop,Npc_HasItems(Trader,ItMi_Scoop));
	};
	if(Npc_HasItems(Trader,ItMi_Pan) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pan,Npc_HasItems(Trader,ItMi_Pan));
	};
	if(Npc_HasItems(Trader,ItMi_PanFull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PanFull,Npc_HasItems(Trader,ItMi_PanFull));
	};
	if(Npc_HasItems(Trader,ItMi_Saw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Saw,Npc_HasItems(Trader,ItMi_Saw));
	};
	if(Npc_HasItems(Trader,ItMiSwordraw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMiSwordraw,Npc_HasItems(Trader,ItMiSwordraw));
	};
	if(Npc_HasItems(Trader,ITMISWORDRAWHOT_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMISWORDRAWHOT_1,Npc_HasItems(Trader,ITMISWORDRAWHOT_1));
	};
	if(Npc_HasItems(Trader,ItMiSwordbladehot) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMiSwordbladehot,Npc_HasItems(Trader,ItMiSwordbladehot));
	};
	if(Npc_HasItems(Trader,ITMISWORDBLADE_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMISWORDBLADE_1,Npc_HasItems(Trader,ITMISWORDBLADE_1));
	};
	if(Npc_HasItems(Trader,ItMi_Broom) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Broom,Npc_HasItems(Trader,ItMi_Broom));
	};
	if(Npc_HasItems(Trader,ItMi_Lute) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Lute,Npc_HasItems(Trader,ItMi_Lute));
	};
	if(Npc_HasItems(Trader,ItMi_Brush) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Brush,Npc_HasItems(Trader,ItMi_Brush));
	};
	if(Npc_HasItems(Trader,ItMi_Smoke_Pipe) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Smoke_Pipe,Npc_HasItems(Trader,ItMi_Smoke_Pipe));
	};
	if(Npc_HasItems(Trader,ItMi_Joint) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Joint,Npc_HasItems(Trader,ItMi_Joint));
	};
	if(Npc_HasItems(Trader,ITMI_REDJOINT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_REDJOINT,Npc_HasItems(Trader,ITMI_REDJOINT));
	};
	if(Npc_HasItems(Trader,ItMi_Packet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Packet,Npc_HasItems(Trader,ItMi_Packet));
	};
	if(Npc_HasItems(Trader,ItMi_VatrasPacket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VatrasPacket,Npc_HasItems(Trader,ItMi_VatrasPacket));
	};
	if(Npc_HasItems(Trader,ItMi_Pocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pocket,Npc_HasItems(Trader,ItMi_Pocket));
	};
	if(Npc_HasItems(Trader,ItMi_Nugget) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Nugget,Npc_HasItems(Trader,ItMi_Nugget));
	};
	if(Npc_HasItems(Trader,ItMi_IronStuck) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_IronStuck,Npc_HasItems(Trader,ItMi_IronStuck));
	};
	if(Npc_HasItems(Trader,ItMi_StuckGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_StuckGold,Npc_HasItems(Trader,ItMi_StuckGold));
	};
	if(Npc_HasItems(Trader,ItMi_OreStuck) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_OreStuck,Npc_HasItems(Trader,ItMi_OreStuck));
	};
	if(Npc_HasItems(Trader,ITMI_SNUGGET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SNUGGET,Npc_HasItems(Trader,ITMI_SNUGGET));
	};
	if(Npc_HasItems(Trader,ITMI_TESTNUGGET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TESTNUGGET,Npc_HasItems(Trader,ITMI_TESTNUGGET));
	};
	if(Npc_HasItems(Trader,ItMi_Gold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Gold,Npc_HasItems(Trader,ItMi_Gold));
	};
	if(Npc_HasItems(Trader,ItMi_OldCoin) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_OldCoin,Npc_HasItems(Trader,ItMi_OldCoin));
	};
	if(Npc_HasItems(Trader,ITMI_BELIAR_GOLD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BELIAR_GOLD,Npc_HasItems(Trader,ITMI_BELIAR_GOLD));
	};
	if(Npc_HasItems(Trader,ItMi_HolderGoldCandle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HolderGoldCandle,Npc_HasItems(Trader,ItMi_HolderGoldCandle));
	};
	if(Npc_HasItems(Trader,ItMi_NecklaceGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NecklaceGold,Npc_HasItems(Trader,ItMi_NecklaceGold));
	};
	if(Npc_HasItems(Trader,ItMi_SilverRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverRing,Npc_HasItems(Trader,ItMi_SilverRing));
	};
	if(Npc_HasItems(Trader,ItMi_SilverCup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverCup,Npc_HasItems(Trader,ItMi_SilverCup));
	};
	if(Npc_HasItems(Trader,ItMi_SilverPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverPlate,Npc_HasItems(Trader,ItMi_SilverPlate));
	};
	if(Npc_HasItems(Trader,ItMi_PlateGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PlateGold,Npc_HasItems(Trader,ItMi_PlateGold));
	};
	if(Npc_HasItems(Trader,ItMi_CupGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CupGold,Npc_HasItems(Trader,ItMi_CupGold));
	};
	if(Npc_HasItems(Trader,ItMi_HarimCup) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HarimCup,Npc_HasItems(Trader,ItMi_HarimCup));
	};
	if(Npc_HasItems(Trader,ITMI_GOMEZGOLDCUP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_GOMEZGOLDCUP,Npc_HasItems(Trader,ITMI_GOMEZGOLDCUP));
	};
	if(Npc_HasItems(Trader,ItMi_ZloodCup_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZloodCup_MIS,Npc_HasItems(Trader,ItMi_ZloodCup_MIS));
	};
	if(Npc_HasItems(Trader,ItMi_RingGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_RingGold,Npc_HasItems(Trader,ItMi_RingGold));
	};
	if(Npc_HasItems(Trader,ITMI_RAVENGOLDRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_RAVENGOLDRING,Npc_HasItems(Trader,ITMI_RAVENGOLDRING));
	};
	if(Npc_HasItems(Trader,ItMi_SilverChalice) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverChalice,Npc_HasItems(Trader,ItMi_SilverChalice));
	};
	if(Npc_HasItems(Trader,ItMi_ChaliceGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ChaliceGold,Npc_HasItems(Trader,ItMi_ChaliceGold));
	};
	if(Npc_HasItems(Trader,ItMi_ChestGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ChestGold,Npc_HasItems(Trader,ItMi_ChestGold));
	};
	if(Npc_HasItems(Trader,ItMi_JeweleryChest) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JeweleryChest,Npc_HasItems(Trader,ItMi_JeweleryChest));
	};
	if(Npc_HasItems(Trader,ITMI_CHEST_EMPTYGOLD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_CHEST_EMPTYGOLD,Npc_HasItems(Trader,ITMI_CHEST_EMPTYGOLD));
	};
	if(Npc_HasItems(Trader,ITMI_JEWELERYCHEST_EMPTY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_JEWELERYCHEST_EMPTY,Npc_HasItems(Trader,ITMI_JEWELERYCHEST_EMPTY));
	};
	if(Npc_HasItems(Trader,ItMi_InnosStatue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosStatue,Npc_HasItems(Trader,ItMi_InnosStatue));
	};
	if(Npc_HasItems(Trader,ItMi_Statue_Demon_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Statue_Demon_01,Npc_HasItems(Trader,ItMi_Statue_Demon_01));
	};
	if(Npc_HasItems(Trader,ITMI_ANTIENTSTATUE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ANTIENTSTATUE,Npc_HasItems(Trader,ITMI_ANTIENTSTATUE));
	};
	if(Npc_HasItems(Trader,ITMI_INNOSMRAMORSTATUE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_INNOSMRAMORSTATUE,Npc_HasItems(Trader,ITMI_INNOSMRAMORSTATUE));
	};
	if(Npc_HasItems(Trader,ItMi_Sextant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Sextant,Npc_HasItems(Trader,ItMi_Sextant));
	};
	if(Npc_HasItems(Trader,ItMi_SilverCandleHolder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverCandleHolder,Npc_HasItems(Trader,ItMi_SilverCandleHolder));
	};
	if(Npc_HasItems(Trader,ItMi_SilverNecklace) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SilverNecklace,Npc_HasItems(Trader,ItMi_SilverNecklace));
	};
	if(Npc_HasItems(Trader,ItMi_Sulfur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Sulfur,Npc_HasItems(Trader,ItMi_Sulfur));
	};
	if(Npc_HasItems(Trader,ItMi_Quartz) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Quartz,Npc_HasItems(Trader,ItMi_Quartz));
	};
	if(Npc_HasItems(Trader,ItMi_Pitch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pitch,Npc_HasItems(Trader,ItMi_Pitch));
	};
	if(Npc_HasItems(Trader,ItMi_Rockcrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Rockcrystal,Npc_HasItems(Trader,ItMi_Rockcrystal));
	};
	if(Npc_HasItems(Trader,ItMi_Aquamarine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Aquamarine,Npc_HasItems(Trader,ItMi_Aquamarine));
	};
	if(Npc_HasItems(Trader,ItMi_HolyWater) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HolyWater,Npc_HasItems(Trader,ItMi_HolyWater));
	};
	if(Npc_HasItems(Trader,ItMi_Coal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Coal,Npc_HasItems(Trader,ItMi_Coal));
	};
	if(Npc_HasItems(Trader,ItMi_DarkPearl) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DarkPearl,Npc_HasItems(Trader,ItMi_DarkPearl));
	};
	if(Npc_HasItems(Trader,ItMi_ApfelTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ApfelTabak,Npc_HasItems(Trader,ItMi_ApfelTabak));
	};
	if(Npc_HasItems(Trader,ItMi_PilzTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PilzTabak,Npc_HasItems(Trader,ItMi_PilzTabak));
	};
	if(Npc_HasItems(Trader,ItMi_DoppelTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DoppelTabak,Npc_HasItems(Trader,ItMi_DoppelTabak));
	};
	if(Npc_HasItems(Trader,ItMi_Honigtabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Honigtabak,Npc_HasItems(Trader,ItMi_Honigtabak));
	};
	if(Npc_HasItems(Trader,ItMi_SumpfTabak) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SumpfTabak,Npc_HasItems(Trader,ItMi_SumpfTabak));
	};
	if(Npc_HasItems(Trader,ItMi_Hasish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Hasish,Npc_HasItems(Trader,ItMi_Hasish));
	};
	if(Npc_HasItems(Trader,ITMI_QUICKSILVER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_QUICKSILVER,Npc_HasItems(Trader,ITMI_QUICKSILVER));
	};
	if(Npc_HasItems(Trader,ITMI_HORN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_HORN,Npc_HasItems(Trader,ITMI_HORN));
	};
	if(Npc_HasItems(Trader,ITMI_ORCRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCRING,Npc_HasItems(Trader,ITMI_ORCRING));
	};
	if(Npc_HasItems(Trader,ITMI_ORCSTAFF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCSTAFF,Npc_HasItems(Trader,ITMI_ORCSTAFF));
	};
	if(Npc_HasItems(Trader,ITMI_ORCAMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCAMULET,Npc_HasItems(Trader,ITMI_ORCAMULET));
	};
	if(Npc_HasItems(Trader,ITMI_ORCAMULET_VANHAN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCAMULET_VANHAN,Npc_HasItems(Trader,ITMI_ORCAMULET_VANHAN));
	};
	if(Npc_HasItems(Trader,ITMI_IDOL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_IDOL_01,Npc_HasItems(Trader,ITMI_IDOL_01));
	};
	if(Npc_HasItems(Trader,ITMI_IDOL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_IDOL_02,Npc_HasItems(Trader,ITMI_IDOL_02));
	};
	if(Npc_HasItems(Trader,ITMI_IDOL_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_IDOL_03,Npc_HasItems(Trader,ITMI_IDOL_03));
	};
	if(Npc_HasItems(Trader,ITMI_CRYSTALBLACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_CRYSTALBLACK,Npc_HasItems(Trader,ITMI_CRYSTALBLACK));
	};
	if(Npc_HasItems(Trader,ITMI_1_ORCPORTALSTONE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_1_ORCPORTALSTONE,Npc_HasItems(Trader,ITMI_1_ORCPORTALSTONE));
	};
	if(Npc_HasItems(Trader,ITMI_2_ORCPORTALSTONE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_2_ORCPORTALSTONE,Npc_HasItems(Trader,ITMI_2_ORCPORTALSTONE));
	};
	if(Npc_HasItems(Trader,ITMI_DRAGONGOLDFOCUS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DRAGONGOLDFOCUS,Npc_HasItems(Trader,ITMI_DRAGONGOLDFOCUS));
	};
	if(Npc_HasItems(Trader,ITMI_FISKPACKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FISKPACKET,Npc_HasItems(Trader,ITMI_FISKPACKET));
	};
	if(Npc_HasItems(Trader,ITMI_COALBAG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_COALBAG,Npc_HasItems(Trader,ITMI_COALBAG));
	};
	if(Npc_HasItems(Trader,ITMI_ALEFNUGGETSBAG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ALEFNUGGETSBAG,Npc_HasItems(Trader,ITMI_ALEFNUGGETSBAG));
	};
	if(Npc_HasItems(Trader,ITMI_FIRESHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FIRESHPERE,Npc_HasItems(Trader,ITMI_FIRESHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_WATERSHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_WATERSHPERE,Npc_HasItems(Trader,ITMI_WATERSHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_STONESHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STONESHPERE,Npc_HasItems(Trader,ITMI_STONESHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_DARKSHPERE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DARKSHPERE,Npc_HasItems(Trader,ITMI_DARKSHPERE));
	};
	if(Npc_HasItems(Trader,ITMI_TRIRAMAR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_TRIRAMAR,Npc_HasItems(Trader,ITMI_TRIRAMAR));
	};
	if(Npc_HasItems(Trader,ITMI_PALADINCHEST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PALADINCHEST,Npc_HasItems(Trader,ITMI_PALADINCHEST));
	};
	if(Npc_HasItems(Trader,ITMI_DRAGONGOLDGORN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DRAGONGOLDGORN,Npc_HasItems(Trader,ITMI_DRAGONGOLDGORN));
	};
	if(Npc_HasItems(Trader,ITMI_STONESOUL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STONESOUL,Npc_HasItems(Trader,ITMI_STONESOUL));
	};
	if(Npc_HasItems(Trader,ITMI_BENGARPACKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BENGARPACKET,Npc_HasItems(Trader,ITMI_BENGARPACKET));
	};
	if(Npc_HasItems(Trader,ITMI_BLACKBRENDI) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BLACKBRENDI,Npc_HasItems(Trader,ITMI_BLACKBRENDI));
	};
	if(Npc_HasItems(Trader,ITMI_HANNAGOLDNECKLACE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_HANNAGOLDNECKLACE,Npc_HasItems(Trader,ITMI_HANNAGOLDNECKLACE));
	};
	if(Npc_HasItems(Trader,ItMi_Salt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Salt,Npc_HasItems(Trader,ItMi_Salt));
	};
	if(Npc_HasItems(Trader,ITMI_SLEEPSACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SLEEPSACK,Npc_HasItems(Trader,ITMI_SLEEPSACK));
	};
	if(Npc_HasItems(Trader,ITMI_SLEEPSACK_TEMP) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SLEEPSACK_TEMP,Npc_HasItems(Trader,ITMI_SLEEPSACK_TEMP));
	};
	if(Npc_HasItems(Trader,ItAr_Hut) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Hut,Npc_HasItems(Trader,ItAr_Hut));
	};
	if(Npc_HasItems(Trader,ItAr_ThiefHut) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_ThiefHut,Npc_HasItems(Trader,ItAr_ThiefHut));
	};
	if(Npc_HasItems(Trader,ItAr_PirateHat) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_PirateHat,Npc_HasItems(Trader,ItAr_PirateHat));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_01,Npc_HasItems(Trader,ItAr_Helm_01));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_New_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_New_01,Npc_HasItems(Trader,ItAr_Helm_New_01));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_New_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_New_02,Npc_HasItems(Trader,ItAr_Helm_New_02));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_02,Npc_HasItems(Trader,ItAr_Helm_02));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Hunt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Hunt,Npc_HasItems(Trader,ItAr_Helm_Hunt));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_03,Npc_HasItems(Trader,ItAr_Helm_03));
	};
	if(Npc_HasItems(Trader,ItAr_Pal_Helm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Pal_Helm,Npc_HasItems(Trader,ItAr_Pal_Helm));
	};
	if(Npc_HasItems(Trader,ItAr_Pal_Helm_Open) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Pal_Helm_Open,Npc_HasItems(Trader,ItAr_Pal_Helm_Open));
	};
	if(Npc_HasItems(Trader,ItAr_DJG_Helm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_DJG_Helm,Npc_HasItems(Trader,ItAr_DJG_Helm));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Demon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Demon,Npc_HasItems(Trader,ItAr_Helm_Demon));
	};
	if(Npc_HasItems(Trader,G3_ARMOR_HELMET_CRONE) > 0)
	{
		Npc_RemoveInvItems(Trader,G3_ARMOR_HELMET_CRONE,Npc_HasItems(Trader,G3_ARMOR_HELMET_CRONE));
	};
	if(Npc_HasItems(Trader,ItAr_God_Helm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_God_Helm,Npc_HasItems(Trader,ItAr_God_Helm));
	};
	if(Npc_HasItems(Trader,ITMI_SLEEPERHELM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SLEEPERHELM,Npc_HasItems(Trader,ITMI_SLEEPERHELM));
	};
	if(Npc_HasItems(Trader,ITMI_HELMSLEEPER_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_HELMSLEEPER_MIS,Npc_HasItems(Trader,ITMI_HELMSLEEPER_MIS));
	};
	if(Npc_HasItems(Trader,ITMI_KOMPAS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_KOMPAS,Npc_HasItems(Trader,ITMI_KOMPAS));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_01,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_01));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_02,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_02));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_03,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_03));
	};
	if(Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_FALKGRANDFATHERITEM_04,Npc_HasItems(Trader,ITMI_FALKGRANDFATHERITEM_04));
	};
	if(Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STUFF_GEARWHEEL_01,Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_01));
	};
	if(Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_STUFF_GEARWHEEL_02,Npc_HasItems(Trader,ITMI_STUFF_GEARWHEEL_02));
	};
	if(Npc_HasItems(Trader,ITMI_MISSTORLOFTHING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_MISSTORLOFTHING,Npc_HasItems(Trader,ITMI_MISSTORLOFTHING));
	};
	if(Npc_HasItems(Trader,ITMI_NERGALCORPSE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_NERGALCORPSE,Npc_HasItems(Trader,ITMI_NERGALCORPSE));
	};
	if(Npc_HasItems(Trader,ITMI_ZOMBIECORPSE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ZOMBIECORPSE,Npc_HasItems(Trader,ITMI_ZOMBIECORPSE));
	};
	if(Npc_HasItems(Trader,ITMI_PLAZMA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PLAZMA,Npc_HasItems(Trader,ITMI_PLAZMA));
	};
	if(Npc_HasItems(Trader,ITMI_GADERSTONE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_GADERSTONE,Npc_HasItems(Trader,ITMI_GADERSTONE));
	};
	if(Npc_HasItems(Trader,ITMI_WATERCRYSTAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_WATERCRYSTAL,Npc_HasItems(Trader,ITMI_WATERCRYSTAL));
	};
	if(Npc_HasItems(Trader,ITMI_PIECEDARKGOLEM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PIECEDARKGOLEM,Npc_HasItems(Trader,ITMI_PIECEDARKGOLEM));
	};
	if(Npc_HasItems(Trader,ITMI_ORCMAINTOTEM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCMAINTOTEM,Npc_HasItems(Trader,ITMI_ORCMAINTOTEM));
	};
	if(Npc_HasItems(Trader,ItMi_GrahShar) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GrahShar,Npc_HasItems(Trader,ItMi_GrahShar));
	};
	if(Npc_HasItems(Trader,ITMI_POISONBOTTLE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_POISONBOTTLE,Npc_HasItems(Trader,ITMI_POISONBOTTLE));
	};
	if(Npc_HasItems(Trader,ITMI_ADANOSAMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ADANOSAMULET,Npc_HasItems(Trader,ITMI_ADANOSAMULET));
	};
	if(Npc_HasItems(Trader,ITMI_ORCWARHORN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCWARHORN,Npc_HasItems(Trader,ITMI_ORCWARHORN));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOrePliers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOrePliers,Npc_HasItems(Trader,ItMi_MagicOrePliers));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_5) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_5,Npc_HasItems(Trader,ItMi_MagicOreRaw_5));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_4) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_4,Npc_HasItems(Trader,ItMi_MagicOreRaw_4));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_3,Npc_HasItems(Trader,ItMi_MagicOreRaw_3));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_2,Npc_HasItems(Trader,ItMi_MagicOreRaw_2));
	};
	if(Npc_HasItems(Trader,ItMi_MagicOreRaw_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicOreRaw_1,Npc_HasItems(Trader,ItMi_MagicOreRaw_1));
	};
	if(Npc_HasItems(Trader,ItWr_DragNimrod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DragNimrod,Npc_HasItems(Trader,ItWr_DragNimrod));
	};
	if(Npc_HasItems(Trader,ITMI_SeekerSoul) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SeekerSoul,Npc_HasItems(Trader,ITMI_SeekerSoul));
	};
	if(Npc_HasItems(Trader,ITMI_NOVMATERIAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_NOVMATERIAL,Npc_HasItems(Trader,ITMI_NOVMATERIAL));
	};
	if(Npc_HasItems(Trader,ItMi_AssGoldPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AssGoldPocket,Npc_HasItems(Trader,ItMi_AssGoldPocket));
	};
	if(Npc_HasItems(Trader,ItMi_HasimAmuls) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HasimAmuls,Npc_HasItems(Trader,ItMi_HasimAmuls));
	};
	if(Npc_HasItems(Trader,ItMi_PacketColesulfur) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PacketColesulfur,Npc_HasItems(Trader,ItMi_PacketColesulfur));
	};
	if(Npc_HasItems(Trader,ItMi_SulfurMuttonRaw) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SulfurMuttonRaw,Npc_HasItems(Trader,ItMi_SulfurMuttonRaw));
	};
	if(Npc_HasItems(Trader,ItMi_Feder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Feder,Npc_HasItems(Trader,ItMi_Feder));
	};
	if(Npc_HasItems(Trader,ItMi_HarpyFeder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HarpyFeder,Npc_HasItems(Trader,ItMi_HarpyFeder));
	};
	if(Npc_HasItems(Trader,ItMi_Palette) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Palette,Npc_HasItems(Trader,ItMi_Palette));
	};
	if(Npc_HasItems(Trader,ItMi_Pinsel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Pinsel,Npc_HasItems(Trader,ItMi_Pinsel));
	};
	if(Npc_HasItems(Trader,ItMi_Bottle_Empty) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Bottle_Empty,Npc_HasItems(Trader,ItMi_Bottle_Empty));
	};
	if(Npc_HasItems(Trader,ItWr_CroneAdanos) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CroneAdanos,Npc_HasItems(Trader,ItWr_CroneAdanos));
	};
	if(Npc_HasItems(Trader,ItWr_AdanosCrone_Ready) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AdanosCrone_Ready,Npc_HasItems(Trader,ItWr_AdanosCrone_Ready));
	};
	if(Npc_HasItems(Trader,ItMi_PortalRuneAdanos) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PortalRuneAdanos,Npc_HasItems(Trader,ItMi_PortalRuneAdanos));
	};
	if(Npc_HasItems(Trader,ItWr_StoneAdanosPortal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StoneAdanosPortal,Npc_HasItems(Trader,ItWr_StoneAdanosPortal));
	};
	if(Npc_HasItems(Trader,ItMi_XoD_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_XoD_01,Npc_HasItems(Trader,ItMi_XoD_01));
	};
	if(Npc_HasItems(Trader,ItMi_YoD_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YoD_02,Npc_HasItems(Trader,ItMi_YoD_02));
	};
	if(Npc_HasItems(Trader,ItMi_ZoD_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZoD_03,Npc_HasItems(Trader,ItMi_ZoD_03));
	};
	if(Npc_HasItems(Trader,ItMi_UoD_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UoD_04,Npc_HasItems(Trader,ItMi_UoD_04));
	};
	if(Npc_HasItems(Trader,ItMi_AdanosTear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AdanosTear,Npc_HasItems(Trader,ItMi_AdanosTear));
	};
	if(Npc_HasItems(Trader,ItRi_GoldSkipetr_NoMagic) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_GoldSkipetr_NoMagic,Npc_HasItems(Trader,ItRi_GoldSkipetr_NoMagic));
	};
	if(Npc_HasItems(Trader,ItRi_AdanosGoldSkipetr) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_AdanosGoldSkipetr,Npc_HasItems(Trader,ItRi_AdanosGoldSkipetr));
	};
	if(Npc_HasItems(Trader,ItMi_XunePart_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_XunePart_01,Npc_HasItems(Trader,ItMi_XunePart_01));
	};
	if(Npc_HasItems(Trader,ItMi_ZunePart_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZunePart_02,Npc_HasItems(Trader,ItMi_ZunePart_02));
	};
	if(Npc_HasItems(Trader,ItMi_YunePart_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YunePart_03,Npc_HasItems(Trader,ItMi_YunePart_03));
	};
	if(Npc_HasItems(Trader,ItMi_WunePart_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_WunePart_04,Npc_HasItems(Trader,ItMi_WunePart_04));
	};
	if(Npc_HasItems(Trader,ItMi_UunePart_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UunePart_05,Npc_HasItems(Trader,ItMi_UunePart_05));
	};
	if(Npc_HasItems(Trader,ItMi_DuneAdanos) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DuneAdanos,Npc_HasItems(Trader,ItMi_DuneAdanos));
	};
	if(Npc_HasItems(Trader,ItMi_GuneAdanos_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GuneAdanos_02,Npc_HasItems(Trader,ItMi_GuneAdanos_02));
	};
	if(Npc_HasItems(Trader,ItMi_LuneAdanos_Full) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_LuneAdanos_Full,Npc_HasItems(Trader,ItMi_LuneAdanos_Full));
	};
	if(Npc_HasItems(Trader,ItMi_TearsRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TearsRune,Npc_HasItems(Trader,ItMi_TearsRune));
	};
	if(Npc_HasItems(Trader,ItMi_BlackOrcTalisman) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BlackOrcTalisman,Npc_HasItems(Trader,ItMi_BlackOrcTalisman));
	};
	if(Npc_HasItems(Trader,ItMi_HuntSign) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HuntSign,Npc_HasItems(Trader,ItMi_HuntSign));
	};
	if(Npc_HasItems(Trader,ItMi_BukTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BukTree,Npc_HasItems(Trader,ItMi_BukTree));
	};
	if(Npc_HasItems(Trader,ItMi_Buk_Arbalet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Buk_Arbalet,Npc_HasItems(Trader,ItMi_Buk_Arbalet));
	};
	if(Npc_HasItems(Trader,ItAt_BlackTrollHorn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_BlackTrollHorn,Npc_HasItems(Trader,ItAt_BlackTrollHorn));
	};
	if(Npc_HasItems(Trader,ItAt_PumaMuscle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_PumaMuscle,Npc_HasItems(Trader,ItAt_PumaMuscle));
	};
	if(Npc_HasItems(Trader,ItAt_PumaMuscle_Jir) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_PumaMuscle_Jir,Npc_HasItems(Trader,ItAt_PumaMuscle_Jir));
	};
	if(Npc_HasItems(Trader,ItWr_OldTextMine) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OldTextMine,Npc_HasItems(Trader,ItWr_OldTextMine));
	};
	if(Npc_HasItems(Trader,ItMi_PortalCrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PortalCrystal,Npc_HasItems(Trader,ItMi_PortalCrystal));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_01,Npc_HasItems(Trader,ItAr_Helm_G3_01));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_02,Npc_HasItems(Trader,ItAr_Helm_G3_02));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_04,Npc_HasItems(Trader,ItAr_Helm_G3_04));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_G3_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_G3_06,Npc_HasItems(Trader,ItAr_Helm_G3_06));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel_Low,Npc_HasItems(Trader,ItAr_Helm_Skel_Low));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel,Npc_HasItems(Trader,ItAr_Helm_Skel));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel_Elite) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel_Elite,Npc_HasItems(Trader,ItAr_Helm_Skel_Elite));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Skel_King) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Skel_King,Npc_HasItems(Trader,ItAr_Helm_Skel_King));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Avabul) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Avabul,Npc_HasItems(Trader,ItAr_Helm_Avabul));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Janus) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Janus,Npc_HasItems(Trader,ItAr_Helm_Janus));
	};
	if(Npc_HasItems(Trader,ItAr_Helm_Egezart) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_Helm_Egezart,Npc_HasItems(Trader,ItAr_Helm_Egezart));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_01,Npc_HasItems(Trader,ItMi_DragonStaffPiece_01));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_02,Npc_HasItems(Trader,ItMi_DragonStaffPiece_02));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_03,Npc_HasItems(Trader,ItMi_DragonStaffPiece_03));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_04,Npc_HasItems(Trader,ItMi_DragonStaffPiece_04));
	};
	if(Npc_HasItems(Trader,ItMi_DragonStaffPiece_Eye) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DragonStaffPiece_Eye,Npc_HasItems(Trader,ItMi_DragonStaffPiece_Eye));
	};
	if(Npc_HasItems(Trader,ItMi_SteelForm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_SteelForm,Npc_HasItems(Trader,ItMi_SteelForm));
	};
	if(Npc_HasItems(Trader,ItMi_Diamod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Diamod,Npc_HasItems(Trader,ItMi_Diamod));
	};
	if(Npc_HasItems(Trader,ItMi_Emerald) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Emerald,Npc_HasItems(Trader,ItMi_Emerald));
	};
	if(Npc_HasItems(Trader,ItMi_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Ruby,Npc_HasItems(Trader,ItMi_Ruby));
	};
	if(Npc_HasItems(Trader,ItMi_Sapphire) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Sapphire,Npc_HasItems(Trader,ItMi_Sapphire));
	};
	if(Npc_HasItems(Trader,ItMi_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Opal,Npc_HasItems(Trader,ItMi_Opal));
	};
	if(Npc_HasItems(Trader,ItMi_Topaz) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Topaz,Npc_HasItems(Trader,ItMi_Topaz));
	};
	if(Npc_HasItems(Trader,ItMi_GroshBottle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GroshBottle,Npc_HasItems(Trader,ItMi_GroshBottle));
	};
	if(Npc_HasItems(Trader,ItMi_ZharpStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ZharpStone,Npc_HasItems(Trader,ItMi_ZharpStone));
	};
	if(Npc_HasItems(Trader,ItMi_AncientRuneStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_AncientRuneStone,Npc_HasItems(Trader,ItMi_AncientRuneStone));
	};
	if(Npc_HasItems(Trader,ItMi_NecrUrn) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NecrUrn,Npc_HasItems(Trader,ItMi_NecrUrn));
	};
	if(Npc_HasItems(Trader,ItMi_BigRuby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BigRuby,Npc_HasItems(Trader,ItMi_BigRuby));
	};
	if(Npc_HasItems(Trader,ItMi_DiamondChoker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_DiamondChoker,Npc_HasItems(Trader,ItMi_DiamondChoker));
	};
	if(Npc_HasItems(Trader,ItMi_HuntHornGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HuntHornGold,Npc_HasItems(Trader,ItMi_HuntHornGold));
	};
	if(Npc_HasItems(Trader,ItMi_KnifeGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KnifeGold,Npc_HasItems(Trader,ItMi_KnifeGold));
	};
	if(Npc_HasItems(Trader,ItMi_OreBaronCrown) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_OreBaronCrown,Npc_HasItems(Trader,ItMi_OreBaronCrown));
	};
	if(Npc_HasItems(Trader,ItMi_Wax) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Wax,Npc_HasItems(Trader,ItMi_Wax));
	};
	if(Npc_HasItems(Trader,ItWr_Seamap_Mirtana) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Seamap_Mirtana,Npc_HasItems(Trader,ItWr_Seamap_Mirtana));
	};
	if(Npc_HasItems(Trader,ItAr_ShrecHelm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAr_ShrecHelm,Npc_HasItems(Trader,ItAr_ShrecHelm));
	};
	if(Npc_HasItems(Trader,ItWr_KrowBook) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_KrowBook,Npc_HasItems(Trader,ItWr_KrowBook));
	};
	if(Npc_HasItems(Trader,ItMi_StoneGuardianPiece) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_StoneGuardianPiece,Npc_HasItems(Trader,ItMi_StoneGuardianPiece));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_01,Npc_HasItems(Trader,ItMi_BowRope_01));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_02,Npc_HasItems(Trader,ItMi_BowRope_02));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_03,Npc_HasItems(Trader,ItMi_BowRope_03));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_04,Npc_HasItems(Trader,ItMi_BowRope_04));
	};
	if(Npc_HasItems(Trader,ItMi_BowRope_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BowRope_05,Npc_HasItems(Trader,ItMi_BowRope_05));
	};
	if(Npc_HasItems(Trader,ItMi_JustTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JustTree,Npc_HasItems(Trader,ItMi_JustTree));
	};
	if(Npc_HasItems(Trader,ItMi_EveTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_EveTree,Npc_HasItems(Trader,ItMi_EveTree));
	};
	if(Npc_HasItems(Trader,ItMi_VyzTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VyzTree,Npc_HasItems(Trader,ItMi_VyzTree));
	};
	if(Npc_HasItems(Trader,ItMi_YsuoTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YsuoTree,Npc_HasItems(Trader,ItMi_YsuoTree));
	};
	if(Npc_HasItems(Trader,ItMi_BokTree) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BokTree,Npc_HasItems(Trader,ItMi_BokTree));
	};
	if(Npc_HasItems(Trader,ItMi_JustBowCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JustBowCorpse,Npc_HasItems(Trader,ItMi_JustBowCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_EveCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_EveCorpse,Npc_HasItems(Trader,ItMi_EveCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_VyzCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VyzCorpse,Npc_HasItems(Trader,ItMi_VyzCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_YsuoCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_YsuoCorpse,Npc_HasItems(Trader,ItMi_YsuoCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_BokCorpse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BokCorpse,Npc_HasItems(Trader,ItMi_BokCorpse));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportStone,Npc_HasItems(Trader,ItMi_TeleportStone));
	};
	if(Npc_HasItems(Trader,ItMi_Fitil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Fitil,Npc_HasItems(Trader,ItMi_Fitil));
	};
	if(Npc_HasItems(Trader,ItMi_CanoneBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CanoneBall,Npc_HasItems(Trader,ItMi_CanoneBall));
	};
	if(Npc_HasItems(Trader,ItMi_CanoneBall_Fire) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CanoneBall_Fire,Npc_HasItems(Trader,ItMi_CanoneBall_Fire));
	};
	if(Npc_HasItems(Trader,ItMi_MagicPowder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicPowder,Npc_HasItems(Trader,ItMi_MagicPowder));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportFarm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportFarm,Npc_HasItems(Trader,ItMi_TeleportFarm));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportTaverne) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportTaverne,Npc_HasItems(Trader,ItMi_TeleportTaverne));
	};
	if(Npc_HasItems(Trader,ItMi_TeleportPsicamp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TeleportPsicamp,Npc_HasItems(Trader,ItMi_TeleportPsicamp));
	};
	if(Npc_HasItems(Trader,CA_ITMI_BRANCH) > 0)
	{
		Npc_RemoveInvItems(Trader,CA_ITMI_BRANCH,Npc_HasItems(Trader,CA_ITMI_BRANCH));
	};
	if(Npc_HasItems(Trader,ItMi_BeliarPowerStone) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BeliarPowerStone,Npc_HasItems(Trader,ItMi_BeliarPowerStone));
	};
	if(Npc_HasItems(Trader,ItBg_Armor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Armor,Npc_HasItems(Trader,ItBg_Armor));
	};
	if(Npc_HasItems(Trader,ItBg_Weapon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Weapon,Npc_HasItems(Trader,ItBg_Weapon));
	};
	if(Npc_HasItems(Trader,ItBg_Alchemy) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Alchemy,Npc_HasItems(Trader,ItBg_Alchemy));
	};
	if(Npc_HasItems(Trader,ItBg_Mage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Mage,Npc_HasItems(Trader,ItBg_Mage));
	};
	if(Npc_HasItems(Trader,ItBg_Jewerly) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Jewerly,Npc_HasItems(Trader,ItBg_Jewerly));
	};
	if(Npc_HasItems(Trader,ItBg_PlatsFood) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_PlatsFood,Npc_HasItems(Trader,ItBg_PlatsFood));
	};
	if(Npc_HasItems(Trader,ItBg_Trash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItBg_Trash,Npc_HasItems(Trader,ItBg_Trash));
	};
	if(Npc_HasItems(Trader,ItPl_ExBlueMalve) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_ExBlueMalve,Npc_HasItems(Trader,ItPl_ExBlueMalve));
	};
	if(Npc_HasItems(Trader,ItMi_BlackPearlNeckle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BlackPearlNeckle,Npc_HasItems(Trader,ItMi_BlackPearlNeckle));
	};
	if(Npc_HasItems(Trader,ITMI_SONJAWIG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SONJAWIG,Npc_HasItems(Trader,ITMI_SONJAWIG));
	};
	if(Npc_HasItems(Trader,ItMw_Kirka_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_Kirka_New,Npc_HasItems(Trader,ItMw_Kirka_New));
	};
	if(Npc_HasItems(Trader,ItMw_2H_Axe_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2H_Axe_L_01,Npc_HasItems(Trader,ItMw_2H_Axe_L_01));
	};
	if(Npc_HasItems(Trader,ItMi_FlyCarpet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_FlyCarpet,Npc_HasItems(Trader,ItMi_FlyCarpet));
	};
	if(Npc_HasItems(Trader,ItSe_FlyCarpet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_FlyCarpet,Npc_HasItems(Trader,ItSe_FlyCarpet));
	};
	if(Npc_HasItems(Trader,ItPl_Weed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Weed,Npc_HasItems(Trader,ItPl_Weed));
	};
	if(Npc_HasItems(Trader,ItPl_UnWeed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_UnWeed,Npc_HasItems(Trader,ItPl_UnWeed));
	};
	if(Npc_HasItems(Trader,ItPl_Beet) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Beet,Npc_HasItems(Trader,ItPl_Beet));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb,Npc_HasItems(Trader,ItPl_SwampHerb));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb_Balam_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb_Balam_01,Npc_HasItems(Trader,ItPl_SwampHerb_Balam_01));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb_Balam_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb_Balam_02,Npc_HasItems(Trader,ItPl_SwampHerb_Balam_02));
	};
	if(Npc_HasItems(Trader,ItPl_SwampHerb_Balam_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_SwampHerb_Balam_03,Npc_HasItems(Trader,ItPl_SwampHerb_Balam_03));
	};
	if(Npc_HasItems(Trader,ITPL_SWAMPHERB_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPL_SWAMPHERB_02,Npc_HasItems(Trader,ITPL_SWAMPHERB_02));
	};
	if(Npc_HasItems(Trader,ItPl_Mana_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mana_Herb_01,Npc_HasItems(Trader,ItPl_Mana_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Mana_Herb_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mana_Herb_02,Npc_HasItems(Trader,ItPl_Mana_Herb_02));
	};
	if(Npc_HasItems(Trader,ItPl_Mana_Herb_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mana_Herb_03,Npc_HasItems(Trader,ItPl_Mana_Herb_03));
	};
	if(Npc_HasItems(Trader,ItPl_NetbekPlant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_NetbekPlant,Npc_HasItems(Trader,ItPl_NetbekPlant));
	};
	if(Npc_HasItems(Trader,ItPl_Health_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Health_Herb_01,Npc_HasItems(Trader,ItPl_Health_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Health_Herb_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Health_Herb_02,Npc_HasItems(Trader,ItPl_Health_Herb_02));
	};
	if(Npc_HasItems(Trader,ItPl_Health_Herb_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Health_Herb_03,Npc_HasItems(Trader,ItPl_Health_Herb_03));
	};
	if(Npc_HasItems(Trader,ItPl_Dex_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Dex_Herb_01,Npc_HasItems(Trader,ItPl_Dex_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Strength_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Strength_Herb_01,Npc_HasItems(Trader,ItPl_Strength_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Speed_Herb_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Speed_Herb_01,Npc_HasItems(Trader,ItPl_Speed_Herb_01));
	};
	if(Npc_HasItems(Trader,ItPl_Mushroom_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mushroom_01,Npc_HasItems(Trader,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(Trader,ItPl_Mushroom_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Mushroom_02,Npc_HasItems(Trader,ItPl_Mushroom_02));
	};
	if(Npc_HasItems(Trader,ItPl_Blueplant) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Blueplant,Npc_HasItems(Trader,ItPl_Blueplant));
	};
	if(Npc_HasItems(Trader,ItPl_Forestberry) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Forestberry,Npc_HasItems(Trader,ItPl_Forestberry));
	};
	if(Npc_HasItems(Trader,ItPl_Planeberry) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Planeberry,Npc_HasItems(Trader,ItPl_Planeberry));
	};
	if(Npc_HasItems(Trader,ItPl_Temp_Herb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Temp_Herb,Npc_HasItems(Trader,ItPl_Temp_Herb));
	};
	if(Npc_HasItems(Trader,ItPl_Perm_Herb) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Perm_Herb,Npc_HasItems(Trader,ItPl_Perm_Herb));
	};
	if(Npc_HasItems(Trader,ITPL_SUPER_HERB) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPL_SUPER_HERB,Npc_HasItems(Trader,ITPL_SUPER_HERB));
	};
	if(Npc_HasItems(Trader,ItPl_CactusFlower) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_CactusFlower,Npc_HasItems(Trader,ItPl_CactusFlower));
	};
	if(Npc_HasItems(Trader,ITPL_DesertIll) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPL_DesertIll,Npc_HasItems(Trader,ITPL_DesertIll));
	};
	if(Npc_HasItems(Trader,ItPl_MagicRoot) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_MagicRoot,Npc_HasItems(Trader,ItPl_MagicRoot));
	};
	if(Npc_HasItems(Trader,ItPl_DarkClover) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_DarkClover,Npc_HasItems(Trader,ItPl_DarkClover));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_01,Npc_HasItems(Trader,ItPo_Mana_01));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_02,Npc_HasItems(Trader,ItPo_Mana_02));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_03,Npc_HasItems(Trader,ItPo_Mana_03));
	};
	if(Npc_HasItems(Trader,ItPo_Health_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_01,Npc_HasItems(Trader,ItPo_Health_01));
	};
	if(Npc_HasItems(Trader,ItPo_Health_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_02,Npc_HasItems(Trader,ItPo_Health_02));
	};
	if(Npc_HasItems(Trader,ItPo_Health_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_03,Npc_HasItems(Trader,ItPo_Health_03));
	};
	if(Npc_HasItems(Trader,ItPo_Health_Addon_04_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_Addon_04_New,Npc_HasItems(Trader,ItPo_Health_Addon_04_New));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR,Npc_HasItems(Trader,ItPo_Perm_STR));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_M_Low,Npc_HasItems(Trader,ItPo_Perm_STR_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_M_Normal,Npc_HasItems(Trader,ItPo_Perm_STR_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_M_Strong,Npc_HasItems(Trader,ItPo_Perm_STR_M_Strong));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_STR_Fake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_STR_Fake,Npc_HasItems(Trader,ItPo_Perm_STR_Fake));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_DEX) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_DEX,Npc_HasItems(Trader,ItPo_Perm_DEX));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Dex_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Dex_M_Low,Npc_HasItems(Trader,ItPo_Perm_Dex_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Dex_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Dex_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Dex_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Dex_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Dex_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Dex_M_Strong));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health,Npc_HasItems(Trader,ItPo_Perm_Health));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health_M_Low,Npc_HasItems(Trader,ItPo_Perm_Health_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Health_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Health_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Health_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Health_M_Strong));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana,Npc_HasItems(Trader,ItPo_Perm_Mana));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana_M_Low,Npc_HasItems(Trader,ItPo_Perm_Mana_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Mana_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Mana_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Mana_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Mana_M_Strong));
	};
	if(Npc_HasItems(Trader,ITPO_TYONPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_TYONPOTION,Npc_HasItems(Trader,ITPO_TYONPOTION));
	};
	if(Npc_HasItems(Trader,ItPo_Speed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Speed,Npc_HasItems(Trader,ItPo_Speed));
	};
	if(Npc_HasItems(Trader,ITPO_SPEED_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SPEED_02,Npc_HasItems(Trader,ITPO_SPEED_02));
	};
	if(Npc_HasItems(Trader,ItPo_Stamina) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Stamina,Npc_HasItems(Trader,ItPo_Stamina));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina,Npc_HasItems(Trader,ItPo_Perm_Stamina));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina_M_Low,Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Low));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Normal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina_M_Normal,Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Normal));
	};
	if(Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Strong) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_Stamina_M_Strong,Npc_HasItems(Trader,ItPo_Perm_Stamina_M_Strong));
	};
	if(Npc_HasItems(Trader,ITPO_XMAGICDEF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_XMAGICDEF,Npc_HasItems(Trader,ITPO_XMAGICDEF));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_DEF) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_DEF,Npc_HasItems(Trader,ITPO_PERM_DEF));
	};
	if(Npc_HasItems(Trader,ITPO_XORCPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_XORCPOTION,Npc_HasItems(Trader,ITPO_XORCPOTION));
	};
	if(Npc_HasItems(Trader,ITPO_XORCPOTION02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_XORCPOTION02,Npc_HasItems(Trader,ITPO_XORCPOTION02));
	};
	if(Npc_HasItems(Trader,ItPo_MegaDrink) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_MegaDrink,Npc_HasItems(Trader,ItPo_MegaDrink));
	};
	if(Npc_HasItems(Trader,ITPO_SOULRIVER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SOULRIVER,Npc_HasItems(Trader,ITPO_SOULRIVER));
	};
	if(Npc_HasItems(Trader,ITPO_POISON) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_POISON,Npc_HasItems(Trader,ITPO_POISON));
	};
	if(Npc_HasItems(Trader,ITPO_BLOODFLYPOISON) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_BLOODFLYPOISON,Npc_HasItems(Trader,ITPO_BLOODFLYPOISON));
	};
	if(Npc_HasItems(Trader,ItMi_NrozasPoison) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NrozasPoison,Npc_HasItems(Trader,ItMi_NrozasPoison));
	};
	if(Npc_HasItems(Trader,ItMi_NrozasPoisonOsair) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NrozasPoisonOsair,Npc_HasItems(Trader,ItMi_NrozasPoisonOsair));
	};
	if(Npc_HasItems(Trader,ItMi_NrozasPoisonHalf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_NrozasPoisonHalf,Npc_HasItems(Trader,ItMi_NrozasPoisonHalf));
	};
	if(Npc_HasItems(Trader,ITPO_ELIGORFIRE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_ELIGORFIRE,Npc_HasItems(Trader,ITPO_ELIGORFIRE));
	};
	if(Npc_HasItems(Trader,ITPO_WATERFIRE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_WATERFIRE,Npc_HasItems(Trader,ITPO_WATERFIRE));
	};
	if(Npc_HasItems(Trader,ITPO_MEGAPOTIONSKILL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_MEGAPOTIONSKILL,Npc_HasItems(Trader,ITPO_MEGAPOTIONSKILL));
	};
	if(Npc_HasItems(Trader,ITPO_SAGITTACLAWPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SAGITTACLAWPOTION,Npc_HasItems(Trader,ITPO_SAGITTACLAWPOTION));
	};
	if(Npc_HasItems(Trader,ITPO_MAGDEFENCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_MAGDEFENCE,Npc_HasItems(Trader,ITPO_MAGDEFENCE));
	};
	if(Npc_HasItems(Trader,ITPO_INTELLECT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_INTELLECT,Npc_HasItems(Trader,ITPO_INTELLECT));
	};
	if(Npc_HasItems(Trader,ItPo_Troll_Stamina) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Troll_Stamina,Npc_HasItems(Trader,ItPo_Troll_Stamina));
	};
	if(Npc_HasItems(Trader,ITPO_SPEED_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SPEED_03,Npc_HasItems(Trader,ITPO_SPEED_03));
	};
	if(Npc_HasItems(Trader,ITPO_FIREDEFENCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_FIREDEFENCE,Npc_HasItems(Trader,ITPO_FIREDEFENCE));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_DEX_DRACONIAN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_DEX_DRACONIAN,Npc_HasItems(Trader,ITPO_PERM_DEX_DRACONIAN));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_STR_ORC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_STR_ORC,Npc_HasItems(Trader,ITPO_PERM_STR_ORC));
	};
	if(Npc_HasItems(Trader,ITPO_FALLDEFENCE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_FALLDEFENCE,Npc_HasItems(Trader,ITPO_FALLDEFENCE));
	};
	if(Npc_HasItems(Trader,ITPO_ANPOIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_ANPOIS,Npc_HasItems(Trader,ITPO_ANPOIS));
	};
	if(Npc_HasItems(Trader,ItPo_UrTrallPotion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_UrTrallPotion,Npc_HasItems(Trader,ItPo_UrTrallPotion));
	};
	if(Npc_HasItems(Trader,ItPo_Memories) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Memories,Npc_HasItems(Trader,ItPo_Memories));
	};
	if(Npc_HasItems(Trader,ITPO_BREATH_OF_DEATH) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_BREATH_OF_DEATH,Npc_HasItems(Trader,ITPO_BREATH_OF_DEATH));
	};
	if(Npc_HasItems(Trader,ITPO_NECROM_POTION_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_NECROM_POTION_01,Npc_HasItems(Trader,ITPO_NECROM_POTION_01));
	};
	if(Npc_HasItems(Trader,ITPO_DEMON_POTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_DEMON_POTION,Npc_HasItems(Trader,ITPO_DEMON_POTION));
	};
	if(Npc_HasItems(Trader,ITPO_DEMON_POTION_BAD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_DEMON_POTION_BAD,Npc_HasItems(Trader,ITPO_DEMON_POTION_BAD));
	};
	if(Npc_HasItems(Trader,ITPO_PERM_DEX_SUPER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_PERM_DEX_SUPER,Npc_HasItems(Trader,ITPO_PERM_DEX_SUPER));
	};
	if(Npc_HasItems(Trader,ITPO_SOULPOTION) > 0)
	{
		Npc_RemoveInvItems(Trader,ITPO_SOULPOTION,Npc_HasItems(Trader,ITPO_SOULPOTION));
	};
	if(Npc_HasItems(Trader,ItPo_ElixirSHadow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_ElixirSHadow,Npc_HasItems(Trader,ItPo_ElixirSHadow));
	};
	if(Npc_HasItems(Trader,ItPo_UndeadShield) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_UndeadShield,Npc_HasItems(Trader,ItPo_UndeadShield));
	};
	if(Npc_HasItems(Trader,ItPo_Addon_Geist_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Addon_Geist_01,Npc_HasItems(Trader,ItPo_Addon_Geist_01));
	};
	if(Npc_HasItems(Trader,ItPo_Addon_Geist_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Addon_Geist_02,Npc_HasItems(Trader,ItPo_Addon_Geist_02));
	};
	if(Npc_HasItems(Trader,ItPo_Health_Addon_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Health_Addon_04,Npc_HasItems(Trader,ItPo_Health_Addon_04));
	};
	if(Npc_HasItems(Trader,ItPo_Mana_Addon_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Mana_Addon_04,Npc_HasItems(Trader,ItPo_Mana_Addon_04));
	};
	if(Npc_HasItems(Trader,ItMi_ArrowTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ArrowTip,Npc_HasItems(Trader,ItMi_ArrowTip));
	};
	if(Npc_HasItems(Trader,ItMi_KerArrowTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerArrowTip,Npc_HasItems(Trader,ItMi_KerArrowTip));
	};
	if(Npc_HasItems(Trader,ItMi_BoltTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BoltTip,Npc_HasItems(Trader,ItMi_BoltTip));
	};
	if(Npc_HasItems(Trader,ItMi_ArrowShaft) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ArrowShaft,Npc_HasItems(Trader,ItMi_ArrowShaft));
	};
	if(Npc_HasItems(Trader,ItMi_BoltShaft) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_BoltShaft,Npc_HasItems(Trader,ItMi_BoltShaft));
	};
	if(Npc_HasItems(Trader,ItRw_Arrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Arrow,Npc_HasItems(Trader,ItRw_Arrow));
	};
	if(Npc_HasItems(Trader,ItRw_PoisonArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_PoisonArrow,Npc_HasItems(Trader,ItRw_PoisonArrow));
	};
	if(Npc_HasItems(Trader,ItRw_HolyArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_HolyArrow,Npc_HasItems(Trader,ItRw_HolyArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_MagicArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_MagicArrow,Npc_HasItems(Trader,ItRw_Addon_MagicArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_FireArrow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_FireArrow,Npc_HasItems(Trader,ItRw_Addon_FireArrow));
	};
	if(Npc_HasItems(Trader,ItRw_Bolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bolt,Npc_HasItems(Trader,ItRw_Bolt));
	};
	if(Npc_HasItems(Trader,ItRw_Addon_MagicBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Addon_MagicBolt,Npc_HasItems(Trader,ItRw_Addon_MagicBolt));
	};
	if(Npc_HasItems(Trader,ItRw_HolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_HolyBolt,Npc_HasItems(Trader,ItRw_HolyBolt));
	};
	if(Npc_HasItems(Trader,ITRW_ZUNTARROW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ZUNTARROW,Npc_HasItems(Trader,ITRW_ZUNTARROW));
	};
	if(Npc_HasItems(Trader,ITRW_MYHUNTARROW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_MYHUNTARROW,Npc_HasItems(Trader,ITRW_MYHUNTARROW));
	};
	if(Npc_HasItems(Trader,ItRw_Ass_2x2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Ass_2x2,Npc_HasItems(Trader,ItRw_Ass_2x2));
	};
	if(Npc_HasItems(Trader,ITRW_ADDON_MAGICBOLT_SHV) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ADDON_MAGICBOLT_SHV,Npc_HasItems(Trader,ITRW_ADDON_MAGICBOLT_SHV));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_01,Npc_HasItems(Trader,ItRw_Bow_L_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_02,Npc_HasItems(Trader,ItRw_Bow_L_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_03,Npc_HasItems(Trader,ItRw_Bow_L_03));
	};
	if(Npc_HasItems(Trader,ITRW_BOSPBOW_L_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOSPBOW_L_03,Npc_HasItems(Trader,ITRW_BOSPBOW_L_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_L_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_04,Npc_HasItems(Trader,ItRw_Bow_L_04));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_01,Npc_HasItems(Trader,ItRw_Bow_M_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_02,Npc_HasItems(Trader,ItRw_Bow_M_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_03,Npc_HasItems(Trader,ItRw_Bow_M_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_M_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_M_04,Npc_HasItems(Trader,ItRw_Bow_M_04));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_01,Npc_HasItems(Trader,ItRw_BowCraft_01));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_02,Npc_HasItems(Trader,ItRw_BowCraft_02));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_03,Npc_HasItems(Trader,ItRw_BowCraft_03));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_04,Npc_HasItems(Trader,ItRw_BowCraft_04));
	};
	if(Npc_HasItems(Trader,ItRw_BowCraft_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BowCraft_05,Npc_HasItems(Trader,ItRw_BowCraft_05));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_01,Npc_HasItems(Trader,ItRw_Bow_H_01));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_02,Npc_HasItems(Trader,ItRw_Bow_H_02));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_03,Npc_HasItems(Trader,ItRw_Bow_H_03));
	};
	if(Npc_HasItems(Trader,ItRw_Bow_H_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_H_04,Npc_HasItems(Trader,ItRw_Bow_H_04));
	};
	if(Npc_HasItems(Trader,ITRW_WHITEBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_WHITEBOW,Npc_HasItems(Trader,ITRW_WHITEBOW));
	};
	if(Npc_HasItems(Trader,ItRw_Sld_Bow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Sld_Bow,Npc_HasItems(Trader,ItRw_Sld_Bow));
	};
	if(Npc_HasItems(Trader,ITRW_DIEGO_BOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_DIEGO_BOW,Npc_HasItems(Trader,ITRW_DIEGO_BOW));
	};
	if(Npc_HasItems(Trader,ItRw_Arabic_Bow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Arabic_Bow,Npc_HasItems(Trader,ItRw_Arabic_Bow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_Light,Npc_HasItems(Trader,ItRw_Crossbow_Light));
	};
	if(Npc_HasItems(Trader,ItRw_Mil_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Mil_Crossbow,Npc_HasItems(Trader,ItRw_Mil_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_BDT_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_BDT_Crossbow,Npc_HasItems(Trader,ItRw_BDT_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_L_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_L_01,Npc_HasItems(Trader,ItRw_Crossbow_L_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_L_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_L_02,Npc_HasItems(Trader,ItRw_Crossbow_L_02));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_M_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_M_01,Npc_HasItems(Trader,ItRw_Crossbow_M_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_M_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_M_02,Npc_HasItems(Trader,ItRw_Crossbow_M_02));
	};
	if(Npc_HasItems(Trader,ItRw_PAL_Crossbow) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_PAL_Crossbow,Npc_HasItems(Trader,ItRw_PAL_Crossbow));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_H_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_H_01,Npc_HasItems(Trader,ItRw_Crossbow_H_01));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_H_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_H_02,Npc_HasItems(Trader,ItRw_Crossbow_H_02));
	};
	if(Npc_HasItems(Trader,ITRW_CROSSBOW_ORC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_CROSSBOW_ORC,Npc_HasItems(Trader,ITRW_CROSSBOW_ORC));
	};
	if(Npc_HasItems(Trader,ITRW_CROSSBOW_ORC_LIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_CROSSBOW_ORC_LIGHT,Npc_HasItems(Trader,ITRW_CROSSBOW_ORC_LIGHT));
	};
	if(Npc_HasItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV,Npc_HasItems(Trader,ITRW_ADDON_MAGICCROSSBOW_SHV));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_01,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_02,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_03,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_04,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_GREATARBALET_ORC_05,Npc_HasItems(Trader,ITRW_GREATARBALET_ORC_05));
	};
	if(Npc_HasItems(Trader,ITRW_BOW_DOUBLE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOW_DOUBLE_01,Npc_HasItems(Trader,ITRW_BOW_DOUBLE_01));
	};
	if(Npc_HasItems(Trader,ITRW_G3_LONG_BOW_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_LONG_BOW_02,Npc_HasItems(Trader,ITRW_G3_LONG_BOW_02));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_KADAT_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_KADAT_BOW_01,Npc_HasItems(Trader,ITRW_KMR_KADAT_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_DARKLONG_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_DARKLONG_BOW_01,Npc_HasItems(Trader,ITRW_KMR_DARKLONG_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_KMR_SHADOWS_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_KMR_SHADOWS_BOW_01,Npc_HasItems(Trader,ITRW_KMR_SHADOWS_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC,Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01_NPC));
	};
	if(Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_SILENTDEATH_BOW_01,Npc_HasItems(Trader,ITRW_G3_SILENTDEATH_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_SHADOWBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_SHADOWBOW,Npc_HasItems(Trader,ITRW_SHADOWBOW));
	};
	if(Npc_HasItems(Trader,ITRW_BOW_BONES) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_BOW_BONES,Npc_HasItems(Trader,ITRW_BOW_BONES));
	};
	if(Npc_HasItems(Trader,ITRW_G4_OAK_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G4_OAK_BOW_01,Npc_HasItems(Trader,ITRW_G4_OAK_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_HOLYBOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_HOLYBOW,Npc_HasItems(Trader,ITRW_HOLYBOW));
	};
	if(Npc_HasItems(Trader,ITRW_G3_DEMON_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_G3_DEMON_BOW_01,Npc_HasItems(Trader,ITRW_G3_DEMON_BOW_01));
	};
	if(Npc_HasItems(Trader,ITRW_HAOS_BOW_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRW_HAOS_BOW_01,Npc_HasItems(Trader,ITRW_HAOS_BOW_01));
	};
	if(Npc_HasItems(Trader,ItRw_Undead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Undead,Npc_HasItems(Trader,ItRw_Undead));
	};
	if(Npc_HasItems(Trader,ItRw_Crossbow_Undead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Crossbow_Undead,Npc_HasItems(Trader,ItRw_Crossbow_Undead));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_01,Npc_HasItems(Trader,ItSl_BackArrowSack_01));
	};	
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_02,Npc_HasItems(Trader,ItSl_BackArrowSack_02));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_04,Npc_HasItems(Trader,ItSl_BackArrowSack_04));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_05,Npc_HasItems(Trader,ItSl_BackArrowSack_05));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_06) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_06,Npc_HasItems(Trader,ItSl_BackArrowSack_06));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_07) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_07,Npc_HasItems(Trader,ItSl_BackArrowSack_07));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_08) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_08,Npc_HasItems(Trader,ItSl_BackArrowSack_08));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_09) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_09,Npc_HasItems(Trader,ItSl_BackArrowSack_09));
	};
	if(Npc_HasItems(Trader,ItSl_BackArrowSack_10) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackArrowSack_10,Npc_HasItems(Trader,ItSl_BackArrowSack_10));
	};
	if(Npc_HasItems(Trader,ItSl_BackBoltSack_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_BackBoltSack_01,Npc_HasItems(Trader,ItSl_BackBoltSack_01));
	};
	if(Npc_HasItems(Trader,ITAM_ORCAMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_ORCAMULET,Npc_HasItems(Trader,ITAM_ORCAMULET));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Fire_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Fire_01,Npc_HasItems(Trader,ItAm_Prot_Fire_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Edge_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Edge_01,Npc_HasItems(Trader,ItAm_Prot_Edge_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Point_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Point_01,Npc_HasItems(Trader,ItAm_Prot_Point_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Mage_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Mage_01,Npc_HasItems(Trader,ItAm_Prot_Mage_01));
	};
	if(Npc_HasItems(Trader,ItAm_Prot_Total_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_Total_01,Npc_HasItems(Trader,ItAm_Prot_Total_01));
	};
	if(Npc_HasItems(Trader,ItAm_Dex_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Dex_01,Npc_HasItems(Trader,ItAm_Dex_01));
	};
	if(Npc_HasItems(Trader,ItAm_Strg_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Strg_01,Npc_HasItems(Trader,ItAm_Strg_01));
	};
	if(Npc_HasItems(Trader,ItAm_Hp_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Hp_01,Npc_HasItems(Trader,ItAm_Hp_01));
	};
	if(Npc_HasItems(Trader,ItAm_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Mana_01,Npc_HasItems(Trader,ItAm_Mana_01));
	};
	if(Npc_HasItems(Trader,ItAm_Dex_Strg_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Dex_Strg_01,Npc_HasItems(Trader,ItAm_Dex_Strg_01));
	};
	if(Npc_HasItems(Trader,ItAm_Hp_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Hp_Mana_01,Npc_HasItems(Trader,ItAm_Hp_Mana_01));
	};
	if(Npc_HasItems(Trader,ITAM_IRDORAT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_IRDORAT,Npc_HasItems(Trader,ITAM_IRDORAT));
	};
	if(Npc_HasItems(Trader,ITAM_BENKENOB) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_BENKENOB,Npc_HasItems(Trader,ITAM_BENKENOB));
	};
	if(Npc_HasItems(Trader,ITAM_ZIGOSMAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_ZIGOSMAGIC,Npc_HasItems(Trader,ITAM_ZIGOSMAGIC));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_Franco) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_Franco,Npc_HasItems(Trader,ItAm_Addon_Franco));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_Health) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_Health,Npc_HasItems(Trader,ItAm_Addon_Health));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_Health_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_Health_01,Npc_HasItems(Trader,ItRi_Addon_Health_01));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_Health_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_Health_02,Npc_HasItems(Trader,ItRi_Addon_Health_02));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_MANA) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_MANA,Npc_HasItems(Trader,ItAm_Addon_MANA));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_MANA_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_MANA_01,Npc_HasItems(Trader,ItRi_Addon_MANA_01));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_MANA_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_MANA_02,Npc_HasItems(Trader,ItRi_Addon_MANA_02));
	};
	if(Npc_HasItems(Trader,ItAm_Addon_STR) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_STR,Npc_HasItems(Trader,ItAm_Addon_STR));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_STR_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_STR_01,Npc_HasItems(Trader,ItRi_Addon_STR_01));
	};
	if(Npc_HasItems(Trader,ItRi_Addon_STR_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_STR_02,Npc_HasItems(Trader,ItRi_Addon_STR_02));
	};
	if(Npc_HasItems(Trader,ItAm_MasiafKey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_MasiafKey,Npc_HasItems(Trader,ItAm_MasiafKey));
	};
	if(Npc_HasItems(Trader,ItKe_Masiaf_Open) > 0)
	{
		Npc_RemoveInvItems(Trader,ItKe_Masiaf_Open,Npc_HasItems(Trader,ItKe_Masiaf_Open));
	};
	if(Npc_HasItems(Trader,ItKe_AniTest) > 0)
	{
		Npc_RemoveInvItems(Trader,ItKe_AniTest,Npc_HasItems(Trader,ItKe_AniTest));
	};
	if(Npc_HasItems(Trader,ItAm_Diamond) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Diamond,Npc_HasItems(Trader,ItAm_Diamond));
	};
	if(Npc_HasItems(Trader,ItAm_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Ruby,Npc_HasItems(Trader,ItAm_Ruby));
	};
	if(Npc_HasItems(Trader,ItAm_Emerald) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Emerald,Npc_HasItems(Trader,ItAm_Emerald));
	};
	if(Npc_HasItems(Trader,ItAm_Sapphire) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Sapphire,Npc_HasItems(Trader,ItAm_Sapphire));
	};
	if(Npc_HasItems(Trader,ItAm_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Opal,Npc_HasItems(Trader,ItAm_Opal));
	};
	if(Npc_HasItems(Trader,ItAm_Topaz) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Topaz,Npc_HasItems(Trader,ItAm_Topaz));
	};
	if(Npc_HasItems(Trader,ITMI_DEADORCITEM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DEADORCITEM,Npc_HasItems(Trader,ITMI_DEADORCITEM));
	};
	if(Npc_HasItems(Trader,ItAm_HashGor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_HashGor,Npc_HasItems(Trader,ItAm_HashGor));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Fire_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Fire_01,Npc_HasItems(Trader,ItRi_Prot_Fire_01));
	};
	if(Npc_HasItems(Trader,ITRI_LANZRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_LANZRING,Npc_HasItems(Trader,ITRI_LANZRING));
	};
	if(Npc_HasItems(Trader,ITRI_TROKARRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_TROKARRING,Npc_HasItems(Trader,ITRI_TROKARRING));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Fire_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Fire_02,Npc_HasItems(Trader,ItRi_Prot_Fire_02));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Fire_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Fire_03,Npc_HasItems(Trader,ItRi_Prot_Fire_03));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Point_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Point_01,Npc_HasItems(Trader,ItRi_Prot_Point_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Point_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Point_02,Npc_HasItems(Trader,ItRi_Prot_Point_02));
	};
	if(Npc_HasItems(Trader,ItRi_Rod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Rod,Npc_HasItems(Trader,ItRi_Rod));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Edge_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Edge_01,Npc_HasItems(Trader,ItRi_Prot_Edge_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Edge_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Edge_02,Npc_HasItems(Trader,ItRi_Prot_Edge_02));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Mage_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Mage_01,Npc_HasItems(Trader,ItRi_Prot_Mage_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Mage_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Mage_02,Npc_HasItems(Trader,ItRi_Prot_Mage_02));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Total_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Total_01,Npc_HasItems(Trader,ItRi_Prot_Total_01));
	};
	if(Npc_HasItems(Trader,ItRi_Prot_Total_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Total_02,Npc_HasItems(Trader,ItRi_Prot_Total_02));
	};
	if(Npc_HasItems(Trader,ItRi_Dex_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Dex_01,Npc_HasItems(Trader,ItRi_Dex_01));
	};
	if(Npc_HasItems(Trader,ItRi_Dex_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Dex_02,Npc_HasItems(Trader,ItRi_Dex_02));
	};
	if(Npc_HasItems(Trader,ItRi_HP_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_HP_01,Npc_HasItems(Trader,ItRi_HP_01));
	};
	if(Npc_HasItems(Trader,ItRi_Hp_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Hp_02,Npc_HasItems(Trader,ItRi_Hp_02));
	};
	if(Npc_HasItems(Trader,ItRi_Str_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Str_01,Npc_HasItems(Trader,ItRi_Str_01));
	};
	if(Npc_HasItems(Trader,ItRi_Str_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Str_02,Npc_HasItems(Trader,ItRi_Str_02));
	};
	if(Npc_HasItems(Trader,ItRi_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Mana_01,Npc_HasItems(Trader,ItRi_Mana_01));
	};
	if(Npc_HasItems(Trader,ItRi_Mana_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Mana_02,Npc_HasItems(Trader,ItRi_Mana_02));
	};
	if(Npc_HasItems(Trader,ItRi_Hp_Mana_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Hp_Mana_01,Npc_HasItems(Trader,ItRi_Hp_Mana_01));
	};
	if(Npc_HasItems(Trader,ItRi_Dex_Strg_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Dex_Strg_01,Npc_HasItems(Trader,ItRi_Dex_Strg_01));
	};
	if(Npc_HasItems(Trader,ITRI_RITUALPLACE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_RITUALPLACE,Npc_HasItems(Trader,ITRI_RITUALPLACE));
	};
	if(Npc_HasItems(Trader,ITRI_XARDASPLACE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_XARDASPLACE,Npc_HasItems(Trader,ITRI_XARDASPLACE));
	};
	if(Npc_HasItems(Trader,ITRI_GUARDIANS_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_GUARDIANS_01,Npc_HasItems(Trader,ITRI_GUARDIANS_01));
	};
	if(Npc_HasItems(Trader,ITRI_GUARDIANS_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_GUARDIANS_02,Npc_HasItems(Trader,ITRI_GUARDIANS_02));
	};
	if(Npc_HasItems(Trader,ITRI_SARAFAMILYRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_SARAFAMILYRING,Npc_HasItems(Trader,ITRI_SARAFAMILYRING));
	};
	if(Npc_HasItems(Trader,ITRI_HAKONMISSRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_HAKONMISSRING,Npc_HasItems(Trader,ITRI_HAKONMISSRING));
	};
	if(Npc_HasItems(Trader,ITRI_PILLIGRIMRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_PILLIGRIMRING,Npc_HasItems(Trader,ITRI_PILLIGRIMRING));
	};
	if(Npc_HasItems(Trader,ITRI_GRITTASRING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_GRITTASRING,Npc_HasItems(Trader,ITRI_GRITTASRING));
	};
	if(Npc_HasItems(Trader,ITRI_VEPR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_VEPR,Npc_HasItems(Trader,ITRI_VEPR));
	};
	if(Npc_HasItems(Trader,ITRI_INNOSJUDGE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_INNOSJUDGE,Npc_HasItems(Trader,ITRI_INNOSJUDGE));
	};
	if(Npc_HasItems(Trader,ITRI_NARUS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_NARUS,Npc_HasItems(Trader,ITRI_NARUS));
	};
	if(Npc_HasItems(Trader,ITRI_UDARGIFT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_UDARGIFT,Npc_HasItems(Trader,ITRI_UDARGIFT));
	};
	if(Npc_HasItems(Trader,ITRI_DEX_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_DEX_03,Npc_HasItems(Trader,ITRI_DEX_03));
	};
	if(Npc_HasItems(Trader,ITRI_FELLANGOR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_FELLANGOR,Npc_HasItems(Trader,ITRI_FELLANGOR));
	};
	if(Npc_HasItems(Trader,ITRI_FELLANGOR_MAGIC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_FELLANGOR_MAGIC,Npc_HasItems(Trader,ITRI_FELLANGOR_MAGIC));
	};
	if(Npc_HasItems(Trader,ItRi_UnknownRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_UnknownRing,Npc_HasItems(Trader,ItRi_UnknownRing));
	};
	if(Npc_HasItems(Trader,ItRi_Teleport_Ring) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Teleport_Ring,Npc_HasItems(Trader,ItRi_Teleport_Ring));
	};
	if(Npc_HasItems(Trader,ITRI_TELEPORT_RING_ADANOS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_TELEPORT_RING_ADANOS,Npc_HasItems(Trader,ITRI_TELEPORT_RING_ADANOS));
	};
	if(Npc_HasItems(Trader,ITRI_TELEPORT_NW_RUINS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_TELEPORT_NW_RUINS,Npc_HasItems(Trader,ITRI_TELEPORT_NW_RUINS));
	};
	if(Npc_HasItems(Trader,ITRI_RING_SLOW) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_RING_SLOW,Npc_HasItems(Trader,ITRI_RING_SLOW));
	};
	if(Npc_HasItems(Trader,ItRi_DragonStaff) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_DragonStaff,Npc_HasItems(Trader,ItRi_DragonStaff));
	};
	if(Npc_HasItems(Trader,ItRi_OreBarons) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_OreBarons,Npc_HasItems(Trader,ItRi_OreBarons));
	};
	if(Npc_HasItems(Trader,ItRi_HuntRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_HuntRing,Npc_HasItems(Trader,ItRi_HuntRing));
	};
	if(Npc_HasItems(Trader,ItRi_FerrosRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_FerrosRing,Npc_HasItems(Trader,ItRi_FerrosRing));
	};
	if(Npc_HasItems(Trader,ItRi_DarkCurse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_DarkCurse,Npc_HasItems(Trader,ItRi_DarkCurse));
	};
	if(Npc_HasItems(Trader,ItRi_Ferd) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ferd,Npc_HasItems(Trader,ItRi_Ferd));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Diam) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Diam,Npc_HasItems(Trader,ItRi_Steel_Diam));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Ruby,Npc_HasItems(Trader,ItRi_Steel_Ruby));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Emer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Emer,Npc_HasItems(Trader,ItRi_Steel_Emer));
	};
	if(Npc_HasItems(Trader,ItRi_Steel_Sapp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Sapp,Npc_HasItems(Trader,ItRi_Steel_Sapp));};
	if(Npc_HasItems(Trader,ItRi_Steel_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Opal,Npc_HasItems(Trader,ItRi_Steel_Opal));};
	if(Npc_HasItems(Trader,ItRi_Steel_Topa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Steel_Topa,Npc_HasItems(Trader,ItRi_Steel_Topa));};
	if(Npc_HasItems(Trader,ItRi_Gold_Diam) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Diam,Npc_HasItems(Trader,ItRi_Gold_Diam));};
	if(Npc_HasItems(Trader,ItRi_Gold_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Ruby,Npc_HasItems(Trader,ItRi_Gold_Ruby));};
	if(Npc_HasItems(Trader,ItRi_Gold_Emer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Emer,Npc_HasItems(Trader,ItRi_Gold_Emer));};
	if(Npc_HasItems(Trader,ItRi_Gold_Sapp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Sapp,Npc_HasItems(Trader,ItRi_Gold_Sapp));};
	if(Npc_HasItems(Trader,ItRi_Gold_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Opal,Npc_HasItems(Trader,ItRi_Gold_Opal));};
	if(Npc_HasItems(Trader,ItRi_Gold_Topa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Gold_Topa,Npc_HasItems(Trader,ItRi_Gold_Topa));};
	if(Npc_HasItems(Trader,ItRi_Ore_Diam) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Diam,Npc_HasItems(Trader,ItRi_Ore_Diam));};
	if(Npc_HasItems(Trader,ItRi_Ore_Ruby) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Ruby,Npc_HasItems(Trader,ItRi_Ore_Ruby));};
	if(Npc_HasItems(Trader,ItRi_Ore_Emer) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Emer,Npc_HasItems(Trader,ItRi_Ore_Emer));};
	if(Npc_HasItems(Trader,ItRi_Ore_Sapp) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Sapp,Npc_HasItems(Trader,ItRi_Ore_Sapp));};
	if(Npc_HasItems(Trader,ItRi_Ore_Opal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Opal,Npc_HasItems(Trader,ItRi_Ore_Opal));};
	if(Npc_HasItems(Trader,ItRi_Ore_Topa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ore_Topa,Npc_HasItems(Trader,ItRi_Ore_Topa));};
	if(Npc_HasItems(Trader,ItRi_Loa) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Loa,Npc_HasItems(Trader,ItRi_Loa));};
	if(Npc_HasItems(Trader,ITRU_TELEPORTDAGOT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TELEPORTDAGOT,Npc_HasItems(Trader,ITRU_TELEPORTDAGOT));};
	if(Npc_HasItems(Trader,ITRU_ORCTELEPORT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_ORCTELEPORT,Npc_HasItems(Trader,ITRU_ORCTELEPORT));};
	if(Npc_HasItems(Trader,ItRu_PalTeleportSecret) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalTeleportSecret,Npc_HasItems(Trader,ItRu_PalTeleportSecret));};
	if(Npc_HasItems(Trader,ItRu_PalLight) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalLight,Npc_HasItems(Trader,ItRu_PalLight));};
	if(Npc_HasItems(Trader,ItRu_PalLightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalLightHeal,Npc_HasItems(Trader,ItRu_PalLightHeal));};
	if(Npc_HasItems(Trader,ItRu_PalMediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalMediumHeal,Npc_HasItems(Trader,ItRu_PalMediumHeal));};
	if(Npc_HasItems(Trader,ItRu_PalFullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalFullHeal,Npc_HasItems(Trader,ItRu_PalFullHeal));};
	if(Npc_HasItems(Trader,ItRu_PalHolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalHolyBolt,Npc_HasItems(Trader,ItRu_PalHolyBolt));};
	if(Npc_HasItems(Trader,ItRu_PalRepelEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalRepelEvil,Npc_HasItems(Trader,ItRu_PalRepelEvil));};
	if(Npc_HasItems(Trader,ItRu_PalDestroyEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalDestroyEvil,Npc_HasItems(Trader,ItRu_PalDestroyEvil));};
	if(Npc_HasItems(Trader,ItRu_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Light,Npc_HasItems(Trader,ItRu_Light));};
	if(Npc_HasItems(Trader,ItRu_Light_Pyr) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Light_Pyr,Npc_HasItems(Trader,ItRu_Light_Pyr));};
	if(Npc_HasItems(Trader,ItRu_LightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_LightHeal,Npc_HasItems(Trader,ItRu_LightHeal));};
	if(Npc_HasItems(Trader,ItRu_FireBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FireBolt,Npc_HasItems(Trader,ItRu_FireBolt));};
	if(Npc_HasItems(Trader,ItRu_Unlock) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Unlock,Npc_HasItems(Trader,ItRu_Unlock));
	};
	if(Npc_HasItems(Trader,ItRu_RapidFirebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_RapidFirebolt,Npc_HasItems(Trader,ItRu_RapidFirebolt));
	};
	if(Npc_HasItems(Trader,ItRu_RapidIcebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_RapidIcebolt,Npc_HasItems(Trader,ItRu_RapidIcebolt));
	};
	if(Npc_HasItems(Trader,ItRu_Rage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Rage,Npc_HasItems(Trader,ItRu_Rage));
	};
	if(Npc_HasItems(Trader,ItRu_Quake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Quake,Npc_HasItems(Trader,ItRu_Quake));
	};
	if(Npc_HasItems(Trader,ItRu_MagicCage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MagicCage,Npc_HasItems(Trader,ItRu_MagicCage));
	};
	if(Npc_HasItems(Trader,ItRu_Lacerate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Lacerate,Npc_HasItems(Trader,ItRu_Lacerate));
	};
	if(Npc_HasItems(Trader,ItRu_Extricate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Extricate,Npc_HasItems(Trader,ItRu_Extricate));
	};
	if(Npc_HasItems(Trader,ItRu_Explosion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Explosion,Npc_HasItems(Trader,ItRu_Explosion));
	};
	if(Npc_HasItems(Trader,ItRu_Elevate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Elevate,Npc_HasItems(Trader,ItRu_Elevate));
	};
	if(Npc_HasItems(Trader,ItRu_AdanosBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_AdanosBall,Npc_HasItems(Trader,ItRu_AdanosBall));
	};
	if(Npc_HasItems(Trader,ItRu_Acid) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Acid,Npc_HasItems(Trader,ItRu_Acid));
	};
	if(Npc_HasItems(Trader,ItRu_Zap) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Zap,Npc_HasItems(Trader,ItRu_Zap));};
	if(Npc_HasItems(Trader,ItRu_Icebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Icebolt,Npc_HasItems(Trader,ItRu_Icebolt));};
	if(Npc_HasItems(Trader,ItRu_Sleep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Sleep,Npc_HasItems(Trader,ItRu_Sleep));};
	if(Npc_HasItems(Trader,ITRU_BERZERK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BERZERK,Npc_HasItems(Trader,ITRU_BERZERK));};
	if(Npc_HasItems(Trader,ItRu_Deathbolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Deathbolt,Npc_HasItems(Trader,ItRu_Deathbolt));};
	if(Npc_HasItems(Trader,ItRu_SumGobSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumGobSkel,Npc_HasItems(Trader,ItRu_SumGobSkel));};
	if(Npc_HasItems(Trader,ItRu_SumWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumWolf,Npc_HasItems(Trader,ItRu_SumWolf));};
	if(Npc_HasItems(Trader,ItRu_MediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MediumHeal,Npc_HasItems(Trader,ItRu_MediumHeal));};
	if(Npc_HasItems(Trader,ItRu_HarmUndead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_HarmUndead,Npc_HasItems(Trader,ItRu_HarmUndead));};
	if(Npc_HasItems(Trader,ItRu_InstantFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_InstantFireball,Npc_HasItems(Trader,ItRu_InstantFireball));};
	if(Npc_HasItems(Trader,ItRu_Icelance) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Icelance,Npc_HasItems(Trader,ItRu_Icelance));};
	if(Npc_HasItems(Trader,ITRU_SUMSHOAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMSHOAL,Npc_HasItems(Trader,ITRU_SUMSHOAL));};
	if(Npc_HasItems(Trader,ItRu_Windfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Windfist,Npc_HasItems(Trader,ItRu_Windfist));};
	if(Npc_HasItems(Trader,ITRU_TELEKINESIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TELEKINESIS,Npc_HasItems(Trader,ITRU_TELEKINESIS));};
	if(Npc_HasItems(Trader,ItRu_GreenTentacle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GreenTentacle,Npc_HasItems(Trader,ItRu_GreenTentacle));};
	if(Npc_HasItems(Trader,ItRu_ManaForLife) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ManaForLife,Npc_HasItems(Trader,ItRu_ManaForLife));};
	if(Npc_HasItems(Trader,ItRu_SummonZombie) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SummonZombie,Npc_HasItems(Trader,ItRu_SummonZombie));};
	if(Npc_HasItems(Trader,ItRu_FullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FullHeal,Npc_HasItems(Trader,ItRu_FullHeal));};
	if(Npc_HasItems(Trader,ItRu_Firestorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Firestorm,Npc_HasItems(Trader,ItRu_Firestorm));};
	if(Npc_HasItems(Trader,ItRu_IceCube) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_IceCube,Npc_HasItems(Trader,ItRu_IceCube));};
	if(Npc_HasItems(Trader,ItRu_ThunderBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ThunderBall,Npc_HasItems(Trader,ItRu_ThunderBall));};
	if(Npc_HasItems(Trader,ItRu_Fear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Fear,Npc_HasItems(Trader,ItRu_Fear));};
	if(Npc_HasItems(Trader,ITRU_CHARM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CHARM,Npc_HasItems(Trader,ITRU_CHARM));};
	if(Npc_HasItems(Trader,ItRu_Swarm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Swarm,Npc_HasItems(Trader,ItRu_Swarm));};
	if(Npc_HasItems(Trader,ItRu_SumSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumSkel,Npc_HasItems(Trader,ItRu_SumSkel));};
	if(Npc_HasItems(Trader,ItRu_BeliarsRage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_BeliarsRage,Npc_HasItems(Trader,ItRu_BeliarsRage));};
	if(Npc_HasItems(Trader,ItRu_SummonGuardian) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SummonGuardian,Npc_HasItems(Trader,ItRu_SummonGuardian));};
	if(Npc_HasItems(Trader,ItRu_SumGol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumGol,Npc_HasItems(Trader,ItRu_SumGol));};
	if(Npc_HasItems(Trader,ITRU_SUMFIREGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMFIREGOL,Npc_HasItems(Trader,ITRU_SUMFIREGOL));};
	if(Npc_HasItems(Trader,ItRu_ChargeFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ChargeFireball,Npc_HasItems(Trader,ItRu_ChargeFireball));};
	if(Npc_HasItems(Trader,ITRU_FIRELIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_FIRELIGHT,Npc_HasItems(Trader,ITRU_FIRELIGHT));};
	if(Npc_HasItems(Trader,ItRu_LightningFlash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_LightningFlash,Npc_HasItems(Trader,ItRu_LightningFlash));};
	if(Npc_HasItems(Trader,ITRU_SUMICEGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMICEGOL,Npc_HasItems(Trader,ITRU_SUMICEGOL));};
	if(Npc_HasItems(Trader,ITRU_SEVEREFETIDITY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SEVEREFETIDITY,Npc_HasItems(Trader,ITRU_SEVEREFETIDITY));};
	if(Npc_HasItems(Trader,ItRu_Whirlwind) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Whirlwind,Npc_HasItems(Trader,ItRu_Whirlwind));};
	if(Npc_HasItems(Trader,ItRu_SumDemon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumDemon,Npc_HasItems(Trader,ItRu_SumDemon));};
	if(Npc_HasItems(Trader,ItRu_Deathball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Deathball,Npc_HasItems(Trader,ItRu_Deathball));};
	if(Npc_HasItems(Trader,ItRu_BreathOfDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_BreathOfDeath,Npc_HasItems(Trader,ItRu_BreathOfDeath));};
	if(Npc_HasItems(Trader,ITRU_ELIGORDEMONS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_ELIGORDEMONS,Npc_HasItems(Trader,ITRU_ELIGORDEMONS));};
	if(Npc_HasItems(Trader,ITRU_BELIARSUPERRUNE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSUPERRUNE,Npc_HasItems(Trader,ITRU_BELIARSUPERRUNE));};
	if(Npc_HasItems(Trader,ItRu_OrcFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_OrcFireball,Npc_HasItems(Trader,ItRu_OrcFireball));};
	if(Npc_HasItems(Trader,ItRu_Pyrokinesis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Pyrokinesis,Npc_HasItems(Trader,ItRu_Pyrokinesis));};
	if(Npc_HasItems(Trader,ItRu_Waterfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Waterfist,Npc_HasItems(Trader,ItRu_Waterfist));};
	if(Npc_HasItems(Trader,ItRu_IceWave) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_IceWave,Npc_HasItems(Trader,ItRu_IceWave));};
	if(Npc_HasItems(Trader,ITRU_CONTROL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CONTROL,Npc_HasItems(Trader,ITRU_CONTROL));};
	if(Npc_HasItems(Trader,ItRu_ArmyOfDarkness) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ArmyOfDarkness,Npc_HasItems(Trader,ItRu_ArmyOfDarkness));};
	if(Npc_HasItems(Trader,ITRU_SUMSWPGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMSWPGOL,Npc_HasItems(Trader,ITRU_SUMSWPGOL));};
	if(Npc_HasItems(Trader,ItRu_Firerain) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Firerain,Npc_HasItems(Trader,ItRu_Firerain));};
	if(Npc_HasItems(Trader,ItRu_FireMeteor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FireMeteor,Npc_HasItems(Trader,ItRu_FireMeteor));};
	if(Npc_HasItems(Trader,ItRu_Geyser) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Geyser,Npc_HasItems(Trader,ItRu_Geyser));};
	if(Npc_HasItems(Trader,ItRu_Thunderstorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Thunderstorm,Npc_HasItems(Trader,ItRu_Thunderstorm));};
	if(Npc_HasItems(Trader,ItRu_MassDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MassDeath,Npc_HasItems(Trader,ItRu_MassDeath));};
	if(Npc_HasItems(Trader,ItRu_Skull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Skull,Npc_HasItems(Trader,ItRu_Skull));};
	if(Npc_HasItems(Trader,ItRu_GuruWrath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GuruWrath,Npc_HasItems(Trader,ItRu_GuruWrath));};
	if(Npc_HasItems(Trader,ItRu_MasterOfDisaster) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MasterOfDisaster,Npc_HasItems(Trader,ItRu_MasterOfDisaster));};
	if(Npc_HasItems(Trader,ItRu_Concussionbolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Concussionbolt,Npc_HasItems(Trader,ItRu_Concussionbolt));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_00,Npc_HasItems(Trader,ITRU_TPLHEAL_00));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_01,Npc_HasItems(Trader,ITRU_TPLHEAL_01));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_02,Npc_HasItems(Trader,ITRU_TPLHEAL_02));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_03,Npc_HasItems(Trader,ITRU_TPLHEAL_03));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_00,Npc_HasItems(Trader,ITRU_TPLSTRIKE_00));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_01,Npc_HasItems(Trader,ITRU_TPLSTRIKE_01));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_02,Npc_HasItems(Trader,ITRU_TPLSTRIKE_02));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_03,Npc_HasItems(Trader,ITRU_TPLSTRIKE_03));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE01,Npc_HasItems(Trader,ITRU_BELIARSRUNE01));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE02,Npc_HasItems(Trader,ITRU_BELIARSRUNE02));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE03,Npc_HasItems(Trader,ITRU_BELIARSRUNE03));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE04,Npc_HasItems(Trader,ITRU_BELIARSRUNE04));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE05,Npc_HasItems(Trader,ITRU_BELIARSRUNE05));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE06) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE06,Npc_HasItems(Trader,ITRU_BELIARSRUNE06));};
	if(Npc_HasItems(Trader,ITRU_MORAULARTU) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_MORAULARTU,Npc_HasItems(Trader,ITRU_MORAULARTU));};
	if(Npc_HasItems(Trader,ITRU_CRESTELEMENTS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CRESTELEMENTS,Npc_HasItems(Trader,ITRU_CRESTELEMENTS));};
	if(Npc_HasItems(Trader,ItRu_PyroRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PyroRune,Npc_HasItems(Trader,ItRu_PyroRune));};
	if(Npc_HasItems(Trader,ITRU_DESTROYGUARDIANS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_DESTROYGUARDIANS,Npc_HasItems(Trader,ITRU_DESTROYGUARDIANS));};
	if(Npc_HasItems(Trader,ITRU_SUMTREANT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMTREANT,Npc_HasItems(Trader,ITRU_SUMTREANT));};
	if(Npc_HasItems(Trader,ItRu_EligorSummon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_EligorSummon,Npc_HasItems(Trader,ItRu_EligorSummon));};
	if(Npc_HasItems(Trader,ItRu_TrfBloodFly) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfBloodFly,Npc_HasItems(Trader,ItRu_TrfBloodFly));};
	if(Npc_HasItems(Trader,ItRu_TrfFireWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfFireWaran,Npc_HasItems(Trader,ItRu_TrfFireWaran));};
	if(Npc_HasItems(Trader,ItRu_TrfWarg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfWarg,Npc_HasItems(Trader,ItRu_TrfWarg));};
	if(Npc_HasItems(Trader,ItRu_TrfShadowbeast) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfShadowbeast,Npc_HasItems(Trader,ItRu_TrfShadowbeast));};
	if(Npc_HasItems(Trader,ItRu_TrfDragonSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfDragonSnapper,Npc_HasItems(Trader,ItRu_TrfDragonSnapper));};
	if(Npc_HasItems(Trader,ItRu_TrfTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfTroll,Npc_HasItems(Trader,ItRu_TrfTroll));};
	if(Npc_HasItems(Trader,ItRu_ShadowMount) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ShadowMount,Npc_HasItems(Trader,ItRu_ShadowMount));};
	if(Npc_HasItems(Trader,ItRu_GlobalTeleport) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GlobalTeleport,Npc_HasItems(Trader,ItRu_GlobalTeleport));};
	if(Npc_HasItems(Trader,ItSc_PalLight) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalLight,Npc_HasItems(Trader,ItSc_PalLight));};
	if(Npc_HasItems(Trader,ItSc_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Light,Npc_HasItems(Trader,ItSc_Light));};
	if(Npc_HasItems(Trader,ItSc_PalLightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalLightHeal,Npc_HasItems(Trader,ItSc_PalLightHeal));};
	if(Npc_HasItems(Trader,ItSc_PalHolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalHolyBolt,Npc_HasItems(Trader,ItSc_PalHolyBolt));};
	if(Npc_HasItems(Trader,ItSc_PalMediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalMediumHeal,Npc_HasItems(Trader,ItSc_PalMediumHeal));};
	if(Npc_HasItems(Trader,ItSc_PalRepelEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalRepelEvil,Npc_HasItems(Trader,ItSc_PalRepelEvil));};
	if(Npc_HasItems(Trader,ItSc_PalFullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalFullHeal,Npc_HasItems(Trader,ItSc_PalFullHeal));};
	if(Npc_HasItems(Trader,ItSc_PalDestroyEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_PalDestroyEvil,Npc_HasItems(Trader,ItSc_PalDestroyEvil));};
	if(Npc_HasItems(Trader,ItSc_LightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_LightHeal,Npc_HasItems(Trader,ItSc_LightHeal));};
	if(Npc_HasItems(Trader,ItSc_SumWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumWolf,Npc_HasItems(Trader,ItSc_SumWolf));};
	if(Npc_HasItems(Trader,ItSc_MediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_MediumHeal,Npc_HasItems(Trader,ItSc_MediumHeal));};
	if(Npc_HasItems(Trader,ItSc_HarmUndead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_HarmUndead,Npc_HasItems(Trader,ItSc_HarmUndead));};
	if(Npc_HasItems(Trader,ItSc_FullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_FullHeal,Npc_HasItems(Trader,ItSc_FullHeal));};
	if(Npc_HasItems(Trader,ItSc_Shrink) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Shrink,Npc_HasItems(Trader,ItSc_Shrink));};
	if(Npc_HasItems(Trader,ItSc_Firebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Firebolt,Npc_HasItems(Trader,ItSc_Firebolt));};
	if(Npc_HasItems(Trader,ItSc_Unlock) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Unlock,Npc_HasItems(Trader,ItSc_Unlock));
	};
	if(Npc_HasItems(Trader,ItSc_RapidFirebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_RapidFirebolt,Npc_HasItems(Trader,ItSc_RapidFirebolt));
	};
	if(Npc_HasItems(Trader,ItSc_RapidIcebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_RapidIcebolt,Npc_HasItems(Trader,ItSc_RapidIcebolt));
	};
	if(Npc_HasItems(Trader,ItSc_Rage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Rage,Npc_HasItems(Trader,ItSc_Rage));
	};
	if(Npc_HasItems(Trader,ItSc_Quake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Quake,Npc_HasItems(Trader,ItSc_Quake));
	};
	if(Npc_HasItems(Trader,ItSc_MagicCage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_MagicCage,Npc_HasItems(Trader,ItSc_MagicCage));
	};
	if(Npc_HasItems(Trader,ItSc_Lacerate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Lacerate,Npc_HasItems(Trader,ItSc_Lacerate));
	};
	if(Npc_HasItems(Trader,ItSc_Extricate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Extricate,Npc_HasItems(Trader,ItSc_Extricate));
	};
	if(Npc_HasItems(Trader,ItSc_Explosion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Explosion,Npc_HasItems(Trader,ItSc_Explosion));
	};
	if(Npc_HasItems(Trader,ItSc_Elevate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Elevate,Npc_HasItems(Trader,ItSc_Elevate));
	};
	if(Npc_HasItems(Trader,ItSc_AdanosBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_AdanosBall,Npc_HasItems(Trader,ItSc_AdanosBall));
	};
	if(Npc_HasItems(Trader,ItSc_Acid) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Acid,Npc_HasItems(Trader,ItSc_Acid));
	};
	if(Npc_HasItems(Trader,ItSc_InstantFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_InstantFireball,Npc_HasItems(Trader,ItSc_InstantFireball));};
	if(Npc_HasItems(Trader,ItSc_Firestorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Firestorm,Npc_HasItems(Trader,ItSc_Firestorm));};
	if(Npc_HasItems(Trader,ItSc_ChargeFireBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_ChargeFireBall,Npc_HasItems(Trader,ItSc_ChargeFireBall));};
	if(Npc_HasItems(Trader,ItSc_Pyrokinesis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Pyrokinesis,Npc_HasItems(Trader,ItSc_Pyrokinesis));};
	if(Npc_HasItems(Trader,ItSc_Firerain) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Firerain,Npc_HasItems(Trader,ItSc_Firerain));};
	if(Npc_HasItems(Trader,ItSc_Zap) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Zap,Npc_HasItems(Trader,ItSc_Zap));};
	if(Npc_HasItems(Trader,ItSc_Icelance) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Icelance,Npc_HasItems(Trader,ItSc_Icelance));};
	if(Npc_HasItems(Trader,ItSc_Icebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Icebolt,Npc_HasItems(Trader,ItSc_Icebolt));};
	if(Npc_HasItems(Trader,ItSc_IceCube) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_IceCube,Npc_HasItems(Trader,ItSc_IceCube));};
	if(Npc_HasItems(Trader,ItSc_ThunderBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_ThunderBall,Npc_HasItems(Trader,ItSc_ThunderBall));};
	if(Npc_HasItems(Trader,ITSC_SUMSHOAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMSHOAL,Npc_HasItems(Trader,ITSC_SUMSHOAL));};
	if(Npc_HasItems(Trader,ItSc_Waterfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Waterfist,Npc_HasItems(Trader,ItSc_Waterfist));};
	if(Npc_HasItems(Trader,ItSc_LightningFlash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_LightningFlash,Npc_HasItems(Trader,ItSc_LightningFlash));};
	if(Npc_HasItems(Trader,ItSc_IceWave) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_IceWave,Npc_HasItems(Trader,ItSc_IceWave));};
	if(Npc_HasItems(Trader,ItSc_Geyser) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Geyser,Npc_HasItems(Trader,ItSc_Geyser));};
	if(Npc_HasItems(Trader,ItSc_Thunderstorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Thunderstorm,Npc_HasItems(Trader,ItSc_Thunderstorm));};
	if(Npc_HasItems(Trader,ItSc_Sleep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Sleep,Npc_HasItems(Trader,ItSc_Sleep));};
	if(Npc_HasItems(Trader,ITSC_BERZERK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_BERZERK,Npc_HasItems(Trader,ITSC_BERZERK));};
	if(Npc_HasItems(Trader,ItSc_Windfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Windfist,Npc_HasItems(Trader,ItSc_Windfist));};
	if(Npc_HasItems(Trader,ItSc_Charm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Charm,Npc_HasItems(Trader,ItSc_Charm));};
	if(Npc_HasItems(Trader,ItSc_Fear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Fear,Npc_HasItems(Trader,ItSc_Fear));};
	if(Npc_HasItems(Trader,ITSC_GREENTENTACLE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_GREENTENTACLE,Npc_HasItems(Trader,ITSC_GREENTENTACLE));};
	if(Npc_HasItems(Trader,ITSC_SEVEREFETIDITY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SEVEREFETIDITY,Npc_HasItems(Trader,ITSC_SEVEREFETIDITY));};
	if(Npc_HasItems(Trader,ItSc_Whirlwind) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Whirlwind,Npc_HasItems(Trader,ItSc_Whirlwind));};
	if(Npc_HasItems(Trader,ItSc_SumGobSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumGobSkel,Npc_HasItems(Trader,ItSc_SumGobSkel));};
	if(Npc_HasItems(Trader,ItSc_SumSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumSkel,Npc_HasItems(Trader,ItSc_SumSkel));};
	if(Npc_HasItems(Trader,ItSc_SumDemon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumDemon,Npc_HasItems(Trader,ItSc_SumDemon));};
	if(Npc_HasItems(Trader,ItSc_ArmyOfDarkness) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_ArmyOfDarkness,Npc_HasItems(Trader,ItSc_ArmyOfDarkness));};
	if(Npc_HasItems(Trader,ITSC_DEATHBOLT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_DEATHBOLT,Npc_HasItems(Trader,ITSC_DEATHBOLT));};
	if(Npc_HasItems(Trader,ITSC_ManaForLife) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_ManaForLife,Npc_HasItems(Trader,ITSC_ManaForLife));};
	if(Npc_HasItems(Trader,ITSC_SUMZOMBIE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMZOMBIE,Npc_HasItems(Trader,ITSC_SUMZOMBIE));};
	if(Npc_HasItems(Trader,ITSC_SWARM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SWARM,Npc_HasItems(Trader,ITSC_SWARM));};
	if(Npc_HasItems(Trader,ITSC_ENERGYBALL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_ENERGYBALL,Npc_HasItems(Trader,ITSC_ENERGYBALL));};
	if(Npc_HasItems(Trader,ITSC_DEATHBALL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_DEATHBALL,Npc_HasItems(Trader,ITSC_DEATHBALL));};
	if(Npc_HasItems(Trader,ItSc_MassDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_MassDeath,Npc_HasItems(Trader,ItSc_MassDeath));};
	if(Npc_HasItems(Trader,ITSC_SKULL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SKULL,Npc_HasItems(Trader,ITSC_SKULL));};
	if(Npc_HasItems(Trader,ItSc_TrfSheep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfSheep,Npc_HasItems(Trader,ItSc_TrfSheep));};
	if(Npc_HasItems(Trader,ItSc_TrfScavenger) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfScavenger,Npc_HasItems(Trader,ItSc_TrfScavenger));};
	if(Npc_HasItems(Trader,ItSc_TrfGiantBug) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfGiantBug,Npc_HasItems(Trader,ItSc_TrfGiantBug));};
	if(Npc_HasItems(Trader,ItSc_TrfWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfWolf,Npc_HasItems(Trader,ItSc_TrfWolf));};
	if(Npc_HasItems(Trader,ItSc_TrfWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfWaran,Npc_HasItems(Trader,ItSc_TrfWaran));};
	if(Npc_HasItems(Trader,ItSc_TrfSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfSnapper,Npc_HasItems(Trader,ItSc_TrfSnapper));};
	if(Npc_HasItems(Trader,ItSc_TrfWarg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfWarg,Npc_HasItems(Trader,ItSc_TrfWarg));};
	if(Npc_HasItems(Trader,ItSc_TrfFireWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfFireWaran,Npc_HasItems(Trader,ItSc_TrfFireWaran));};
	if(Npc_HasItems(Trader,ItSc_TrfLurker) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfLurker,Npc_HasItems(Trader,ItSc_TrfLurker));};
	if(Npc_HasItems(Trader,ItSc_TrfShadowbeast) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfShadowbeast,Npc_HasItems(Trader,ItSc_TrfShadowbeast));};
	if(Npc_HasItems(Trader,ItSc_TrfDragonSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfDragonSnapper,Npc_HasItems(Trader,ItSc_TrfDragonSnapper));};
	if(Npc_HasItems(Trader,ItSc_TrfMeatBug) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_TrfMeatBug,Npc_HasItems(Trader,ItSc_TrfMeatBug));};
	if(Npc_HasItems(Trader,ItSc_BreathOfDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_BreathOfDeath,Npc_HasItems(Trader,ItSc_BreathOfDeath));};
	if(Npc_HasItems(Trader,ItSc_SumGol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_SumGol,Npc_HasItems(Trader,ItSc_SumGol));};
	if(Npc_HasItems(Trader,ITSC_SUMFIREGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMFIREGOL,Npc_HasItems(Trader,ITSC_SUMFIREGOL));};
	if(Npc_HasItems(Trader,ITSC_SUMICEGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMICEGOL,Npc_HasItems(Trader,ITSC_SUMICEGOL));};
	if(Npc_HasItems(Trader,ITSC_SUMSWPGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSC_SUMSWPGOL,Npc_HasItems(Trader,ITSC_SUMSWPGOL));};
	if(Npc_HasItems(Trader,ItSc_Ressurect) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_Ressurect,Npc_HasItems(Trader,ItSc_Ressurect));};
	if(Npc_HasItems(Trader,ItMi_Addon_Shell_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Shell_01,Npc_HasItems(Trader,ItMi_Addon_Shell_01));};
	if(Npc_HasItems(Trader,ItMi_Addon_Shell_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Shell_02,Npc_HasItems(Trader,ItMi_Addon_Shell_02));};
	if(Npc_HasItems(Trader,ItSe_ErzFisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_ErzFisch,Npc_HasItems(Trader,ItSe_ErzFisch));};
	if(Npc_HasItems(Trader,ItSe_GoldFisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldFisch,Npc_HasItems(Trader,ItSe_GoldFisch));};
	if(Npc_HasItems(Trader,ItSe_Ringfisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Ringfisch,Npc_HasItems(Trader,ItSe_Ringfisch));};
	if(Npc_HasItems(Trader,ItSe_LockpickFisch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_LockpickFisch,Npc_HasItems(Trader,ItSe_LockpickFisch));};
	if(Npc_HasItems(Trader,ItMi_PocketFingers) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PocketFingers,Npc_HasItems(Trader,ItMi_PocketFingers));};
	if(Npc_HasItems(Trader,ItMi_VatrasPurse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_VatrasPurse,Npc_HasItems(Trader,ItMi_VatrasPurse));};
	if(Npc_HasItems(Trader,ItMi_HaniarPurse) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HaniarPurse,Npc_HasItems(Trader,ItMi_HaniarPurse));};
	if(Npc_HasItems(Trader,ItMi_PurseOsair) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PurseOsair,Npc_HasItems(Trader,ItMi_PurseOsair));};
	if(Npc_HasItems(Trader,ItSe_GoldPocket25) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldPocket25,Npc_HasItems(Trader,ItSe_GoldPocket25));};
	if(Npc_HasItems(Trader,ITSE_LANZPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_LANZPOCKET,Npc_HasItems(Trader,ITSE_LANZPOCKET));};
	if(Npc_HasItems(Trader,ItSe_GoldPocket50) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldPocket50,Npc_HasItems(Trader,ItSe_GoldPocket50));};
	if(Npc_HasItems(Trader,ItSe_GoldPocket100) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GoldPocket100,Npc_HasItems(Trader,ItSe_GoldPocket100));};
	if(Npc_HasItems(Trader,ITSE_GERBRANDPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_GERBRANDPOCKET,Npc_HasItems(Trader,ITSE_GERBRANDPOCKET));};
	if(Npc_HasItems(Trader,ITSE_NIGELPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_NIGELPOCKET,Npc_HasItems(Trader,ITSE_NIGELPOCKET));};
	if(Npc_HasItems(Trader,ITSE_TALIASANPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_TALIASANPOCKET,Npc_HasItems(Trader,ITSE_TALIASANPOCKET));};
	if(Npc_HasItems(Trader,ItSe_HannasBeutel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_HannasBeutel,Npc_HasItems(Trader,ItSe_HannasBeutel));};
	if(Npc_HasItems(Trader,ITSE_LUTTEROBIGPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITSE_LUTTEROBIGPOCKET,Npc_HasItems(Trader,ITSE_LUTTEROBIGPOCKET));};
	if(Npc_HasItems(Trader,ItSe_Weapon_Sack) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Weapon_Sack,Npc_HasItems(Trader,ItSe_Weapon_Sack));};
	if(Npc_HasItems(Trader,ItSe_Arrow_Sack) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Arrow_Sack,Npc_HasItems(Trader,ItSe_Arrow_Sack));};
	if(Npc_HasItems(Trader,ItSe_GOLDSTACK) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_GOLDSTACK,Npc_HasItems(Trader,ItSe_GOLDSTACK));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket,Npc_HasItems(Trader,ItSl_GoldPocket));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Woman,Npc_HasItems(Trader,ItSl_GoldPocket_Woman));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Woman_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Woman_New,Npc_HasItems(Trader,ItSl_GoldPocket_Woman_New));};
	if(Npc_HasItems(Trader,ItSl_HeroBags) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_HeroBags,Npc_HasItems(Trader,ItSl_HeroBags));};
	if(Npc_HasItems(Trader,ItSl_CraitBag) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_CraitBag,Npc_HasItems(Trader,ItSl_CraitBag));};
	if(Npc_HasItems(Trader,ItSl_HeroPocket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_HeroPocket,Npc_HasItems(Trader,ItSl_HeroPocket));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_None) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_None,Npc_HasItems(Trader,ItSl_GoldPocket_None));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Low) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Low,Npc_HasItems(Trader,ItSl_GoldPocket_Low));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Medium) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Medium,Npc_HasItems(Trader,ItSl_GoldPocket_Medium));};
	if(Npc_HasItems(Trader,ItSl_GoldPocket_Full) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSl_GoldPocket_Full,Npc_HasItems(Trader,ItSl_GoldPocket_Full));};
	if(Npc_HasItems(Trader,Itar_Avabul_Wings) > 0)
	{
		Npc_RemoveInvItems(Trader,Itar_Avabul_Wings,Npc_HasItems(Trader,Itar_Avabul_Wings));};
	if(Npc_HasItems(Trader,Itar_Ghost_Candle) > 0)
	{
		Npc_RemoveInvItems(Trader,Itar_Ghost_Candle,Npc_HasItems(Trader,Itar_Ghost_Candle));};
	if(Npc_HasItems(Trader,ITMI_GHOST_TORCH_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_GHOST_TORCH_01,Npc_HasItems(Trader,ITMI_GHOST_TORCH_01));};
	if(Npc_HasItems(Trader,ItWr_StrStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StrStonePlate1_Addon,Npc_HasItems(Trader,ItWr_StrStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_StrStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StrStonePlate2_Addon,Npc_HasItems(Trader,ItWr_StrStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_StrStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StrStonePlate3_Addon,Npc_HasItems(Trader,ItWr_StrStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_DexStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexStonePlate1_Addon,Npc_HasItems(Trader,ItWr_DexStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_DexStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexStonePlate2_Addon,Npc_HasItems(Trader,ItWr_DexStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_DexStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexStonePlate3_Addon,Npc_HasItems(Trader,ItWr_DexStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_HitPointStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HitPointStonePlate1_Addon,Npc_HasItems(Trader,ItWr_HitPointStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_HitPointStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HitPointStonePlate2_Addon,Npc_HasItems(Trader,ItWr_HitPointStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_HitPointStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HitPointStonePlate3_Addon,Npc_HasItems(Trader,ItWr_HitPointStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_ManaStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaStonePlate1_Addon,Npc_HasItems(Trader,ItWr_ManaStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_ManaStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaStonePlate2_Addon,Npc_HasItems(Trader,ItWr_ManaStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_ManaStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaStonePlate3_Addon,Npc_HasItems(Trader,ItWr_ManaStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_OneHStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OneHStonePlate1_Addon,Npc_HasItems(Trader,ItWr_OneHStonePlate1_Addon));};
		if(Npc_HasItems(Trader,ItWr_OneHStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OneHStonePlate2_Addon,Npc_HasItems(Trader,ItWr_OneHStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_OneHStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_OneHStonePlate3_Addon,Npc_HasItems(Trader,ItWr_OneHStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_TwoHStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_TwoHStonePlate1_Addon,Npc_HasItems(Trader,ItWr_TwoHStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_TwoHStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_TwoHStonePlate2_Addon,Npc_HasItems(Trader,ItWr_TwoHStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_TwoHStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_TwoHStonePlate3_Addon,Npc_HasItems(Trader,ItWr_TwoHStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_BowStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BowStonePlate1_Addon,Npc_HasItems(Trader,ItWr_BowStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_BowStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BowStonePlate2_Addon,Npc_HasItems(Trader,ItWr_BowStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_BowStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BowStonePlate3_Addon,Npc_HasItems(Trader,ItWr_BowStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ItWr_CrsBowStonePlate1_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CrsBowStonePlate1_Addon,Npc_HasItems(Trader,ItWr_CrsBowStonePlate1_Addon));};
	if(Npc_HasItems(Trader,ItWr_CrsBowStonePlate2_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CrsBowStonePlate2_Addon,Npc_HasItems(Trader,ItWr_CrsBowStonePlate2_Addon));};
	if(Npc_HasItems(Trader,ItWr_CrsBowStonePlate3_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CrsBowStonePlate3_Addon,Npc_HasItems(Trader,ItWr_CrsBowStonePlate3_Addon));};
	if(Npc_HasItems(Trader,ITWR_STAMINAPOINTSTONEPLATE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_STAMINAPOINTSTONEPLATE,Npc_HasItems(Trader,ITWR_STAMINAPOINTSTONEPLATE));};
	if(Npc_HasItems(Trader,ItLsTorch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorch,Npc_HasItems(Trader,ItLsTorch));};
	if(Npc_HasItems(Trader,ItLsTorchburning) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorchburning,Npc_HasItems(Trader,ItLsTorchburning));};
	if(Npc_HasItems(Trader,ItLsTorchburned) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorchburned,Npc_HasItems(Trader,ItLsTorchburned));};
	if(Npc_HasItems(Trader,ItLsTorchFirespit) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsTorchFirespit,Npc_HasItems(Trader,ItLsTorchFirespit));};
	if(Npc_HasItems(Trader,ItLsFireTorch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItLsFireTorch,Npc_HasItems(Trader,ItLsFireTorch));};
	if(Npc_HasItems(Trader,ItWr_Canthars_KomproBrief_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(Trader,ItWr_Canthars_KomproBrief_MIS));};
	if(Npc_HasItems(Trader,ItMw_2h_Rod) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Rod,Npc_HasItems(Trader,ItMw_2h_Rod));};
	if(Npc_HasItems(Trader,ItMw_2h_Rod_Fake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_2h_Rod_Fake,Npc_HasItems(Trader,ItMw_2h_Rod_Fake));};
	if(Npc_HasItems(Trader,ItMi_CoragonsSilber) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_CoragonsSilber,Npc_HasItems(Trader,ItMi_CoragonsSilber));};
	if(Npc_HasItems(Trader,ItMi_TheklasPaket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TheklasPaket,Npc_HasItems(Trader,ItMi_TheklasPaket));};
	if(Npc_HasItems(Trader,ItMi_MariasGoldPlate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MariasGoldPlate,Npc_HasItems(Trader,ItMi_MariasGoldPlate));};
	if(Npc_HasItems(Trader,ItRi_ValentinosRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_ValentinosRing,Npc_HasItems(Trader,ItRi_ValentinosRing));};
	if(Npc_HasItems(Trader,ItWr_Kraeuterliste) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Kraeuterliste,Npc_HasItems(Trader,ItWr_Kraeuterliste));};
	if(Npc_HasItems(Trader,ItWr_ManaRezept) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ManaRezept,Npc_HasItems(Trader,ItWr_ManaRezept));};
	if(Npc_HasItems(Trader,ItWr_Passierschein) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Passierschein,Npc_HasItems(Trader,ItWr_Passierschein));};
	if(Npc_HasItems(Trader,ItMi_HerbPaket) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_HerbPaket,Npc_HasItems(Trader,ItMi_HerbPaket));};
	if(Npc_HasItems(Trader,ItMi_JointPacket_OW) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_JointPacket_OW,Npc_HasItems(Trader,ItMi_JointPacket_OW));};
	if(Npc_HasItems(Trader,ITMI_DROGENPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DROGENPOCKET,Npc_HasItems(Trader,ITMI_DROGENPOCKET));};
	if(Npc_HasItems(Trader,ITMI_LARIUSGOLDPOCKET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_LARIUSGOLDPOCKET,Npc_HasItems(Trader,ITMI_LARIUSGOLDPOCKET));};
	if(Npc_HasItems(Trader,ItFo_SmellyFish) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_SmellyFish,Npc_HasItems(Trader,ItFo_SmellyFish));};
	if(Npc_HasItems(Trader,ItFo_HalvorFish_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_HalvorFish_MIS,Npc_HasItems(Trader,ItFo_HalvorFish_MIS));};
	if(Npc_HasItems(Trader,ItWr_HalvorMessage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HalvorMessage,Npc_HasItems(Trader,ItWr_HalvorMessage));};
	if(Npc_HasItems(Trader,ItWr_DexterOrder) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexterOrder,Npc_HasItems(Trader,ItWr_DexterOrder));};
	if(Npc_HasItems(Trader,ItWr_DexTrait) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DexTrait,Npc_HasItems(Trader,ItWr_DexTrait));};
	if(Npc_HasItems(Trader,ItMw_AlriksSword_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_AlriksSword_Mis,Npc_HasItems(Trader,ItMw_AlriksSword_Mis));};
	if(Npc_HasItems(Trader,ItWr_VatrasMessage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VatrasMessage,Npc_HasItems(Trader,ItWr_VatrasMessage));};
	if(Npc_HasItems(Trader,ItWr_VatrasMessage_Open) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VatrasMessage_Open,Npc_HasItems(Trader,ItWr_VatrasMessage_Open));};
	if(Npc_HasItems(Trader,ItFo_Schafswurst) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Schafswurst,Npc_HasItems(Trader,ItFo_Schafswurst));};
	if(Npc_HasItems(Trader,ItPo_Perm_LittleMana) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_Perm_LittleMana,Npc_HasItems(Trader,ItPo_Perm_LittleMana));};
	if(Npc_HasItems(Trader,ItWr_Passage_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Passage_MIS,Npc_HasItems(Trader,ItWr_Passage_MIS));};
	if(Npc_HasItems(Trader,ItWr_BanditLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BanditLetter_MIS,Npc_HasItems(Trader,ItWr_BanditLetter_MIS));};
	if(Npc_HasItems(Trader,ItWr_Poster_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Poster_MIS,Npc_HasItems(Trader,ItWr_Poster_MIS));};
	if(Npc_HasItems(Trader,ItRw_Bow_L_03_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_Bow_L_03_MIS,Npc_HasItems(Trader,ItRw_Bow_L_03_MIS));};
	if(Npc_HasItems(Trader,ItRi_Prot_Point_01_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Prot_Point_01_MIS,Npc_HasItems(Trader,ItRi_Prot_Point_01_MIS));};
	if(Npc_HasItems(Trader,ItMi_EddasStatue) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_EddasStatue,Npc_HasItems(Trader,ItMi_EddasStatue));};
	if(Npc_HasItems(Trader,ItWr_Schuldenbuch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Schuldenbuch,Npc_HasItems(Trader,ItWr_Schuldenbuch));};
	if(Npc_HasItems(Trader,ItPl_Xagitta_Herb_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPl_Xagitta_Herb_MIS,Npc_HasItems(Trader,ItPl_Xagitta_Herb_MIS));};
	if(Npc_HasItems(Trader,ItRw_DragomirsArmbrust_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_DragomirsArmbrust_MIS,Npc_HasItems(Trader,ItRw_DragomirsArmbrust_MIS));};
	if(Npc_HasItems(Trader,Holy_Hammer_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,Holy_Hammer_MIS,Npc_HasItems(Trader,Holy_Hammer_MIS));};
	if(Npc_HasItems(Trader,HOLY_HAMMER_MIS_NEW) > 0)
	{
		Npc_RemoveInvItems(Trader,HOLY_HAMMER_MIS_NEW,Npc_HasItems(Trader,HOLY_HAMMER_MIS_NEW));};
	if(Npc_HasItems(Trader,ITRI_QUEST_PAL_RING) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRI_QUEST_PAL_RING,Npc_HasItems(Trader,ITRI_QUEST_PAL_RING));};
	if(Npc_HasItems(Trader,ITWR_HOLGER_LETTER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_HOLGER_LETTER,Npc_HasItems(Trader,ITWR_HOLGER_LETTER));};
	if(Npc_HasItems(Trader,ITMI_DARON_SUMA) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_DARON_SUMA,Npc_HasItems(Trader,ITMI_DARON_SUMA));};
	if(Npc_HasItems(Trader,ITAM_HOLGER_AMULET) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAM_HOLGER_AMULET,Npc_HasItems(Trader,ITAM_HOLGER_AMULET));};
	if(Npc_HasItems(Trader,ItMi_StoneOfKnowlegde_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_StoneOfKnowlegde_MIS,Npc_HasItems(Trader,ItMi_StoneOfKnowlegde_MIS));};
	if(Npc_HasItems(Trader,ItMi_ParlanRelic_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_ParlanRelic_MIS,Npc_HasItems(Trader,ItMi_ParlanRelic_MIS));};
	if(Npc_HasItems(Trader,ItWr_PaladinLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_PaladinLetter_MIS,Npc_HasItems(Trader,ItWr_PaladinLetter_MIS));};
	if(Npc_HasItems(Trader,ItWr_LetterForGorn_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LetterForGorn_MIS,Npc_HasItems(Trader,ItWr_LetterForGorn_MIS));};
	if(Npc_HasItems(Trader,ItMi_GornsTreasure_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GornsTreasure_MIS,Npc_HasItems(Trader,ItMi_GornsTreasure_MIS));};
	if(Npc_HasItems(Trader,ItWr_Silvestro_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Silvestro_MIS,Npc_HasItems(Trader,ItWr_Silvestro_MIS));};
	if(Npc_HasItems(Trader,ItAt_ClawLeader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_ClawLeader,Npc_HasItems(Trader,ItAt_ClawLeader));};
	if(Npc_HasItems(Trader,ITAT_CLAWBLACKSNAPPER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_CLAWBLACKSNAPPER,Npc_HasItems(Trader,ITAT_CLAWBLACKSNAPPER));};
	if(Npc_HasItems(Trader,ITAT_VEPRFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_VEPRFUR,Npc_HasItems(Trader,ITAT_VEPRFUR));};
	if(Npc_HasItems(Trader,ITAT_NIGHTHUNTERFUR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_NIGHTHUNTERFUR,Npc_HasItems(Trader,ITAT_NIGHTHUNTERFUR));};
	if(Npc_HasItems(Trader,ITAT_LUKEREGG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITAT_LUKEREGG,Npc_HasItems(Trader,ITAT_LUKEREGG));};
	if(Npc_HasItems(Trader,ItSe_Olav) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Olav,Npc_HasItems(Trader,ItSe_Olav));};
	if(Npc_HasItems(Trader,ItMi_Plate_MISGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Plate_MISGold,Npc_HasItems(Trader,ItMi_Plate_MISGold));};
	if(Npc_HasItems(Trader,ItWr_Bloody_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Bloody_MIS,Npc_HasItems(Trader,ItWr_Bloody_MIS));};
	if(Npc_HasItems(Trader,ItWr_Pfandbrief_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Pfandbrief_MIS,Npc_HasItems(Trader,ItWr_Pfandbrief_MIS));};
	if(Npc_HasItems(Trader,ITWR_LUTEROLOAN) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_LUTEROLOAN,Npc_HasItems(Trader,ITWR_LUTEROLOAN));};
	if(Npc_HasItems(Trader,ITWR_MAP_OLDWORLD_OREMINES_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_OLDWORLD_OREMINES_MIS_1,Npc_HasItems(Trader,ITWR_MAP_OLDWORLD_OREMINES_MIS_1));};
	if(Npc_HasItems(Trader,ItWr_Manowar) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Manowar,Npc_HasItems(Trader,ItWr_Manowar));};
	if(Npc_HasItems(Trader,ItWr_KDWLetter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_KDWLetter,Npc_HasItems(Trader,ItWr_KDWLetter));};
	if(Npc_HasItems(Trader,ItWr_GilbertLetter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_GilbertLetter,Npc_HasItems(Trader,ItWr_GilbertLetter));};
	if(Npc_HasItems(Trader,ItRi_Tengron) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Tengron,Npc_HasItems(Trader,ItRi_Tengron));};
	if(Npc_HasItems(Trader,ItWr_Diofant_Paper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Diofant_Paper,Npc_HasItems(Trader,ItWr_Diofant_Paper));};
	if(Npc_HasItems(Trader,ItWr_LukasLetter) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LukasLetter,Npc_HasItems(Trader,ItWr_LukasLetter));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_MIS,Npc_HasItems(Trader,ItMi_InnosEye_MIS));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_Bad) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_Bad,Npc_HasItems(Trader,ItMi_InnosEye_Bad));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_Discharged_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_Discharged_Mis,Npc_HasItems(Trader,ItMi_InnosEye_Discharged_Mis));};
	if(Npc_HasItems(Trader,ItMi_InnosEye_Broken_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_InnosEye_Broken_Mis,Npc_HasItems(Trader,ItMi_InnosEye_Broken_Mis));};
	if(Npc_HasItems(Trader,ItWr_PermissionToWearInnosEye_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_PermissionToWearInnosEye_MIS,Npc_HasItems(Trader,ItWr_PermissionToWearInnosEye_MIS));};
	if(Npc_HasItems(Trader,ItWr_XardasBookForPyrokar_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasBookForPyrokar_Mis,Npc_HasItems(Trader,ItWr_XardasBookForPyrokar_Mis));};
	if(Npc_HasItems(Trader,ItWr_CorneliusTagebuch_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_CorneliusTagebuch_Mis,Npc_HasItems(Trader,ItWr_CorneliusTagebuch_Mis));};
	if(Npc_HasItems(Trader,ITWR_DementorObsessionBook_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DementorObsessionBook_MIS,Npc_HasItems(Trader,ITWR_DementorObsessionBook_MIS));};
	if(Npc_HasItems(Trader,ItWr_PyrokarsObsessionList) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_PyrokarsObsessionList,Npc_HasItems(Trader,ItWr_PyrokarsObsessionList));};
	if(Npc_HasItems(Trader,ItPo_HealHilda_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_HealHilda_MIS,Npc_HasItems(Trader,ItPo_HealHilda_MIS));};
	if(Npc_HasItems(Trader,ItMw_MalethsGehstock_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMw_MalethsGehstock_MIS,Npc_HasItems(Trader,ItMw_MalethsGehstock_MIS));};
	if(Npc_HasItems(Trader,ItMi_MalethsBanditGold) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MalethsBanditGold,Npc_HasItems(Trader,ItMi_MalethsBanditGold));};
	if(Npc_HasItems(Trader,ItMi_Moleratlubric_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Moleratlubric_MIS,Npc_HasItems(Trader,ItMi_Moleratlubric_MIS));};
	if(Npc_HasItems(Trader,ItWr_BabosLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BabosLetter_MIS,Npc_HasItems(Trader,ItWr_BabosLetter_MIS));};
	if(Npc_HasItems(Trader,ItWr_BabosPinUp_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BabosPinUp_MIS,Npc_HasItems(Trader,ItWr_BabosPinUp_MIS));};
	if(Npc_HasItems(Trader,ItWr_BabosDocs_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_BabosDocs_MIS,Npc_HasItems(Trader,ItWr_BabosDocs_MIS));};
	if(Npc_HasItems(Trader,ItWr_Astronomy_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Astronomy_Mis,Npc_HasItems(Trader,ItWr_Astronomy_Mis));};
	if(Npc_HasItems(Trader,ItPo_HealObsession_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_HealObsession_MIS,Npc_HasItems(Trader,ItPo_HealObsession_MIS));};
	if(Npc_HasItems(Trader,ItSe_Golemchest_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_Golemchest_Mis,Npc_HasItems(Trader,ItSe_Golemchest_Mis));};
	if(Npc_HasItems(Trader,ITWR_SHATTEREDGOLEM_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_SHATTEREDGOLEM_MIS_1,Npc_HasItems(Trader,ITWR_SHATTEREDGOLEM_MIS_1));};
	if(Npc_HasItems(Trader,ItWr_DiegosLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_DiegosLetter_MIS,Npc_HasItems(Trader,ItWr_DiegosLetter_MIS));};
	if(Npc_HasItems(Trader,ItSe_DiegosTreasure_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_DiegosTreasure_Mis,Npc_HasItems(Trader,ItSe_DiegosTreasure_Mis));};
	if(Npc_HasItems(Trader,ItMi_UltharsHolyWater_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UltharsHolyWater_Mis,Npc_HasItems(Trader,ItMi_UltharsHolyWater_Mis));};
	if(Npc_HasItems(Trader,ItWr_MinenAnteil_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_MinenAnteil_Mis,Npc_HasItems(Trader,ItWr_MinenAnteil_Mis));};
	if(Npc_HasItems(Trader,ItAm_Prot_BlackEye_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Prot_BlackEye_Mis,Npc_HasItems(Trader,ItAm_Prot_BlackEye_Mis));};
	if(Npc_HasItems(Trader,ItMi_KarrasBlessedStone_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KarrasBlessedStone_Mis,Npc_HasItems(Trader,ItMi_KarrasBlessedStone_Mis));};
	if(Npc_HasItems(Trader,ItWr_RichterKomproBrief_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_RichterKomproBrief_MIS,Npc_HasItems(Trader,ItWr_RichterKomproBrief_MIS));};
	if(Npc_HasItems(Trader,ItWr_MorgahardTip) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_MorgahardTip,Npc_HasItems(Trader,ItWr_MorgahardTip));};
	if(Npc_HasItems(Trader,ITWR_MAP_SHRINE_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_SHRINE_MIS_1,Npc_HasItems(Trader,ITWR_MAP_SHRINE_MIS_1));};
	if(Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VinosKellergeister_Mis,Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis));};
	if(Npc_HasItems(Trader,ITWR_DEATH1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH1,Npc_HasItems(Trader,ITWR_DEATH1));};
	if(Npc_HasItems(Trader,ITWR_DEATH2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH2,Npc_HasItems(Trader,ITWR_DEATH2));};
	if(Npc_HasItems(Trader,ItAm_Mana_Angar_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Mana_Angar_MIS,Npc_HasItems(Trader,ItAm_Mana_Angar_MIS));};
	if(Npc_HasItems(Trader,ItMW_1H_FerrosSword_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMW_1H_FerrosSword_Mis,Npc_HasItems(Trader,ItMW_1H_FerrosSword_Mis));};
	if(Npc_HasItems(Trader,ItMi_KerolothsGeldbeutel_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerolothsGeldbeutel_MIS,Npc_HasItems(Trader,ItMi_KerolothsGeldbeutel_MIS));};
	if(Npc_HasItems(Trader,ItMi_KerolothsGeldbeutelLeer_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_KerolothsGeldbeutelLeer_MIS,Npc_HasItems(Trader,ItMi_KerolothsGeldbeutelLeer_MIS));};
	if(Npc_HasItems(Trader,ItRw_SengrathsArmbrust_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRw_SengrathsArmbrust_MIS,Npc_HasItems(Trader,ItRw_SengrathsArmbrust_MIS));};
	if(Npc_HasItems(Trader,ItAt_TalbinsLurkerSkin) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_TalbinsLurkerSkin,Npc_HasItems(Trader,ItAt_TalbinsLurkerSkin));};
	if(Npc_HasItems(Trader,ItAt_DragonEgg_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAt_DragonEgg_MIS,Npc_HasItems(Trader,ItAt_DragonEgg_MIS));};
	if(Npc_HasItems(Trader,ItRi_OrcEliteRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_OrcEliteRing,Npc_HasItems(Trader,ItRi_OrcEliteRing));};
	if(Npc_HasItems(Trader,ItPo_DragonEggDrinkNeoras_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_DragonEggDrinkNeoras_MIS,Npc_HasItems(Trader,ItPo_DragonEggDrinkNeoras_MIS));};
	if(Npc_HasItems(Trader,ITWR_MAP_ORCELITE_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_ORCELITE_MIS_1,Npc_HasItems(Trader,ITWR_MAP_ORCELITE_MIS_1));};
	if(Npc_HasItems(Trader,ITWR_MAP_CAVES_MIS_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_CAVES_MIS_1,Npc_HasItems(Trader,ITWR_MAP_CAVES_MIS_1));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT1,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT1));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT2,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT2));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT3,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT3));};
	if(Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ROCKCRYSTAL_OT4,Npc_HasItems(Trader,ITMI_ROCKCRYSTAL_OT4));};
	if(Npc_HasItems(Trader,ItRi_Ulf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ulf,Npc_HasItems(Trader,ItRi_Ulf));};
	if(Npc_HasItems(Trader,ItWr_XardasLetterToOpenBook_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasLetterToOpenBook_MIS,Npc_HasItems(Trader,ItWr_XardasLetterToOpenBook_MIS));};
	if(Npc_HasItems(Trader,ItWr_HallsofIrdorath_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HallsofIrdorath_Mis,Npc_HasItems(Trader,ItWr_HallsofIrdorath_Mis));};
	if(Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HallsofIrdorath_Open_Mis,Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis));};
	if(Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasSeamapBook_Mis,Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis));};
	if(Npc_HasItems(Trader,ItWr_UseLampIdiot_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_UseLampIdiot_Mis,Npc_HasItems(Trader,ItWr_UseLampIdiot_Mis));};
	if(Npc_HasItems(Trader,ItWr_Seamap_Irdorath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Seamap_Irdorath,Npc_HasItems(Trader,ItWr_Seamap_Irdorath));};
	if(Npc_HasItems(Trader,ITMI_SEAMAPLOSTISLAND) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_SEAMAPLOSTISLAND,Npc_HasItems(Trader,ITMI_SEAMAPLOSTISLAND));};
	if(Npc_HasItems(Trader,ITWr_ForgedShipLetter_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWr_ForgedShipLetter_MIS,Npc_HasItems(Trader,ITWr_ForgedShipLetter_MIS));};
	if(Npc_HasItems(Trader,ItPo_PotionOfDeath_01_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_PotionOfDeath_01_Mis,Npc_HasItems(Trader,ItPo_PotionOfDeath_01_Mis));};
	if(Npc_HasItems(Trader,ItPo_PotionOfDeath_02_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_PotionOfDeath_02_Mis,Npc_HasItems(Trader,ItPo_PotionOfDeath_02_Mis));};
	if(Npc_HasItems(Trader,ItAm_AmulettOfDeath_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_AmulettOfDeath_Mis,Npc_HasItems(Trader,ItAm_AmulettOfDeath_Mis));};
	if(Npc_HasItems(Trader,ItPo_HealRandolph_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItPo_HealRandolph_MIS,Npc_HasItems(Trader,ItPo_HealRandolph_MIS));};
	if(Npc_HasItems(Trader,ItSe_XardasNotfallBeutel_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSe_XardasNotfallBeutel_MIS,Npc_HasItems(Trader,ItSe_XardasNotfallBeutel_MIS));};
	if(Npc_HasItems(Trader,ItWr_XardasErmahnungFuerIdioten_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasErmahnungFuerIdioten_MIS,Npc_HasItems(Trader,ItWr_XardasErmahnungFuerIdioten_MIS));};
	if(Npc_HasItems(Trader,ItWr_Krypta_Garon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Krypta_Garon,Npc_HasItems(Trader,ItWr_Krypta_Garon));};
	if(Npc_HasItems(Trader,ItWr_LastDoorToUndeadDrgDI_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LastDoorToUndeadDrgDI_MIS,Npc_HasItems(Trader,ItWr_LastDoorToUndeadDrgDI_MIS));};
	if(Npc_HasItems(Trader,ItWr_Rezept_MegaDrink_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Rezept_MegaDrink_MIS,Npc_HasItems(Trader,ItWr_Rezept_MegaDrink_MIS));};
	if(Npc_HasItems(Trader,ItWr_Diary_BlackNovice_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Diary_BlackNovice_MIS,Npc_HasItems(Trader,ItWr_Diary_BlackNovice_MIS));};
	if(Npc_HasItems(Trader,ItWr_ZugBruecke_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ZugBruecke_MIS,Npc_HasItems(Trader,ItWr_ZugBruecke_MIS));};
	if(Npc_HasItems(Trader,ItMi_PowerEye) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PowerEye,Npc_HasItems(Trader,ItMi_PowerEye));};
	if(Npc_HasItems(Trader,ITMI_PRISONSOUL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PRISONSOUL,Npc_HasItems(Trader,ITMI_PRISONSOUL));};
	if(Npc_HasItems(Trader,ITMI_PRISONSOUL_AWAKE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_PRISONSOUL_AWAKE,Npc_HasItems(Trader,ITMI_PRISONSOUL_AWAKE));};
	if(Npc_HasItems(Trader,ITMI_ORCBLOOD) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_ORCBLOOD,Npc_HasItems(Trader,ITMI_ORCBLOOD));};
	if(Npc_HasItems(Trader,ITMI_BARLOKHEART) > 0)
	{
		Npc_RemoveInvItems(Trader,ITMI_BARLOKHEART,Npc_HasItems(Trader,ITMI_BARLOKHEART));};
	if(Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon_Sealed) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_SaturasFirstMessage_Addon_Sealed,Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon_Sealed));};
	if(Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_SaturasFirstMessage_Addon,Npc_HasItems(Trader,ItWr_SaturasFirstMessage_Addon));};
	if(Npc_HasItems(Trader,ItMi_Ornament_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Ornament_Addon,Npc_HasItems(Trader,ItMi_Ornament_Addon));};
	if(Npc_HasItems(Trader,ItMi_Ornament_Addon_Vatras) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Ornament_Addon_Vatras,Npc_HasItems(Trader,ItMi_Ornament_Addon_Vatras));};
	if(Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1,Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1));};
	if(Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_DEXTER_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MAP_NEWWORLD_DEXTER_1,Npc_HasItems(Trader,ITWR_MAP_NEWWORLD_DEXTER_1));};
	if(Npc_HasItems(Trader,ItRi_Ranger_Lares_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ranger_Lares_Addon,Npc_HasItems(Trader,ItRi_Ranger_Lares_Addon));};
	if(Npc_HasItems(Trader,ItRi_Ranger_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Ranger_Addon,Npc_HasItems(Trader,ItRi_Ranger_Addon));};
	if(Npc_HasItems(Trader,ItRi_LanceRing) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_LanceRing,Npc_HasItems(Trader,ItRi_LanceRing));};
	if(Npc_HasItems(Trader,ItMi_PortalRing_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_PortalRing_Addon,Npc_HasItems(Trader,ItMi_PortalRing_Addon));};
	if(Npc_HasItems(Trader,ItWr_Martin_MilizEmpfehlung_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Martin_MilizEmpfehlung_Addon,Npc_HasItems(Trader,ItWr_Martin_MilizEmpfehlung_Addon));};
	if(Npc_HasItems(Trader,ItWr_RavensKidnapperMission_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_RavensKidnapperMission_Addon,Npc_HasItems(Trader,ItWr_RavensKidnapperMission_Addon));};
	if(Npc_HasItems(Trader,ItWr_Vatras_KDFEmpfehlung_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Vatras_KDFEmpfehlung_Addon,Npc_HasItems(Trader,ItWr_Vatras_KDFEmpfehlung_Addon));};
	if(Npc_HasItems(Trader,ItMi_LostInnosStatue_Daron) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_LostInnosStatue_Daron,Npc_HasItems(Trader,ItMi_LostInnosStatue_Daron));};
	if(Npc_HasItems(Trader,ItMi_GoblinnosStatue_Daron_New) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_GoblinnosStatue_Daron_New,Npc_HasItems(Trader,ItMi_GoblinnosStatue_Daron_New));};
	if(Npc_HasItems(Trader,ItWr_LuciasLoveLetter_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_LuciasLoveLetter_Addon,Npc_HasItems(Trader,ItWr_LuciasLoveLetter_Addon));};
	if(Npc_HasItems(Trader,ItMi_Rake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Rake,Npc_HasItems(Trader,ItMi_Rake));};
	if(Npc_HasItems(Trader,ItRi_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_BanditTrader,Npc_HasItems(Trader,ItRi_Addon_BanditTrader));};
	if(Npc_HasItems(Trader,ItWr_Addon_BanditTrader) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Addon_BanditTrader,Npc_HasItems(Trader,ItWr_Addon_BanditTrader));};
	if(Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven));};
	if(Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven_opened) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(Trader,ItWr_Vatras2Saturas_FindRaven_opened));};
	if(Npc_HasItems(Trader,ItAm_Addon_WispDetector) > 0)
	{
		Npc_RemoveInvItems(Trader,ItAm_Addon_WispDetector,Npc_HasItems(Trader,ItAm_Addon_WispDetector));};
	if(Npc_HasItems(Trader,ItFo_Addon_Krokofleisch_Mission) > 0)
	{
		Npc_RemoveInvItems(Trader,ItFo_Addon_Krokofleisch_Mission,Npc_HasItems(Trader,ItFo_Addon_Krokofleisch_Mission));};
	if(Npc_HasItems(Trader,ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRi_Addon_MorgansRing_Mission,Npc_HasItems(Trader,ItRi_Addon_MorgansRing_Mission));};
	if(Npc_HasItems(Trader,FakeUnitor) > 0)
	{
		Npc_RemoveInvItems(Trader,FakeUnitor,Npc_HasItems(Trader,FakeUnitor));};
	if(Npc_HasItems(Trader,ItMi_Focus) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Focus,Npc_HasItems(Trader,ItMi_Focus));};
	if(Npc_HasItems(Trader,ItMi_UnSharp_MagicCrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_UnSharp_MagicCrystal,Npc_HasItems(Trader,ItMi_UnSharp_MagicCrystal));};
	if(Npc_HasItems(Trader,ItMi_MagicCrystal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_MagicCrystal,Npc_HasItems(Trader,ItMi_MagicCrystal));};
	if(Npc_HasItems(Trader,ItWr_StonePlateCommon_Addon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_StonePlateCommon_Addon,Npc_HasItems(Trader,ItWr_StonePlateCommon_Addon));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_01,Npc_HasItems(Trader,ItMi_Addon_Stone_01));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_05) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_05,Npc_HasItems(Trader,ItMi_Addon_Stone_05));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_03,Npc_HasItems(Trader,ItMi_Addon_Stone_03));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_04) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_04,Npc_HasItems(Trader,ItMi_Addon_Stone_04));};
	if(Npc_HasItems(Trader,ItMi_Addon_Stone_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Stone_02,Npc_HasItems(Trader,ItMi_Addon_Stone_02));};
	if(Npc_HasItems(Trader,ItMI_Addon_Kompass_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMI_Addon_Kompass_Mis,Npc_HasItems(Trader,ItMI_Addon_Kompass_Mis));};
	if(Npc_HasItems(Trader,ItSE_Addon_FrancisChest) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSE_Addon_FrancisChest,Npc_HasItems(Trader,ItSE_Addon_FrancisChest));};
	if(Npc_HasItems(Trader,ITWR_Addon_FrancisAbrechnung_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_Addon_FrancisAbrechnung_Mis,Npc_HasItems(Trader,ITWR_Addon_FrancisAbrechnung_Mis));};
	if(Npc_HasItems(Trader,ITWR_Addon_GregsLogbuch_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_Addon_GregsLogbuch_Mis,Npc_HasItems(Trader,ITWR_Addon_GregsLogbuch_Mis));};
	if(Npc_HasItems(Trader,ItMi_TempelTorKey) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_TempelTorKey,Npc_HasItems(Trader,ItMi_TempelTorKey));};
	if(Npc_HasItems(Trader,ItMi_Addon_Masiafadept_Kopf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_Masiafadept_Kopf,Npc_HasItems(Trader,ItMi_Addon_Masiafadept_Kopf));};
	if(Npc_HasItems(Trader,ITWR_ADDON_TREASUREMAP_1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_ADDON_TREASUREMAP_1,Npc_HasItems(Trader,ITWR_ADDON_TREASUREMAP_1));};
	if(Npc_HasItems(Trader,ItMi_Addon_GregsTreasureBottle_MIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ItMi_Addon_GregsTreasureBottle_MIS,Npc_HasItems(Trader,ItMi_Addon_GregsTreasureBottle_MIS));};
	if(Npc_HasItems(Trader,itmi_erolskelch) > 0)
	{
		Npc_RemoveInvItems(Trader,itmi_erolskelch,Npc_HasItems(Trader,itmi_erolskelch));};
	if(Npc_HasItems(Trader,ItSc_OrcHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItSc_OrcHeal,Npc_HasItems(Trader,ItSc_OrcHeal));};
	if(Npc_HasItems(Trader,ItKe_OrcGonez) > 0)
	{
		Npc_RemoveInvItems(Trader,ItKe_OrcGonez,Npc_HasItems(Trader,ItKe_OrcGonez));};
	if(Npc_HasItems(Trader,ItWr_AboutNagDumgar_P1) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AboutNagDumgar_P1,Npc_HasItems(Trader,ItWr_AboutNagDumgar_P1));};
	if(Npc_HasItems(Trader,ItWr_AboutNagDumgar_P2) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AboutNagDumgar_P2,Npc_HasItems(Trader,ItWr_AboutNagDumgar_P2));};
	if(Npc_HasItems(Trader,ItWr_AboutNagDumgar_P3) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_AboutNagDumgar_P3,Npc_HasItems(Trader,ItWr_AboutNagDumgar_P3));};
	if(Npc_HasItems(Trader,ITWR_CBOW_T1) > 0)
	{
	Npc_RemoveInvItems(Trader,ITWR_CBOW_T1,Npc_HasItems(Trader,ITWR_CBOW_T1));};
	if(Npc_HasItems(Trader,ITWR_CBOW_T2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_CBOW_T2,Npc_HasItems(Trader,ITWR_CBOW_T2));};
	if(Npc_HasItems(Trader,ItWr_EinhandBuch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_EinhandBuch,Npc_HasItems(Trader,ItWr_EinhandBuch));};
	if(Npc_HasItems(Trader,ItWr_ZweihandBuch) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_ZweihandBuch,Npc_HasItems(Trader,ItWr_ZweihandBuch));};
	if(Npc_HasItems(Trader,ASTRONOMIE) > 0)
	{
		Npc_RemoveInvItems(Trader,ASTRONOMIE,Npc_HasItems(Trader,ASTRONOMIE));};
	if(Npc_HasItems(Trader,ITWR_DEMONLANG) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEMONLANG,Npc_HasItems(Trader,ITWR_DEMONLANG));};
	if(Npc_HasItems(Trader,LEHREN_DER_GOETTER1) > 0)
	{
		Npc_RemoveInvItems(Trader,LEHREN_DER_GOETTER1,Npc_HasItems(Trader,LEHREN_DER_GOETTER1));};
	if(Npc_HasItems(Trader,LEHREN_DER_GOETTER2) > 0)
	{
		Npc_RemoveInvItems(Trader,LEHREN_DER_GOETTER2,Npc_HasItems(Trader,LEHREN_DER_GOETTER2));};
	if(Npc_HasItems(Trader,LEHREN_DER_GOETTER3) > 0)
	{
		Npc_RemoveInvItems(Trader,LEHREN_DER_GOETTER3,Npc_HasItems(Trader,LEHREN_DER_GOETTER3));};
	if(Npc_HasItems(Trader,DAS_MAGISCHE_ERZ) > 0)
	{
		Npc_RemoveInvItems(Trader,DAS_MAGISCHE_ERZ,Npc_HasItems(Trader,DAS_MAGISCHE_ERZ));};
	if(Npc_HasItems(Trader,SCHLACHT_UM_VARANT1) > 0)
	{
		Npc_RemoveInvItems(Trader,SCHLACHT_UM_VARANT1,Npc_HasItems(Trader,SCHLACHT_UM_VARANT1));};
	if(Npc_HasItems(Trader,SCHLACHT_UM_VARANT2) > 0)
	{
		Npc_RemoveInvItems(Trader,SCHLACHT_UM_VARANT2,Npc_HasItems(Trader,SCHLACHT_UM_VARANT2));};
	if(Npc_HasItems(Trader,ITWR_SOULRIVER) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_SOULRIVER,Npc_HasItems(Trader,ITWR_SOULRIVER));};
	if(Npc_HasItems(Trader,ITWR_AZGOLOR) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_AZGOLOR,Npc_HasItems(Trader,ITWR_AZGOLOR));};
	if(Npc_HasItems(Trader,ITWR_INNOSPRAY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_INNOSPRAY,Npc_HasItems(Trader,ITWR_INNOSPRAY));};
	if(Npc_HasItems(Trader,ITWR_MANIAC) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_MANIAC,Npc_HasItems(Trader,ITWR_MANIAC));};
	if(Npc_HasItems(Trader,ITWR_KAMPFKUNST) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_KAMPFKUNST,Npc_HasItems(Trader,ITWR_KAMPFKUNST));};
	if(Npc_HasItems(Trader,ITWR_ELEMENTAREARCANEI) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_ELEMENTAREARCANEI,Npc_HasItems(Trader,ITWR_ELEMENTAREARCANEI));};
	if(Npc_HasItems(Trader,ITWR_JAGD_UND_BEUTE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_JAGD_UND_BEUTE,Npc_HasItems(Trader,ITWR_JAGD_UND_BEUTE));};
	if(Npc_HasItems(Trader,MYRTANAS_LYRIK) > 0)
	{
		Npc_RemoveInvItems(Trader,MYRTANAS_LYRIK,Npc_HasItems(Trader,MYRTANAS_LYRIK));};
	if(Npc_HasItems(Trader,WAHRE_MACHT) > 0)
	{
		Npc_RemoveInvItems(Trader,WAHRE_MACHT,Npc_HasItems(Trader,WAHRE_MACHT));};
	if(Npc_HasItems(Trader,MACHTVOLLE_KUNST) > 0)
	{
		Npc_RemoveInvItems(Trader,MACHTVOLLE_KUNST,Npc_HasItems(Trader,MACHTVOLLE_KUNST));};
	if(Npc_HasItems(Trader,GOETTERGABE) > 0)
	{
		Npc_RemoveInvItems(Trader,GOETTERGABE,Npc_HasItems(Trader,GOETTERGABE));};
	if(Npc_HasItems(Trader,GEHEIMNISSE_DER_ZAUBEREI) > 0)
	{
		Npc_RemoveInvItems(Trader,GEHEIMNISSE_DER_ZAUBEREI,Npc_HasItems(Trader,GEHEIMNISSE_DER_ZAUBEREI));};
	if(Npc_HasItems(Trader,ITWR_UMSONST_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_UMSONST_01,Npc_HasItems(Trader,ITWR_UMSONST_01));};
	if(Npc_HasItems(Trader,ITWR_ANCIENT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_ANCIENT,Npc_HasItems(Trader,ITWR_ANCIENT));};
	if(Npc_HasItems(Trader,ITWR_DRAGONTALE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DRAGONTALE,Npc_HasItems(Trader,ITWR_DRAGONTALE));};
	if(Npc_HasItems(Trader,ITWR_DRAGONTALE_2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DRAGONTALE_2,Npc_HasItems(Trader,ITWR_DRAGONTALE_2));};
	if(Npc_HasItems(Trader,ITWR_DEMONTALE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEMONTALE,Npc_HasItems(Trader,ITWR_DEMONTALE));};
	if(Npc_HasItems(Trader,ITWR_SKELETONTALE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_SKELETONTALE,Npc_HasItems(Trader,ITWR_SKELETONTALE));};
	if(Npc_HasItems(Trader,ITWR_GOLEMBOOK1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_GOLEMBOOK1,Npc_HasItems(Trader,ITWR_GOLEMBOOK1));};
	if(Npc_HasItems(Trader,ITWR_GOLEMBOOK2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_GOLEMBOOK2,Npc_HasItems(Trader,ITWR_GOLEMBOOK2));};
	if(Npc_HasItems(Trader,ELEMENTARE_ARCANEI) > 0)
	{
		Npc_RemoveInvItems(Trader,ELEMENTARE_ARCANEI,Npc_HasItems(Trader,ELEMENTARE_ARCANEI));};
	if(Npc_HasItems(Trader,ItWr_MonasterySecret) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_MonasterySecret,Npc_HasItems(Trader,ItWr_MonasterySecret));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK1,Npc_HasItems(Trader,ITWR_OLDBOOK1));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK2,Npc_HasItems(Trader,ITWR_OLDBOOK2));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK3) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK3,Npc_HasItems(Trader,ITWR_OLDBOOK3));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK4) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK4,Npc_HasItems(Trader,ITWR_OLDBOOK4));};
	if(Npc_HasItems(Trader,ITWR_OLDBOOK5) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_OLDBOOK5,Npc_HasItems(Trader,ITWR_OLDBOOK5));};
	if(Npc_HasItems(Trader,ItWr_Astronomy_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Astronomy_Mis,Npc_HasItems(Trader,ItWr_Astronomy_Mis));};
	if(Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_VinosKellergeister_Mis,Npc_HasItems(Trader,ItWr_VinosKellergeister_Mis));};
	if(Npc_HasItems(Trader,ITWR_DEATH1) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH1,Npc_HasItems(Trader,ITWR_DEATH1));};
	if(Npc_HasItems(Trader,ITWR_DEATH2) > 0)
	{
		Npc_RemoveInvItems(Trader,ITWR_DEATH2,Npc_HasItems(Trader,ITWR_DEATH2));};
	if(Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_HallsofIrdorath_Open_Mis,Npc_HasItems(Trader,ItWr_HallsofIrdorath_Open_Mis));};
	if(Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_XardasSeamapBook_Mis,Npc_HasItems(Trader,ItWr_XardasSeamapBook_Mis));};
	if(Npc_HasItems(Trader,ItWr_Alchemy_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Alchemy_01,Npc_HasItems(Trader,ItWr_Alchemy_01));
	};
	if(Npc_HasItems(Trader,ItWr_Druid_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ItWr_Druid_01,Npc_HasItems(Trader,ItWr_Druid_01));
	};

	if(Trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(Trader);
	};

	Trader.aivar[AIV_ChapterInv] = Kapitel - 1;
};

func void B_ClearDeadTrader_Runes(var C_Npc Trader)
{
	if(Npc_HasItems(Trader,ITRU_TELEPORTDAGOT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TELEPORTDAGOT,Npc_HasItems(Trader,ITRU_TELEPORTDAGOT));};
	if(Npc_HasItems(Trader,ITRU_ORCTELEPORT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_ORCTELEPORT,Npc_HasItems(Trader,ITRU_ORCTELEPORT));};
	if(Npc_HasItems(Trader,ItRu_PalTeleportSecret) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalTeleportSecret,Npc_HasItems(Trader,ItRu_PalTeleportSecret));};
	if(Npc_HasItems(Trader,ItRu_PalLight) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalLight,Npc_HasItems(Trader,ItRu_PalLight));};
	if(Npc_HasItems(Trader,ItRu_PalLightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalLightHeal,Npc_HasItems(Trader,ItRu_PalLightHeal));};
	if(Npc_HasItems(Trader,ItRu_PalMediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalMediumHeal,Npc_HasItems(Trader,ItRu_PalMediumHeal));};
	if(Npc_HasItems(Trader,ItRu_PalFullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalFullHeal,Npc_HasItems(Trader,ItRu_PalFullHeal));};
	if(Npc_HasItems(Trader,ItRu_PalHolyBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalHolyBolt,Npc_HasItems(Trader,ItRu_PalHolyBolt));};
	if(Npc_HasItems(Trader,ItRu_PalRepelEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalRepelEvil,Npc_HasItems(Trader,ItRu_PalRepelEvil));};
	if(Npc_HasItems(Trader,ItRu_PalDestroyEvil) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PalDestroyEvil,Npc_HasItems(Trader,ItRu_PalDestroyEvil));};
	if(Npc_HasItems(Trader,ItRu_Light) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Light,Npc_HasItems(Trader,ItRu_Light));};
	if(Npc_HasItems(Trader,ItRu_Light_Pyr) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Light_Pyr,Npc_HasItems(Trader,ItRu_Light_Pyr));};
	if(Npc_HasItems(Trader,ItRu_LightHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_LightHeal,Npc_HasItems(Trader,ItRu_LightHeal));};
	if(Npc_HasItems(Trader,ItRu_FireBolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FireBolt,Npc_HasItems(Trader,ItRu_FireBolt));};
	if(Npc_HasItems(Trader,ItRu_Unlock) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Unlock,Npc_HasItems(Trader,ItRu_Unlock));
	};
	if(Npc_HasItems(Trader,ItRu_RapidFirebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_RapidFirebolt,Npc_HasItems(Trader,ItRu_RapidFirebolt));
	};
	if(Npc_HasItems(Trader,ItRu_RapidIcebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_RapidIcebolt,Npc_HasItems(Trader,ItRu_RapidIcebolt));
	};
	if(Npc_HasItems(Trader,ItRu_Rage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Rage,Npc_HasItems(Trader,ItRu_Rage));
	};
	if(Npc_HasItems(Trader,ItRu_Quake) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Quake,Npc_HasItems(Trader,ItRu_Quake));
	};
	if(Npc_HasItems(Trader,ItRu_MagicCage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MagicCage,Npc_HasItems(Trader,ItRu_MagicCage));
	};
	if(Npc_HasItems(Trader,ItRu_Lacerate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Lacerate,Npc_HasItems(Trader,ItRu_Lacerate));
	};
	if(Npc_HasItems(Trader,ItRu_Extricate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Extricate,Npc_HasItems(Trader,ItRu_Extricate));
	};
	if(Npc_HasItems(Trader,ItRu_Explosion) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Explosion,Npc_HasItems(Trader,ItRu_Explosion));
	};
	if(Npc_HasItems(Trader,ItRu_Elevate) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Elevate,Npc_HasItems(Trader,ItRu_Elevate));
	};
	if(Npc_HasItems(Trader,ItRu_AdanosBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_AdanosBall,Npc_HasItems(Trader,ItRu_AdanosBall));
	};
	if(Npc_HasItems(Trader,ItRu_Acid) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Acid,Npc_HasItems(Trader,ItRu_Acid));
	};
	if(Npc_HasItems(Trader,ItRu_Zap) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Zap,Npc_HasItems(Trader,ItRu_Zap));};
	if(Npc_HasItems(Trader,ItRu_Icebolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Icebolt,Npc_HasItems(Trader,ItRu_Icebolt));};
	if(Npc_HasItems(Trader,ItRu_Sleep) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Sleep,Npc_HasItems(Trader,ItRu_Sleep));};
	if(Npc_HasItems(Trader,ITRU_BERZERK) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BERZERK,Npc_HasItems(Trader,ITRU_BERZERK));};
	if(Npc_HasItems(Trader,ItRu_Deathbolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Deathbolt,Npc_HasItems(Trader,ItRu_Deathbolt));};
	if(Npc_HasItems(Trader,ItRu_SumGobSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumGobSkel,Npc_HasItems(Trader,ItRu_SumGobSkel));};
	if(Npc_HasItems(Trader,ItRu_SumWolf) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumWolf,Npc_HasItems(Trader,ItRu_SumWolf));};
	if(Npc_HasItems(Trader,ItRu_MediumHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MediumHeal,Npc_HasItems(Trader,ItRu_MediumHeal));};
	if(Npc_HasItems(Trader,ItRu_HarmUndead) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_HarmUndead,Npc_HasItems(Trader,ItRu_HarmUndead));};
	if(Npc_HasItems(Trader,ItRu_InstantFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_InstantFireball,Npc_HasItems(Trader,ItRu_InstantFireball));};
	if(Npc_HasItems(Trader,ItRu_Icelance) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Icelance,Npc_HasItems(Trader,ItRu_Icelance));};
	if(Npc_HasItems(Trader,ITRU_SUMSHOAL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMSHOAL,Npc_HasItems(Trader,ITRU_SUMSHOAL));};
	if(Npc_HasItems(Trader,ItRu_Windfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Windfist,Npc_HasItems(Trader,ItRu_Windfist));};
	if(Npc_HasItems(Trader,ITRU_TELEKINESIS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TELEKINESIS,Npc_HasItems(Trader,ITRU_TELEKINESIS));};
	if(Npc_HasItems(Trader,ItRu_GreenTentacle) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GreenTentacle,Npc_HasItems(Trader,ItRu_GreenTentacle));};
	if(Npc_HasItems(Trader,ItRu_ManaForLife) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ManaForLife,Npc_HasItems(Trader,ItRu_ManaForLife));};
	if(Npc_HasItems(Trader,ItRu_SummonZombie) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SummonZombie,Npc_HasItems(Trader,ItRu_SummonZombie));};
	if(Npc_HasItems(Trader,ItRu_FullHeal) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FullHeal,Npc_HasItems(Trader,ItRu_FullHeal));};
	if(Npc_HasItems(Trader,ItRu_Firestorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Firestorm,Npc_HasItems(Trader,ItRu_Firestorm));};
	if(Npc_HasItems(Trader,ItRu_IceCube) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_IceCube,Npc_HasItems(Trader,ItRu_IceCube));};
	if(Npc_HasItems(Trader,ItRu_ThunderBall) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ThunderBall,Npc_HasItems(Trader,ItRu_ThunderBall));};
	if(Npc_HasItems(Trader,ItRu_Fear) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Fear,Npc_HasItems(Trader,ItRu_Fear));};
	if(Npc_HasItems(Trader,ITRU_CHARM) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CHARM,Npc_HasItems(Trader,ITRU_CHARM));};
	if(Npc_HasItems(Trader,ItRu_Swarm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Swarm,Npc_HasItems(Trader,ItRu_Swarm));};
	if(Npc_HasItems(Trader,ItRu_SumSkel) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumSkel,Npc_HasItems(Trader,ItRu_SumSkel));};
	if(Npc_HasItems(Trader,ItRu_BeliarsRage) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_BeliarsRage,Npc_HasItems(Trader,ItRu_BeliarsRage));};
	if(Npc_HasItems(Trader,ItRu_SummonGuardian) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SummonGuardian,Npc_HasItems(Trader,ItRu_SummonGuardian));};
	if(Npc_HasItems(Trader,ItRu_SumGol) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumGol,Npc_HasItems(Trader,ItRu_SumGol));};
	if(Npc_HasItems(Trader,ITRU_SUMFIREGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMFIREGOL,Npc_HasItems(Trader,ITRU_SUMFIREGOL));};
	if(Npc_HasItems(Trader,ItRu_ChargeFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ChargeFireball,Npc_HasItems(Trader,ItRu_ChargeFireball));};
	if(Npc_HasItems(Trader,ITRU_FIRELIGHT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_FIRELIGHT,Npc_HasItems(Trader,ITRU_FIRELIGHT));};
	if(Npc_HasItems(Trader,ItRu_LightningFlash) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_LightningFlash,Npc_HasItems(Trader,ItRu_LightningFlash));};
	if(Npc_HasItems(Trader,ITRU_SUMICEGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMICEGOL,Npc_HasItems(Trader,ITRU_SUMICEGOL));};
	if(Npc_HasItems(Trader,ITRU_SEVEREFETIDITY) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SEVEREFETIDITY,Npc_HasItems(Trader,ITRU_SEVEREFETIDITY));};
	if(Npc_HasItems(Trader,ItRu_Whirlwind) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Whirlwind,Npc_HasItems(Trader,ItRu_Whirlwind));};
	if(Npc_HasItems(Trader,ItRu_SumDemon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_SumDemon,Npc_HasItems(Trader,ItRu_SumDemon));};
	if(Npc_HasItems(Trader,ItRu_Deathball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Deathball,Npc_HasItems(Trader,ItRu_Deathball));};
	if(Npc_HasItems(Trader,ItRu_BreathOfDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_BreathOfDeath,Npc_HasItems(Trader,ItRu_BreathOfDeath));};
	if(Npc_HasItems(Trader,ITRU_ELIGORDEMONS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_ELIGORDEMONS,Npc_HasItems(Trader,ITRU_ELIGORDEMONS));};
	if(Npc_HasItems(Trader,ITRU_BELIARSUPERRUNE) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSUPERRUNE,Npc_HasItems(Trader,ITRU_BELIARSUPERRUNE));};
	if(Npc_HasItems(Trader,ItRu_OrcFireball) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_OrcFireball,Npc_HasItems(Trader,ItRu_OrcFireball));};
	if(Npc_HasItems(Trader,ItRu_Pyrokinesis) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Pyrokinesis,Npc_HasItems(Trader,ItRu_Pyrokinesis));};
	if(Npc_HasItems(Trader,ItRu_Waterfist) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Waterfist,Npc_HasItems(Trader,ItRu_Waterfist));};
	if(Npc_HasItems(Trader,ItRu_IceWave) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_IceWave,Npc_HasItems(Trader,ItRu_IceWave));};
	if(Npc_HasItems(Trader,ITRU_CONTROL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CONTROL,Npc_HasItems(Trader,ITRU_CONTROL));};
	if(Npc_HasItems(Trader,ItRu_ArmyOfDarkness) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ArmyOfDarkness,Npc_HasItems(Trader,ItRu_ArmyOfDarkness));};
	if(Npc_HasItems(Trader,ITRU_SUMSWPGOL) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMSWPGOL,Npc_HasItems(Trader,ITRU_SUMSWPGOL));};
	if(Npc_HasItems(Trader,ItRu_Firerain) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Firerain,Npc_HasItems(Trader,ItRu_Firerain));};
	if(Npc_HasItems(Trader,ItRu_FireMeteor) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_FireMeteor,Npc_HasItems(Trader,ItRu_FireMeteor));};
	if(Npc_HasItems(Trader,ItRu_Geyser) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Geyser,Npc_HasItems(Trader,ItRu_Geyser));};
	if(Npc_HasItems(Trader,ItRu_Thunderstorm) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Thunderstorm,Npc_HasItems(Trader,ItRu_Thunderstorm));};
	if(Npc_HasItems(Trader,ItRu_MassDeath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MassDeath,Npc_HasItems(Trader,ItRu_MassDeath));};
	if(Npc_HasItems(Trader,ItRu_Skull) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Skull,Npc_HasItems(Trader,ItRu_Skull));};
	if(Npc_HasItems(Trader,ItRu_GuruWrath) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GuruWrath,Npc_HasItems(Trader,ItRu_GuruWrath));};
	if(Npc_HasItems(Trader,ItRu_MasterOfDisaster) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_MasterOfDisaster,Npc_HasItems(Trader,ItRu_MasterOfDisaster));};
	if(Npc_HasItems(Trader,ItRu_Concussionbolt) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_Concussionbolt,Npc_HasItems(Trader,ItRu_Concussionbolt));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_00,Npc_HasItems(Trader,ITRU_TPLHEAL_00));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_01,Npc_HasItems(Trader,ITRU_TPLHEAL_01));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_02,Npc_HasItems(Trader,ITRU_TPLHEAL_02));};
	if(Npc_HasItems(Trader,ITRU_TPLHEAL_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLHEAL_03,Npc_HasItems(Trader,ITRU_TPLHEAL_03));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_00) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_00,Npc_HasItems(Trader,ITRU_TPLSTRIKE_00));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_01,Npc_HasItems(Trader,ITRU_TPLSTRIKE_01));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_02,Npc_HasItems(Trader,ITRU_TPLSTRIKE_02));};
	if(Npc_HasItems(Trader,ITRU_TPLSTRIKE_03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_TPLSTRIKE_03,Npc_HasItems(Trader,ITRU_TPLSTRIKE_03));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE01) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE01,Npc_HasItems(Trader,ITRU_BELIARSRUNE01));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE02) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE02,Npc_HasItems(Trader,ITRU_BELIARSRUNE02));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE03) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE03,Npc_HasItems(Trader,ITRU_BELIARSRUNE03));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE04) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE04,Npc_HasItems(Trader,ITRU_BELIARSRUNE04));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE05) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE05,Npc_HasItems(Trader,ITRU_BELIARSRUNE05));};
	if(Npc_HasItems(Trader,ITRU_BELIARSRUNE06) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_BELIARSRUNE06,Npc_HasItems(Trader,ITRU_BELIARSRUNE06));};
	if(Npc_HasItems(Trader,ITRU_MORAULARTU) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_MORAULARTU,Npc_HasItems(Trader,ITRU_MORAULARTU));};
	if(Npc_HasItems(Trader,ITRU_CRESTELEMENTS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_CRESTELEMENTS,Npc_HasItems(Trader,ITRU_CRESTELEMENTS));};
	if(Npc_HasItems(Trader,ItRu_PyroRune) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_PyroRune,Npc_HasItems(Trader,ItRu_PyroRune));};
	if(Npc_HasItems(Trader,ITRU_DESTROYGUARDIANS) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_DESTROYGUARDIANS,Npc_HasItems(Trader,ITRU_DESTROYGUARDIANS));};
	if(Npc_HasItems(Trader,ITRU_SUMTREANT) > 0)
	{
		Npc_RemoveInvItems(Trader,ITRU_SUMTREANT,Npc_HasItems(Trader,ITRU_SUMTREANT));};
	if(Npc_HasItems(Trader,ItRu_EligorSummon) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_EligorSummon,Npc_HasItems(Trader,ItRu_EligorSummon));};
	if(Npc_HasItems(Trader,ItRu_TrfBloodFly) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfBloodFly,Npc_HasItems(Trader,ItRu_TrfBloodFly));};
	if(Npc_HasItems(Trader,ItRu_TrfFireWaran) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfFireWaran,Npc_HasItems(Trader,ItRu_TrfFireWaran));};
	if(Npc_HasItems(Trader,ItRu_TrfWarg) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfWarg,Npc_HasItems(Trader,ItRu_TrfWarg));};
	if(Npc_HasItems(Trader,ItRu_TrfShadowbeast) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfShadowbeast,Npc_HasItems(Trader,ItRu_TrfShadowbeast));};
	if(Npc_HasItems(Trader,ItRu_TrfDragonSnapper) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfDragonSnapper,Npc_HasItems(Trader,ItRu_TrfDragonSnapper));};
	if(Npc_HasItems(Trader,ItRu_TrfTroll) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_TrfTroll,Npc_HasItems(Trader,ItRu_TrfTroll));};
	if(Npc_HasItems(Trader,ItRu_ShadowMount) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_ShadowMount,Npc_HasItems(Trader,ItRu_ShadowMount));};
	if(Npc_HasItems(Trader,ItRu_GlobalTeleport) > 0)
	{
		Npc_RemoveInvItems(Trader,ItRu_GlobalTeleport,Npc_HasItems(Trader,ItRu_GlobalTeleport));};
};