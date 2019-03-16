
instance DJG_708_Kurgan(Npc_Default)
{
	name[0] = "Kurgan";
	guild = GIL_DJG;
	id = 708;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,6);
	aivar[93] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_kurgansword);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ImportantGrey,BodyTex_N,itar_djg_h_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_708;
};


func void Rtn_PreStart_708()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_5_4");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_5_4");
};

func void Rtn_Start_708()
{
	TA_Smalltalk(8,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	TA_Smalltalk(23,0,8,0,"SPAWN_OW_BLACKGOBBO_A1");
};

func void rtn_sturm_708()
{
	TA_Stand_Guarding(8,0,23,0,"OC_DJG_JOIN_01_01");
	TA_Stand_Guarding(23,0,8,0,"OC_DJG_JOIN_01_01");
};

func void rtn_follow_708()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_708()
{
	TA_Sit_Campfire(8,0,23,0,"OC_CAMPFIRE_BARBQ");
	TA_Sit_Campfire(23,0,8,0,"OC_CAMPFIRE_BARBQ");
};

func void rtn_palexit_708()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16_1");
};

func void rtn_tot_708()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

