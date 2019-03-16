
instance SEK_8022_NOVIZE(Npc_Default)
{
	name[0] = NAME_OBSSEK;
	guild = GIL_SEK;
	id = 8022;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_1,BodyTex_N,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_8022;
};


func void rtn_start_8022()
{
	TA_Smoke_Waterpipe(10,0,18,0,"NW_PSICAMP_03");
	TA_Smalltalk(18,0,10,0,"WP_NW_PSICAMP_PATH_X2");
};

