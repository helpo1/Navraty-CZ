
instance PAL_7524_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 7524;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart06,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7524;
};


func void rtn_start_7524()
{
	TA_Stand_Guarding(8,0,23,0,"WP_COAST_FOREST_45");
	TA_Stand_Guarding(23,0,8,0,"WP_COAST_FOREST_45");
};

func void rtn_palout_7524()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_02");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_02");
};

func void rtn_follow_7524()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_7524()
{
	TA_Stand_Guarding(8,0,23,0,"OC_TO_PRISON");
	TA_Stand_Guarding(23,0,8,0,"OC_TO_PRISON");
};

func void rtn_palexit_7524()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17_1");
};

func void rtn_tot_7524()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

