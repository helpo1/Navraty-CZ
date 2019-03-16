
instance VLK_6025_TOM(Npc_Default)
{
	name[0] = "Tom";
	guild = GIL_VLK;
	id = 6025;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6025;
};


func void rtn_start_6025()
{
	TA_Sleep(8,0,12,0,"NW_CITY_BED_MATTEO");
	TA_Read_Bookstand(12,0,15,0,"NW_CITY_BOOKSTAND_TOM");
	TA_Stand_Sweeping(15,0,20,0,"NW_CITY_SHOP02_CENTER");
	TA_Sit_Chair(20,0,8,0,"NW_CITY_TAVERN_IN_07");
};

