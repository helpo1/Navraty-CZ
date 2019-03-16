
instance PAL_7522_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 7522;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_CSP_AMBIENT;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal17,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7522;
};


func void rtn_start_7522()
{
	TA_Stand_Eating(7,35,7,42,"WP_COAST_FOREST_38");
	TA_Stand_Drinking(7,42,7,50,"WP_COAST_FOREST_40");
	TA_Stand_Eating(7,50,7,56,"WP_COAST_FOREST_42");
	TA_Stand_Drinking(7,56,8,0,"WP_COAST_FOREST_45");
	TA_Smalltalk(8,0,23,0,"WP_COAST_CAMP_05");
	TA_Stand_Drinking(23,0,23,4,"WP_COAST_FOREST_45");
	TA_Stand_Eating(23,4,23,10,"WP_COAST_FOREST_42");
	TA_Stand_Drinking(23,10,23,18,"WP_COAST_FOREST_40");
	TA_Stand_Eating(23,18,23,25,"WP_COAST_FOREST_38");
	TA_Sit_Campfire(23,25,7,35,"WP_COAST_FOREST_126");
};

func void rtn_palout_7522()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_01");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_01");
};

func void rtn_follow_7522()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_7522()
{
	TA_Stand_Guarding(8,0,23,0,"OC_KNECHTCAMP_02");
	TA_Stand_Guarding(23,0,8,0,"OC_KNECHTCAMP_02");
};

func void rtn_palexit_7522()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17_1");
};

func void rtn_tot_7522()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

