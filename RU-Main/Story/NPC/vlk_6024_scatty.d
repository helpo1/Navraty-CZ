
instance VLK_6024_SCATTY(Npc_Default)
{
	name[0] = "Скатти";
	guild = GIL_MIL;
	id = 6024;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Schwert5);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Scatty,BodyTex_L,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1.6);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = rtn_start_6024;
};

func void rtn_start_6024()
{
	TA_Sit_Bench(6,55,14,0,"NW_CITY_SCATTY");
	TA_Stand_Guarding(14,0,20,30,"NW_CITY_HABOUR_KASERN_WIRT");
	TA_Practice_Sword(20,30,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_03");
};

func void rtn_orcatcbegan_6024()
{
	TA_Sit_Chair(6,55,20,30,"NW_FARM2_HOUSE_IN_07");
	TA_Sit_Chair(20,30,6,55,"NW_FARM2_HOUSE_IN_07");
};

func void rtn_follow_6024()
{
	TA_Follow_Player(5,0,20,0,"NW_FARM2_HOUSE_IN_07");
	TA_Follow_Player(20,0,5,0,"NW_FARM2_HOUSE_IN_07");
};

func void rtn_farmrest_6024()
{
	TA_Sit_Campfire(5,0,20,0,"NW_BIGFARM_SCATTY");
	TA_Sit_Campfire(20,0,5,0,"NW_BIGFARM_SCATTY");
};

func void rtn_killhim_6024()
{
	TA_Stand_WP(5,0,20,0,"NW_FARM2_PATH_01");
	TA_Stand_WP(20,0,5,0,"NW_FARM2_PATH_01");
};

func void rtn_inbattle_6024()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_05");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_05");
};

