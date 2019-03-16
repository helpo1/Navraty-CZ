
instance PAL_268_Udar(Npc_Default)
{
	name[0] = "Удар";
	guild = GIL_PAL;
	id = 268;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_Crossbow_H_01);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal_Stone,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_268;
};


func void Rtn_Start_268()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_GUARD_03");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_GUARD_03");
};

func void rtn_cage_268()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_CELL_01");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_CELL_01");
};

func void rtn_cagefree_268()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_IN_01_98");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_IN_01_98");
};

func void rtn_follow_268()
{
	TA_Follow_Player(8,0,22,0,"OW_PATH_1_17");
	TA_Follow_Player(22,0,8,0,"OW_PATH_1_17");
};

func void rtn_palexit_268()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16");
};

func void rtn_tot_268()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

