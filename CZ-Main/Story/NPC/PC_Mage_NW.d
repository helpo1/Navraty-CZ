
instance PC_Mage_NW(Npc_Default)
{
	name[0] = "Milten";
	guild = GIL_KDF;
	id = 12;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	aivar[AIV_IgnoresArmor] = TRUE;
	CreateInvItems(self,itke_miltenkey_nw,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_12;
};

func void Rtn_Start_12()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_MILTEN");
	TA_Sit_Bench(23,0,8,0,"NW_MONASTERY_ENTRY_01_BENCH");
};

func void Rtn_WaitForShip_12()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_WAY_TO_SHIP_19");
	TA_Smalltalk(23,0,8,0,"NW_CITY_WAY_TO_SHIP_19");
};

func void Rtn_ShipOff_12()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_ENTRY_01");
	TA_Sit_Bench(23,0,8,0,"NW_MONASTERY_ENTRY_01_BENCH");
};

func void Rtn_Ship_12()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_19");
};

func void rtn_tot_12()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_orcatcnw_12()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_GRASS_05");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_GRASS_05");
};

func void rtn_shipnew_12()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_01");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_01");
};

func void rtn_inbattle_12()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_13");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_13");
};

func void rtn_fleefrombattle_12()
{
	TA_FleeToWp(8,0,22,0,"NW_TROLLAREA_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_TROLLAREA_PATH_04");
};

func void rtn_campon_12()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_12");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_12");
};

func void rtn_lost_12()
{
	TA_Stand_Guarding(9,0,23,0,"NW_TROLLAREA_PATH_04");
	TA_Stand_Guarding(23,0,9,0,"NW_TROLLAREA_PATH_04");
};

func void rtn_follow_12()
{
	TA_Follow_Player(5,0,20,0,"BIGFARM");
	TA_Follow_Player(20,0,5,0,"BIGFARM");
};