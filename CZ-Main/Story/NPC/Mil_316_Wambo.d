
instance Mil_316_Wambo(Npc_Default)
{
	name[0] = "Wambo";
	guild = GIL_MIL;
	id = 316;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_City_Tower_04,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart16,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_316;
};


func void Rtn_Start_316()
{
	TA_Stand_Guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(18,0,20,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(20,0,21,0,"NW_CITY_UPTOWN_PATH_09");
	TA_WacheFackel(21,0,23,30,"NW_CITY_UPTOWN_PATH_13");
	TA_WacheFackel(23,30,1,0,"NW_CITY_UPTOWN_PATH_05");
	TA_WacheFackel(1,0,2,30,"NW_CITY_UPTOWN_PATH_13");
	TA_WacheFackel(2,30,4,0,"NW_CITY_UPTOWN_PATH_14");
	TA_Stand_Guarding(4,0,5,30,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(5,30,8,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_13");
};

func void Rtn_Drink_316()
{
	TA_Stand_Guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(18,0,20,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_Drinking(20,0,5,30,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Guarding(5,30,8,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_13");
};

func void rtn_waitfight_316()
{
	TA_Stand_Guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(18,0,22,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Smalltalk(22,0,23,59,"NW_CITY_KILLWAMBO_02");
	TA_Stand_Guarding(23,59,8,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_13");
};

func void rtn_waitfight2_316()
{
	TA_Stand_Guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(18,0,22,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_Guarding(22,0,23,59,"NW_CITY_KILLWAMBO_02");
	TA_Stand_Guarding(23,59,8,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_Guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_13");
};

func void rtn_TOT_316()
{
	TA_Stand_WP(6,0,23,0,"TOT");
	TA_Stand_WP(23,0,6,0,"TOT");
};