
instance DJG_702_Rod(Npc_Default)
{
	name[0] = "Rod";
	guild = GIL_DJG;
	id = 702;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ToughBart01,BodyTex_N,itar_djg_m_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_702;
};


func void Rtn_Start_702()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_SWAMPCAMP_01");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_SWAMPCAMP_01");
};

func void Rtn_SwampWait1_702()
{
	TA_Guide_Player(8,0,23,0,"OW_DJG_SWAMP_WAIT1_02");
	TA_Guide_Player(23,0,8,0,"OW_DJG_SWAMP_WAIT1_02");
};

func void Rtn_SwampWait2_702()
{
	TA_RunToWP(8,0,23,0,"OW_DJG_SWAMP_WAIT2_02");
	TA_RunToWP(23,0,8,0,"OW_DJG_SWAMP_WAIT2_02");
};

func void Rtn_SwampDragon_702()
{
	TA_RunToWP(8,0,23,0,"OW_SWAMPDRAGON_01");
	TA_RunToWP(23,0,8,0,"OW_SWAMPDRAGON_01");
};

func void rtn_ondcamp_702()
{
	TA_Stand_Guarding(8,0,23,0,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
	TA_Stand_Guarding(23,0,8,0,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
};

func void rtn_sturm_702()
{
	TA_Stand_Guarding(8,0,23,0,"OC_DJG_JOIN_05_05");
	TA_Stand_Guarding(23,0,8,0,"OC_DJG_JOIN_05_05");
};

func void rtn_follow_702()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_702()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_GUARD_02");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_GUARD_02");
};

func void rtn_palexit_702()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16_1");
};

func void rtn_tot_702()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

