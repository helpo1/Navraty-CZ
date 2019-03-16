
instance PAL_7521_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 7521;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_CSP_AMBIENT;
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
	daily_routine = rtn_start_7521;
};


func void rtn_start_7521()
{
	TA_Stand_Eating(7,0,8,0,"WP_COAST_CAMP_05");
	TA_Smalltalk(8,0,23,0,"WP_COAST_CAMP_05");
	TA_Sit_Bench(23,0,7,0,"WP_COAST_CAMP_06");
};

func void rtn_prepare_7521()
{
	TA_Sit_Bench(1,0,4,40,"WP_COAST_CAMP_06");
	TA_Practice_Sword(4,40,7,0,"WP_COAST_CAMP_05");
	TA_Stand_Eating(7,0,8,0,"WP_COAST_CAMP_05");
	TA_Smalltalk(8,0,23,0,"WP_COAST_CAMP_05");
	TA_Practice_Sword(23,0,1,0,"WP_COAST_CAMP_05");
};

func void rtn_palout_7521()
{
	TA_Smalltalk(8,0,23,0,"OC_PALADIN_OUT_04");
	TA_Smalltalk(23,0,8,0,"OC_PALADIN_OUT_04");
};

func void rtn_follow_7521()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_7521()
{
	TA_Stand_Guarding(8,0,23,0,"OC_KNECHTCAMP_01");
	TA_Stand_Guarding(23,0,8,0,"OC_KNECHTCAMP_01");
};

func void rtn_palexit_7521()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17_1");
};

func void rtn_tot_7521()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

