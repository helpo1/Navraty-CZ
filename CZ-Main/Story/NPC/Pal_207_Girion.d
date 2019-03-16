
instance Pal_207_Girion(Npc_Default)
{
	name[0] = "Girion";
	guild = GIL_PAL;
	id = 207;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	CreateInvItems(self,itri_quest_pal_ring,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lefty,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_207;
};


func void Rtn_Start_207()
{
	TA_Practice_Sword(6,0,7,3,"NW_CITY_GIRION");
	TA_Stand_ArmsCrossed(7,3,19,0,"NW_CITY_GIRION");
	TA_Sit_Chair(19,0,22,59,"NW_CITY_UPTOWN_HUT_03_IN");
	TA_Sleep(22,59,6,0,"NW_CITY_LEOMAR_BED_02");
};

func void Rtn_WaitForShip_207()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_WAY_TO_SHIP_25");
	TA_Stand_WP(23,0,8,0,"NW_CITY_WAY_TO_SHIP_25");
};

func void Rtn_Ship_207()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_18");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_18");
};

func void rtn_tot_207()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_207()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_07");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_07");
};

func void rtn_capturethrbattle_207()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_HALVOR");
};

func void rtn_killhim_207()
{
	TA_Stand_WP(8,0,20,0,"NW_CITY_MAINSTREET_08");
	TA_Stand_WP(20,0,8,0,"NW_CITY_MAINSTREET_08");
};

func void rtn_farm_207()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_BIGFARM_CAMPON_PIR_04");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_BIGFARM_CAMPON_PIR_04");
};

