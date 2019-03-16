
instance SEK_8030_NOVIZE(Npc_Default)
{
	name[0] = NAME_SEK;
	guild = GIL_SEK;
	id = 8030;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_3,BodyTex_B,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_8030;
};


func void rtn_start_8030()
{
	TA_Smalltalk(7,0,22,30,"NW_PSICAMP_14");
	TA_Sit_Bench(22,30,7,0,"NW_PSICAMP_12");
};

