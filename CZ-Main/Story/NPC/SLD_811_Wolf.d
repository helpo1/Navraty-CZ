
instance SLD_811_Wolf(Npc_Default)
{
	name[0] = "Wolf";
	guild = GIL_SLD;
	id = 811;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_wolf_waffer);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Wolf,BodyTex_N,ITAR_SLD_L_V1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_811;
};


func void Rtn_PreStart_811()
{
	TA_PracticeBow(5,0,8,0,"NW_BIGFARM_WOLFAIM_01");
	TA_Sit_Bench(8,0,18,0,"NW_BIGFARM_PATH_03");
	TA_Play_Lute(18,0,21,0,"NW_BIGFARM_CAMPON_PSI_GURU_03");
	TA_Stand_Eating(21,0,5,0,"NW_BIGFARM_KITCHEN_03");
};

func void Rtn_Start_811()
{
	TA_PracticeBow(5,0,8,0,"NW_BIGFARM_WOLFAIM_01");
	TA_Sit_Bench(8,0,18,0,"NW_BIGFARM_PATH_03");
	TA_Sit_Bench(18,0,21,0,"NW_BIGFARM_PATH_03");
	TA_Stand_Eating(21,0,5,0,"NW_BIGFARM_KITCHEN_03");
};

func void Rtn_BengarsFarm_811()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM3_PATH_01");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM3_PATH_01");
};

func void Rtn_BengarDead_811()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM3_BENGAR");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM3_BENGAR");
};

func void Rtn_WaitForShip_811()
{
	TA_Sit_Bench(8,0,19,0,"NW_WAITFOR_SHIP_01");
	TA_Sit_Bench(19,0,8,0,"NW_WAITFOR_SHIP_01");
};

func void Rtn_Ship_811()
{
	TA_Stand_Guarding(6,0,7,0,"SHIP_DECK_29");
	TA_Stand_Guarding(7,0,7,10,"SHIP_DECK_25");
	TA_Stand_Guarding(7,10,7,20,"SHIP_DECK_29");
	TA_Stand_Guarding(7,20,7,30,"SHIP_DECK_25");
	TA_Stand_Guarding(7,30,7,40,"SHIP_DECK_29");
	TA_Stand_Guarding(7,40,7,50,"SHIP_DECK_20");
	TA_Stand_Guarding(7,50,8,0,"SHIP_DECK_29");
	TA_Stand_Guarding(8,0,8,10,"SHIP_DECK_25");
	TA_Stand_Guarding(8,10,8,20,"SHIP_DECK_29");
	TA_Stand_Guarding(8,20,8,30,"SHIP_DECK_25");
	TA_Stand_Guarding(8,30,8,40,"SHIP_DECK_29");
	TA_Stand_Guarding(8,40,8,50,"SHIP_DECK_20");
	TA_Stand_Guarding(8,50,9,0,"SHIP_DECK_29");
	TA_Stand_Guarding(9,0,9,10,"SHIP_DECK_25");
	TA_Stand_Guarding(9,10,9,20,"SHIP_DECK_29");
	TA_Stand_Guarding(9,20,9,30,"SHIP_DECK_25");
	TA_Stand_Guarding(9,30,9,40,"SHIP_DECK_29");
	TA_Stand_Guarding(9,40,9,50,"SHIP_DECK_20");
	TA_Stand_Guarding(9,50,10,0,"SHIP_DECK_29");
	TA_Stand_Guarding(10,0,10,10,"SHIP_DECK_25");
	TA_Stand_Guarding(10,10,10,20,"SHIP_DECK_29");
	TA_Stand_Guarding(10,20,10,30,"SHIP_DECK_25");
	TA_Stand_Guarding(10,30,10,40,"SHIP_DECK_29");
	TA_Stand_Guarding(10,40,10,50,"SHIP_DECK_20");
	TA_Stand_Guarding(10,50,11,0,"SHIP_DECK_29");
	TA_Stand_Guarding(11,0,11,10,"SHIP_DECK_25");
	TA_Stand_Guarding(11,10,11,20,"SHIP_DECK_29");
	TA_Stand_Guarding(11,20,11,30,"SHIP_DECK_25");
	TA_Stand_Guarding(11,30,11,40,"SHIP_DECK_29");
	TA_Stand_Guarding(11,40,11,50,"SHIP_DECK_20");
	TA_Stand_Guarding(11,50,12,0,"SHIP_DECK_29");
	TA_Stand_Guarding(12,0,12,10,"SHIP_DECK_25");
	TA_Stand_Guarding(12,10,12,20,"SHIP_DECK_29");
	TA_Stand_Guarding(12,20,12,30,"SHIP_DECK_25");
	TA_Stand_Guarding(12,30,12,40,"SHIP_DECK_29");
	TA_Stand_Guarding(12,40,12,50,"SHIP_DECK_20");
	TA_Stand_Guarding(12,50,13,0,"SHIP_DECK_29");
	TA_Stand_Guarding(13,0,13,10,"SHIP_DECK_25");
	TA_Stand_Guarding(13,10,13,20,"SHIP_DECK_29");
	TA_Stand_Guarding(13,20,13,30,"SHIP_DECK_25");
	TA_Stand_Guarding(13,30,13,40,"SHIP_DECK_29");
	TA_Stand_Guarding(13,40,13,50,"SHIP_DECK_20");
	TA_Stand_Guarding(13,50,14,0,"SHIP_DECK_29");
	TA_Stand_Guarding(14,0,14,10,"SHIP_DECK_25");
	TA_Stand_Guarding(14,10,14,20,"SHIP_DECK_29");
	TA_Stand_Guarding(14,20,14,30,"SHIP_DECK_25");
	TA_Stand_Guarding(14,30,14,40,"SHIP_DECK_29");
	TA_Stand_Guarding(14,40,14,50,"SHIP_DECK_20");
	TA_Stand_Guarding(14,50,15,0,"SHIP_DECK_29");
	TA_Stand_Guarding(15,0,15,10,"SHIP_DECK_25");
	TA_Stand_Guarding(15,10,15,20,"SHIP_DECK_29");
	TA_Stand_Guarding(15,20,15,30,"SHIP_DECK_25");
	TA_Stand_Guarding(15,30,15,40,"SHIP_DECK_29");
	TA_Stand_Guarding(15,40,15,50,"SHIP_DECK_20");
	TA_Stand_Guarding(15,50,16,0,"SHIP_DECK_29");
	TA_Stand_Guarding(16,0,16,10,"SHIP_DECK_25");
	TA_Stand_Guarding(16,10,16,20,"SHIP_DECK_29");
	TA_Stand_Guarding(16,20,16,30,"SHIP_DECK_25");
	TA_Stand_Guarding(16,30,16,40,"SHIP_DECK_29");
	TA_Stand_Guarding(16,40,16,50,"SHIP_DECK_29");
	TA_Stand_Guarding(16,50,17,0,"SHIP_DECK_29");
	TA_Stand_Guarding(17,0,17,10,"SHIP_DECK_25");
	TA_Stand_Guarding(17,10,17,20,"SHIP_DECK_29");
	TA_Stand_Guarding(17,20,17,30,"SHIP_DECK_25");
	TA_Stand_Guarding(17,30,17,40,"SHIP_DECK_29");
	TA_Stand_Guarding(17,40,17,50,"SHIP_DECK_20");
	TA_Stand_Guarding(17,50,18,0,"SHIP_DECK_29");
	TA_Stand_Guarding(18,0,18,10,"SHIP_DECK_25");
	TA_Stand_Guarding(18,10,18,20,"SHIP_DECK_29");
	TA_Stand_Guarding(18,20,18,30,"SHIP_DECK_25");
	TA_Stand_Guarding(18,30,18,40,"SHIP_DECK_29");
	TA_Stand_Guarding(18,40,18,50,"SHIP_DECK_20");
	TA_Stand_Guarding(18,50,19,0,"SHIP_DECK_29");
	TA_Stand_Guarding(19,0,19,10,"SHIP_DECK_25");
	TA_Stand_Guarding(19,10,19,20,"SHIP_DECK_29");
	TA_Stand_Guarding(19,20,19,30,"SHIP_DECK_25");
	TA_Stand_Guarding(19,30,19,40,"SHIP_DECK_29");
	TA_Stand_Guarding(19,40,19,50,"SHIP_DECK_20");
	TA_Stand_Guarding(19,50,20,0,"SHIP_DECK_29");
	TA_Stand_Guarding(20,0,20,10,"SHIP_DECK_25");
	TA_Stand_Guarding(20,10,20,20,"SHIP_DECK_29");
	TA_Stand_Guarding(20,20,20,30,"SHIP_DECK_25");
	TA_Stand_Guarding(20,30,20,40,"SHIP_DECK_29");
	TA_Stand_Guarding(20,40,20,50,"SHIP_DECK_20");
	TA_Stand_Guarding(20,50,21,0,"SHIP_DECK_29");
	TA_Stand_Guarding(21,0,21,10,"SHIP_DECK_25");
	TA_Stand_Guarding(21,10,21,20,"SHIP_DECK_29");
	TA_Stand_Guarding(21,20,21,30,"SHIP_DECK_25");
	TA_Stand_Guarding(21,30,21,40,"SHIP_DECK_29");
	TA_Stand_Guarding(21,40,21,50,"SHIP_DECK_20");
	TA_Stand_Guarding(21,50,22,0,"SHIP_DECK_29");
	TA_Stand_Guarding(22,0,23,0,"SHIP_DECK_25");
	TA_Stand_Guarding(23,0,0,0,"SHIP_DECK_29");
	TA_Stand_Guarding(0,0,1,0,"SHIP_DECK_25");
	TA_Stand_Guarding(1,0,2,0,"SHIP_DECK_20");
	TA_Stand_Guarding(2,0,3,0,"SHIP_DECK_29");
	TA_Stand_Guarding(3,0,4,0,"SHIP_DECK_20");
	TA_Stand_Guarding(4,0,5,0,"SHIP_DECK_29");
	TA_Stand_Guarding(5,0,6,0,"SHIP_DECK_25");
};

func void rtn_tot_811()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_811()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_14");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_14");
};

func void rtn_capturethrbattle_811()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void rtn_killhim_811()
{
	TA_Stand_WP(8,0,20,0,"NW_CITY_HABOUR_PUFF_03");
	TA_Stand_WP(20,0,8,0,"NW_CITY_HABOUR_PUFF_03");
};

func void rtn_inbattle_811()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_04");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_04");
};

func void rtn_fleefrombattle_811()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_intower_811()
{
	TA_Stand_Guarding(8,0,12,0,"NW_CASTLEMINE_TOWER_STAND_01");
	TA_Smith_Sharp(12,0,16,0,"NW_CASTLEMINE_TOWER_REP_HUT_SMITH_02");
	TA_Sit_Bench(16,0,19,0,"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
	TA_Stand_Eating(19,0,23,0,"NW_CASTLEMINE_HUT_03");
	TA_Sit_Campfire(23,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
};

instance SLD_8111_Soeldner(Npc_Default)
{
	name[0] = "Stráž tábora";
	guild = GIL_NONE;
	id = 8111;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal05,BodyTex_N,ItAr_Sld_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_8111;
};

func void Rtn_Start_8111()
{
	TA_Saw(8,0,11,0,"NW_CASTLEMINE_TOWER__MOBSI");
	TA_Stand_Guarding(11,0,22,0,"NW_CASTLEMINE_01");
	TA_Sit_Bench(22,0,8,0,"NW_CASTLEMINE_HUT_BENCH_CAVE");
};

instance SLD_8112_SOELDNER(Npc_Default)
{
	name[0] = "Stráž tábora";
	guild = GIL_SLD;
	id = 8112;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_prestart_8112;
};

func void rtn_prestart_8112()
{
	TA_Stand_Guarding(8,0,22,0,"NW_DARKMASTER_02_03");
	TA_Stand_Guarding(22,0,8,0,"NW_DARKMASTER_02_03");
};