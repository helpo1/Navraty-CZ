
instance PAL_7523_ALBERT(Npc_Default)
{
	name[0] = "Albert";
	guild = GIL_PAL;
	id = 7523;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	CreateInvItems(self,itri_quest_pal_ring,1);
	CreateInvItems(self,ItWr_Manowar,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7523;
};


func void rtn_start_7523()
{
	TA_Pray_Innos(7,0,10,0,"WP_COAST_CAMP_09");
	TA_Sit_Bench(10,0,16,0,"WP_COAST_CAMP_11");
	TA_Pray_Innos(16,0,19,0,"WP_COAST_CAMP_09");
	TA_Sit_Bench(19,0,23,0,"WP_COAST_CAMP_11");
	TA_Sleep(23,0,7,0,"WP_COAST_CAMP_10");
};

func void rtn_prepare_7523()
{
	TA_Pray_Innos(7,0,8,0,"WP_COAST_CAMP_09");
	TA_Practice_Sword(8,0,16,0,"WP_COAST_CAMP_08");
	TA_Pray_Innos(16,0,17,0,"WP_COAST_CAMP_09");
	TA_Sit_Bench(17,0,18,0,"WP_COAST_CAMP_11");
	TA_Practice_Sword(18,0,23,0,"WP_COAST_CAMP_08");
	TA_Sleep(23,0,7,0,"WP_COAST_CAMP_10");
};

func void rtn_palout_7523()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_PALADIN_OUT_05");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_PALADIN_OUT_05");
};

func void rtn_follow_7523()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_7523()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GATE_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_GATE_GUARD_01");
};

func void rtn_palexit_7523()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_15");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_15");
};

func void rtn_tot_7523()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

