
instance PAL_9166_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9166;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_Crossbow_M_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough02,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9166;
};


func void rtn_start_9166()
{
	TA_Stand_Guarding(8,0,21,0,"WP_ORCTEMPLEORE_02");
	TA_Stand_Guarding(21,0,8,0,"WP_ORCTEMPLEORE_02");
};

func void rtn_palout_9166()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_10");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_10");
};

func void rtn_follow_9166()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_9166()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GUARD_ENTRANCE");
	TA_Stand_Guarding(23,0,8,0,"OC_GUARD_ENTRANCE");
};

func void rtn_palexit_9166()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17");
};

func void rtn_tot_9166()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

