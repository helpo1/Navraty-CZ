
instance DJG_703_Cipher(Npc_Default)
{
	name[0] = "Сайфер";
	guild = GIL_DJG;
	id = 703;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,itar_djg_h_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_703;
};


func void Rtn_Start_703()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_SWAMPCAMP_02");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_SWAMPCAMP_03");
};

func void Rtn_SwampWait1_703()
{
	TA_Guide_Player(8,0,23,0,"OW_DJG_SWAMP_WAIT1_01");
	TA_Guide_Player(23,0,8,0,"OW_DJG_SWAMP_WAIT1_01");
};

func void Rtn_SwampWait2_703()
{
	TA_RunToWP(8,0,23,0,"OW_DJG_SWAMP_WAIT2_01");
	TA_RunToWP(23,0,8,0,"OW_DJG_SWAMP_WAIT2_01");
};

func void Rtn_SwampDragon_703()
{
	TA_RunToWP(8,0,23,0,"OW_DRAGONSWAMP_009");
	TA_RunToWP(23,0,8,0,"OW_DRAGONSWAMP_009");
};

func void rtn_ondcamp_703()
{
	TA_Stand_Guarding(8,0,23,0,"VORPOSTEN");
	TA_Stand_Guarding(23,0,8,0,"VORPOSTEN");
};

func void rtn_sturm_703()
{
	TA_Stand_Guarding(8,0,23,0,"OC_DJG_JOIN_06_06");
	TA_Stand_Guarding(23,0,8,0,"OC_DJG_JOIN_06_06");
};

func void rtn_follow_703()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_703()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GUARD_STORE_01");
	TA_Stand_Guarding(23,0,8,0,"OC_GUARD_STORE_01");
};

func void rtn_palexit_703()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16_1");
};

func void rtn_tot_703()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

