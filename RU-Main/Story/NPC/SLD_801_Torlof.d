
instance SLD_801_Torlof(Npc_Default)
{
	name[0] = "Торлоф";
	guild = GIL_SLD;
	id = 801;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_torlof_axt);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Torlof,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_PreStart_801;
};


func void Rtn_PreStart_801()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_TORLOF");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_TORLOF");
};

func void Rtn_Start_801()
{
	TA_Stand_Guarding(8,0,19,0,"NW_BIGFARM_TORLOF");
	TA_Sit_Chair(19,0,23,0,"NW_BIGFARM_HOUSE_UP2_07");
	TA_Sleep(23,0,8,0,"NW_BIGFARM_HOUSE_UP2_02");
};

func void Rtn_WaitForShipCaptain_801()
{
	TA_Sit_Bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	TA_Sit_Bench(20,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void Rtn_AllOnBoard_801()
{
	TA_Study_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_tot_801()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_801()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_CREW_06");
	TA_Stand_Guarding(22,0,8,0,"SHIP_CREW_06");
};

func void rtn_capturethrbattle_801()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_BORKA");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_BORKA");
};

func void rtn_inbattle_801()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8754");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8754");
};

func void rtn_fleefrombattle_801()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_edngame_801()
{
	ta_edngame(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_edngame(23,0,8,0,"SHIP_CREW_CAPTAIN");
};

func void rtn_ship_801()
{
	TA_Study_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

