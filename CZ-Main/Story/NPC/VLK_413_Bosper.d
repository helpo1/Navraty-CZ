
instance VLK_413_Bosper(Npc_Default)
{
	name[0] = "Bosper";
	guild = GIL_VLK;
	id = 413;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald.",Face_L_Tough_Santino,BodyTex_L,itar_leather_unick);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_413;
};


func void Rtn_Start_413()
{
	TA_Stand_Guarding(5,0,14,0,"NW_CITY_MERCHANT_SHOP01_IN_02");
	TA_Stand_Drinking(14,0,16,0,"NW_CITY_TAVERN_IN_04");
	TA_MakeArrows(16,0,20,0,"NW_CITY_MERCHANT_SHOP01_IN_02");
	TA_Stand_Guarding(20,0,23,0,"NW_CITY_MERCHANT_SHOP01_IN_02");
	TA_Sleep(23,0,5,0,"NW_CITY_BED_GRITTA");
};

