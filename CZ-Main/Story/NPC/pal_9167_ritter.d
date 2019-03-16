
instance PAL_9167_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9167;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart05,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9167;
};


func void rtn_start_9167()
{
	TA_Study_WP(8,0,18,0,"WP_ORCTEMPLEORE_03");
	TA_Stand_ArmsCrossed(18,0,8,0,"WP_ORCTEMPLEORE_03");
};

func void rtn_palout_9167()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_11");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_11");
};

func void rtn_follow_9167()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_9167()
{
	TA_Stand_Guarding(8,0,23,0,"OC_TO_MAGE");
	TA_Stand_Guarding(23,0,8,0,"OC_TO_MAGE");
};

func void rtn_palexit_9167()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17");
};

func void rtn_tot_9167()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

