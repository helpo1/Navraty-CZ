
instance PAL_7518_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 7518;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal08,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7518;
};


func void rtn_start_7518()
{
	TA_Stand_Guarding(10,0,23,0,"WP_COAST_CAMP_01_ORCTEAM");
	TA_Stand_Guarding(23,0,10,0,"WP_COAST_CAMP_01_ORCTEAM");
};

func void rtn_follow_7518()
{
	TA_Follow_Player(8,0,22,0,"WP_COAST_CAMP_01_ORCTEAM");
	TA_Follow_Player(22,0,8,0,"WP_COAST_CAMP_01_ORCTEAM");
};

func void rtn_afterbattle_7518()
{
	TA_Stand_Guarding(10,0,23,0,"WP_COAST_FOREST_24_999_02");
	TA_Stand_Guarding(23,0,10,0,"WP_COAST_FOREST_24_999_02");
};

func void rtn_palout_7518()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_03");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_03");
};

func void rtn_followex_7518()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_7518()
{
	TA_Stand_Guarding(8,0,23,0,"OC_TO_GUARD");
	TA_Stand_Guarding(23,0,8,0,"OC_TO_GUARD");
};

func void rtn_palexit_7518()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_15");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_15");
};

func void rtn_tot_7518()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

