
instance PC_Psionic(Npc_Default)
{
	name[0] = "Lester";
	guild = GIL_NONE;
	id = 4;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_CreateAmbientInv(self);
	EquipItem(self,itmw_lester_sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Lester,BodyTex_P,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_4;
};

func void Rtn_Start_4()
{
	TA_Sit_Campfire(8,0,23,0,"NW_XARDAS_TOWER_LESTER");
	TA_Sit_Campfire(23,0,8,0,"NW_XARDAS_TOWER_LESTER");
};

func void Rtn_Xardas_4()
{
	TA_Read_Bookstand(8,0,14,10,"NW_XARDAS_TOWER_IN1_23_LESTER");
	TA_Smoke_Joint(14,0,20,0,"NW_XARDAS_TOWER_IN1_23_LESTER");
	TA_Sleep(20,0,8,0,"NW_XARDAS_TOWER_IN1_31");
};

func void Rtn_Nergal_4()
{
	TA_Smoke_Joint(14,0,20,0,"NW_XARDAS_TOWER_IN1_23_LESTER");
	TA_Smoke_Joint(20,0,14,0,"NW_XARDAS_TOWER_IN1_23_LESTER");
};

func void rtn_xardastow_4()
{
	TA_Sit_Throne(8,30,12,30,"NW_XARDAS_TOWER_IN1_32");
	TA_Read_Bookstand(12,30,18,10,"NW_XARDAS_TOWER_IN1_23_LESTER");
	TA_Smoke_Joint(18,10,22,30,"NW_XARDAS_TOWER_IN1_23_LESTER");
	TA_Sleep(22,30,8,30,"NW_XARDAS_TOWER_IN1_31");
};

func void Rtn_XardasWeg_4()
{
	TA_Stand_Guarding(8,0,23,0,"NW_XARDAS_TOWER_02");
	TA_Stand_Guarding(23,0,8,0,"NW_XARDAS_TOWER_02");
};

func void Rtn_WaitForPlayer_4()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_ENTERVALLEY_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_ENTERVALLEY_02");
};

func void Rtn_WaitForShip_4()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_WAY_TO_SHIP_19");
	TA_Smalltalk(23,0,8,0,"NW_CITY_WAY_TO_SHIP_19");
};

func void Rtn_ShipOff_4()
{
	TA_Stand_Guarding(8,0,23,0,"NW_XARDAS_TOWER_02");
	TA_Stand_Guarding(23,0,8,0,"NW_XARDAS_TOWER_02");
};

func void Rtn_Ship_4()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_19");
};

func void rtn_tot_4()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_orcatcnw_4()
{
	TA_Stand_Guarding(8,0,23,0,"WP_NW_PSICAMP_PATH_LESTER");
	TA_Stand_Guarding(23,0,8,0,"WP_NW_PSICAMP_PATH_LESTER");
};

func void rtn_shipnew_4()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP");
	TA_Stand_Guarding(22,0,8,0,"SHIP");
};

func void rtn_capturethrbattle_4()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void rtn_campon_4()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_10");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_10");
};

func void rtn_inbattle_4()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_02");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_02");
};

func void rtn_fleefrombattle_4()
{
	TA_FleeToWp(8,0,22,0,"NW_XARDAS_TOWER_LESTER");
	TA_FleeToWp(22,0,8,0,"NW_XARDAS_TOWER_LESTER");
};

func void rtn_lost_4()
{
	TA_Sit_Campfire(9,0,23,0,"NW_XARDAS_TOWER_LESTER");
	TA_Sit_Campfire(23,0,9,0,"NW_XARDAS_TOWER_LESTER");
};

func void rtn_follow_4()
{
	TA_Follow_Player(5,0,20,0,"BIGFARM");
	TA_Follow_Player(20,0,5,0,"BIGFARM");
};

