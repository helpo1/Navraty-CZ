instance SEK_8040_NOVIZE(Npc_Default)
{
	name[0] = NAME_OBSSEK;
	guild = GIL_SEK;
	id = 8040;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_8040;
};

func void rtn_start_8040()
{
	TA_Rake_FP(8,0,21,0,"NW_FOREST_PATH_PSIGROUP1_03");
	TA_Sleep(21,0,8,0,"NW_FOREST_PATH_PSIGROUP1_03_N");
};

func void rtn_tot_8040()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};