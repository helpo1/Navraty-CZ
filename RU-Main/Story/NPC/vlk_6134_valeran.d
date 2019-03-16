
instance VLK_6134_VALERAN(Npc_Default)
{
	name[0] = "Валеран";
	guild = GIL_VLK;
	id = 6134;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal14,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6134;
};


func void rtn_start_6134()
{
	TA_Read_Bookstand(8,0,20,0,"NW_CITY_REICH02_02");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_UPTOWN_PATH_08_B");
};

func void rtn_waitintavern_6134()
{
	TA_Sit_Chair(8,0,20,0,"NW_LUTEROHELPER_03");
	TA_Sit_Chair(20,0,8,0,"NW_LUTEROHELPER_03");
};

func void rtn_follow_6134()
{
	TA_Follow_Player(8,0,22,0,"NW_CITY_LUTERO");
	TA_Follow_Player(22,0,8,0,"NW_CITY_LUTERO");
};

func void rtn_workagain_6134()
{
	TA_Read_Bookstand(8,0,20,0,"NW_VALERAN_01");
	TA_Sit_Bench(20,0,8,0,"NW_VALERAN_02");
};

func void rtn_towerceo_6134()
{
	TA_Stand_ArmsCrossed(6,0,10,0,"NW_CASTLEMINE_HUT_01");
	TA_Repair_Hut(10,0,12,0,"NW_CASTLEMINE_TOWER_REP_HUT");
	TA_Stand_Eating(12,0,14,0,"NW_CASTLEMINE_HUT_03_NIK");
	TA_Read_Bookstand(14,0,20,0,"NW_CASTLEMINE_HUT_03_READBOOK");
	TA_Stand_ArmsCrossed(20,0,23,0,"NW_CASTLEMINE_HUT_01");
	TA_Sleep(23,0,6,0,"NW_CASTLEMINE_TOWER_08");
};