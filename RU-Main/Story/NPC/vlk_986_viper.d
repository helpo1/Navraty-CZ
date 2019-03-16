
instance VLK_986_VIPER(Npc_Default)
{
	name[0] = "Вайпер";
	guild = GIL_VLK;
	id = 986;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_MM_RestStart] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ITMW_1H_G4_AXESMALL_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",98,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_986;
};


func void rtn_start_986()
{
	TA_Sit_Chair(8,0,23,0,"NW_CITY_HABOUR_TAVERN01_04");
	TA_Sit_Chair(23,0,8,0,"NW_CITY_HABOUR_TAVERN01_04");
};

func void rtn_followme_986()
{
	TA_Follow_Player(5,0,20,0,"NW_CITY_HABOUR_TAVERN01_04");
	TA_Follow_Player(20,0,5,0,"NW_CITY_HABOUR_TAVERN01_04");
};

func void rtn_intower_986()
{
	TA_Pick_Ore(6,0,10,0,"NW_CASTLEMINE_13");
	TA_Sit_Bench(10,0,14,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
	TA_Stand_Eating(14,0,16,0,"NW_CASTLEMINE_HUT_03_NIK");
	TA_Pick_Ore(16,0,20,0,"NW_CASTLEMINE_13");
	TA_Sit_Campfire(20,0,6,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
};
