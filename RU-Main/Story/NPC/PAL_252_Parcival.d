
instance PAL_252_Parcival(Npc_Default)
{
	name[0] = "Парсиваль";
	guild = GIL_PAL;
	id = 252;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ITKE_TWOSTORE,1);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_Tough_Drago,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_252;
};


func void Rtn_Start_252()
{
	TA_Smalltalk(8,0,21,0,"OC_EBR_HALL_CENTER");
	TA_Sleep(21,0,8,0,"OC_EBR_ROOM_01_SLEEP");
};

func void rtn_attack_252()
{
	TA_Smalltalk(6,0,23,0,"OC_CENTER_02");
	TA_Sleep(23,0,6,0,"OC_EBR_ROOM_01_SLEEP");
};

func void rtn_cage_252()
{
	TA_Sit_Campfire(8,0,23,0,"OC_PRISON_CELL_02_SIT_GROUND");
	TA_Sit_Campfire(23,0,8,0,"OC_PRISON_CELL_02_SIT_GROUND");
};

func void rtn_cagefree_252()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_IN_01_97");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_IN_01_97");
};

func void rtn_follow_252()
{
	TA_Follow_Player(8,0,22,0,"OW_PATH_1_17");
	TA_Follow_Player(22,0,8,0,"OW_PATH_1_17");
};

func void rtn_palexit_252()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16");
};

func void rtn_tot_252()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

