
instance DJG_710_Kjorn(Npc_Default)
{
	name[0] = "Kjorn";
	guild = GIL_DJG;
	id = 710;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal02,BodyTex_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_710;
};


func void Rtn_PreStart_710()
{
	TA_Smalltalk(8,0,23,0,"OW_PATH_1_5_3A");
	TA_Smalltalk(23,0,8,0,"OW_PATH_1_5_3A");
};

func void Rtn_Start_710()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_VORPOSTEN_01_99");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_VORPOSTEN_01_99");
};

func void rtn_sturm_710()
{
	TA_Stand_Guarding(8,0,23,0,"OC_DJG_JOIN_02_02");
	TA_Stand_Guarding(23,0,8,0,"OC_DJG_JOIN_02_02");
};

func void rtn_follow_710()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_710()
{
	TA_Sit_Campfire(8,0,23,0,"OC_CAMPFIRE_OUT_01");
	TA_Sit_Campfire(23,0,8,0,"OC_CAMPFIRE_OUT_01");
};

func void rtn_palexit_710()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16_1");
};

func void rtn_tot_710()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

