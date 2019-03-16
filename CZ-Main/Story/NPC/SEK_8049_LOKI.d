instance SEK_8049_LOKI(Npc_Default)
{
	name[0] = "Loki";
	guild = GIL_SEK;
	id = 8049;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_SEKTANT_5,BodyTex_N,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_8049;
};

func void rtn_start_8049()
{
	TA_Stand_WP(8,0,21,0,"NW_CITY_LOKI");
	TA_Sit_Campfire(21,0,8,0,"NW_CITY_LOKI_02");
};

func void rtn_tot_8049()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void Rtn_Guide_8049()
{
	TA_Guide_Player(8,0,20,0,"NW_TO_NEWCAMPPSI_01");
	TA_Guide_Player(20,0,8,0,"NW_TO_NEWCAMPPSI_01");
};

func void Rtn_PsiCamp_8049()
{
	TA_Stand_WP(8,0,21,0,"NW_PSICAMP_LOKI");
	TA_Sit_Campfire(24,0,5,0,"NW_PSICAMP_LOKI_02");
};