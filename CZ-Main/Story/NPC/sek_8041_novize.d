
instance SEK_8041_NOVIZE(Npc_Default)
{
	name[0] = NAME_SEK;
	guild = GIL_SEK;
	id = 8041;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_4,BodyTex_N,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_8041;
};


func void rtn_start_8041()
{
	TA_Rake_FP(8,0,21,0,"NW_FOREST_PATH_PSIGROUP2_02");
	TA_Sleep(21,0,8,0,"NW_FOREST_PATH_PSIGROUP2_02_N");
};

func void rtn_tot_8041()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};