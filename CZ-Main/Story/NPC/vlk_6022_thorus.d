
instance VLK_6022_THORUS(Npc_Default)
{
	name[0] = "Thorus";
	guild = GIL_MIL;
	id = 6022;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Thorus,BodyTex_B,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_6022;
};


func void rtn_start_6022()
{
	TA_Stand_Guarding(9,0,22,0,"NW_CITY_HABOUR_KASERN_18");
	TA_Sit_Chair(22,0,9,0,"NW_CITY_HABOUR_KASERN_15_B");
};

func void rtn_orcatcbegan_6022()
{
	TA_Stand_Guarding(6,55,20,30,"NW_FARM2_HOUSE_IN_03");
	TA_Stand_Guarding(20,30,6,55,"NW_FARM2_HOUSE_IN_03");
};

func void rtn_follow_6022()
{
	TA_Follow_Player(5,0,20,0,"NW_FARM2_HOUSE_IN_03");
	TA_Follow_Player(20,0,5,0,"NW_FARM2_HOUSE_IN_03");
};

func void rtn_farmrest_6022()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_BIGFARM_THORUS_01");
	TA_Stand_Eating(20,0,5,0,"NW_BIGFARM_THORUS_02");
};

func void rtn_killhim_6022()
{
	TA_Stand_WP(5,0,20,0,"NW_FARM2_PATH_SCATTY");
	TA_Stand_WP(20,0,5,0,"NW_FARM2_PATH_SCATTY");
};

func void rtn_inbattle_6022()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8626");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8626");
};

func void rtn_ship_6022()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_18");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_18");
};

