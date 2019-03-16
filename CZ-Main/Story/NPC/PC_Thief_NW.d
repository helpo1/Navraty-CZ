
instance PC_Thief_NW(Npc_Default)
{
	name[0] = "Diego";
	guild = GIL_NONE;
	id = 21;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_diego_degen);
	aivar[AIV_IgnoresArmor] = TRUE;
	EquipItem(self,itrw_diego_bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_21;
};


func void Rtn_Start_21()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_MERCHANT_TRADE_02");
	TA_Stand_WP(23,0,8,0,"NW_CITY_MERCHANT_TRADE_02");
};

func void Rtn_Gerbrandt_21()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWN_PATH_23");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWN_PATH_23");
};

func void Rtn_WAITFORSHIP_21()
{
	TA_Smalltalk(8,0,23,0,"NW_WAITFOR_SHIP_05");
	TA_Smalltalk(23,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void Rtn_SHIP_21()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

func void rtn_tot_21()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_orcatcnw_21()
{
	TA_Sit_Bench(8,0,23,0,"NW_BIGFARM_HOUSE_OUT_05_THIEF");
	TA_Sit_Bench(23,0,8,0,"NW_BIGFARM_HOUSE_OUT_05_THIEF");
};

func void rtn_shipnew_21()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_04");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_04");
};

func void rtn_capturethrbattle_21()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void rtn_inbattle_21()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_PATH_CENTER_02");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_PATH_CENTER_02");
};

func void rtn_fleefrombattle_21()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_FOREST_05");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_FOREST_05");
};

func void rtn_lost_21()
{
	TA_Sit_Campfire(9,0,23,0,"NW_BIGFARM_FOREST_05");
	TA_Sit_Campfire(23,0,9,0,"NW_BIGFARM_FOREST_05");
};

func void rtn_follow_21()
{
	TA_Follow_Player(5,0,20,0,"BIGFARM");
	TA_Follow_Player(20,0,5,0,"BIGFARM");
};

