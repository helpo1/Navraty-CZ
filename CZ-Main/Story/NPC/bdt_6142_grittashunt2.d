
instance BDT_6142_GRITTASHUNT2(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6142;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Homer,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_6142;
};


func void rtn_start_6142()
{
	TA_Stand_Drinking(8,0,23,0,"NW_CITY_GRITTA_MISS_HUNT_03");
	TA_Stand_Drinking(23,0,8,0,"NW_CITY_GRITTA_MISS_HUNT_03");
};

