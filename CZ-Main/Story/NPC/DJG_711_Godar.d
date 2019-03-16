
instance DJG_711_Godar(Npc_Default)
{
	name[0] = "Godar";
	guild = GIL_DJG;
	id = 711;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal14,BodyTex_N,itar_djg_m_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_711;
};


func void Rtn_PreStart_711()
{
	TA_Smalltalk(8,0,23,0,"OW_PATH_1_5_3A");
	TA_Smalltalk(23,0,8,0,"OW_PATH_1_5_3A");
};

func void Rtn_Start_711()
{
	TA_Roast_Scavenger(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	TA_Roast_Scavenger(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

func void rtn_sturm_711()
{
	TA_Stand_Guarding(8,0,23,0,"OC_DJG_JOIN_04_04");
	TA_Stand_Guarding(23,0,8,0,"OC_DJG_JOIN_04_04");
};

func void rtn_follow_711()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_711()
{
	TA_Sit_Campfire(8,0,23,0,"OC_CAMPFIRE_OUT_02");
	TA_Sit_Campfire(23,0,8,0,"OC_CAMPFIRE_OUT_02");
};

func void rtn_palexit_711()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16_1");
};

func void rtn_tot_711()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

