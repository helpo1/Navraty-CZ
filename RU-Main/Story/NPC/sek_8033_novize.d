
instance SEK_8033_NOVIZE(Npc_Default)
{
	name[0] = NAME_SEK;
	guild = GIL_SEK;
	id = 8033;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_8033;
};


func void rtn_start_8033()
{
	TA_Smalltalk(9,0,22,0,"NW_PSICAMP_22");
	TA_Smoke_Joint(22,0,9,0,"WP_NW_PSICAMP_PATH_09_99");
};

