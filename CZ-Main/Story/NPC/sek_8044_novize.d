
instance SEK_8044_NOVIZE(Npc_Default)
{
	name[0] = NAME_SEK;
	guild = GIL_SEK;
	id = 8044;
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
	daily_routine = rtn_start_8044;
};


func void rtn_start_8044()
{
	TA_Rake_FP(8,0,21,0,"NW_FOREST_PATH_PSIGROUP3_03");
	TA_Smoke_Joint(21,0,8,0,"NW_FOREST_PATH_PSIGROUP3_03_N");
};

