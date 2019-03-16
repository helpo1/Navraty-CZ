
instance PAL_7519_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 7519;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Grim,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7519;
};


func void rtn_start_7519()
{
	TA_Stand_ArmsCrossed(7,0,8,0,"WP_COAST_CAMP_02_ORCTEAM");
	TA_Stand_ArmsCrossed(8,0,23,0,"WP_COAST_CAMP_02_ORCTEAM");
	TA_Stand_ArmsCrossed(23,0,7,0,"WP_COAST_CAMP_02_ORCTEAM");
};

func void rtn_follow_7519()
{
	TA_Follow_Player(8,0,22,0,"WP_COAST_CAMP_02_ORCTEAM");
	TA_Follow_Player(22,0,8,0,"WP_COAST_CAMP_02_ORCTEAM");
};

func void rtn_afterbattle_7519()
{
	TA_Stand_Guarding(10,0,23,0,"WP_COAST_FOREST_24_999_01");
	TA_Stand_Guarding(23,0,10,0,"WP_COAST_FOREST_24_999_01");
};

func void rtn_palout_7519()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_01");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_01");
};

func void rtn_followex_7519()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_7519()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_02");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_02");
};

func void rtn_palexit_7519()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_15");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_15");
};

func void rtn_tot_7519()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

