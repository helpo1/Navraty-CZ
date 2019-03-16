
instance PAL_251_Oric(Npc_Default)
{
	name[0] = "Орик";
	guild = GIL_PAL;
	id = 251;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Lee_Dhnlich,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_251;
};


func void Rtn_Start_251()
{
	TA_Smalltalk(8,0,21,0,"OC_EBR_HALL_CENTER");
	TA_Stand_Guarding(21,0,8,0,"OC_EBR_HALL_CENTER");
};

func void rtn_attack_251()
{
	TA_Smalltalk(6,0,23,0,"OC_CENTER_02");
	TA_Stand_Guarding(23,0,6,0,"OC_CENTER_02");
};

func void rtn_cage_251()
{
	TA_Sit_Campfire(8,0,23,0,"OC_PRISON_CELL_01_SIT");
	TA_Sit_Campfire(23,0,8,0,"OC_PRISON_CELL_01_SIT");
};

func void rtn_cagefree_251()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_IN_01_99");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_IN_01_99");
};

func void rtn_follow_251()
{
	TA_Follow_Player(8,0,22,0,"OW_PATH_1_17");
	TA_Follow_Player(22,0,8,0,"OW_PATH_1_17");
};

func void rtn_palexit_251()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16");
};

func void rtn_tot_251()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};