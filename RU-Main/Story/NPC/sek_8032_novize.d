
instance SEK_8032_NOVIZE(Npc_Default)
{
	name[0] = NAME_SEK;
	guild = GIL_SEK;
	id = 8032;
	voice = 3;
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
	daily_routine = rtn_start_8032;
};


func void rtn_start_8032()
{
	TA_Sit_Bench(9,0,20,0,"NW_PSICAMP_TALAS_SIT");
	TA_Smalltalk(20,0,9,0,"NW_PSICAMP_16");
};

