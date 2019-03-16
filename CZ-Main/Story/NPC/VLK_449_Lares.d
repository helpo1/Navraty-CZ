
instance VLK_449_Lares(Npc_Default)
{
	name[0] = "Lares";
	guild = GIL_NONE;
	id = 449;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_lares_axt);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	CreateInvItems(self,ItPo_Health_02,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_ORC_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PreStart_449;
};


func void Rtn_PreStart_449()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_HABOUR_02_B");
	TA_Stand_Guarding(20,0,8,0,"NW_CITY_HABOUR_02_B");
};

func void Rtn_Start_449()
{
	TA_Stand_Guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void Rtn_Guide_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERNE_BIGFARM_05");
	TA_Guide_Player(20,0,8,0,"NW_TAVERNE_BIGFARM_05");
};

func void Rtn_GUIDEPORTALTEMPEL1_449()
{
	TA_Guide_Player(8,0,20,0,"NW_CITY_TO_FOREST_11");
	TA_Guide_Player(20,0,8,0,"NW_CITY_TO_FOREST_11");
};

func void Rtn_GUIDEPORTALTEMPEL2_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERN_TO_FOREST_02");
	TA_Guide_Player(20,0,8,0,"NW_TAVERN_TO_FOREST_02");
};

func void Rtn_GUIDEPORTALTEMPEL3_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERNE_TROLLAREA_14");
	TA_Guide_Player(20,0,8,0,"NW_TAVERNE_TROLLAREA_14");
};

func void Rtn_GUIDEPORTALTEMPEL4_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_PATH_58");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_PATH_58");
};

func void Rtn_GUIDEPORTALTEMPEL5_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_PATH_47");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_PATH_47");
};

func void Rtn_GUIDEPORTALTEMPEL6_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_RUINS_02");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_RUINS_02");
};

func void Rtn_GUIDEPORTALTEMPELEND_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TROLLAREA_RUINS_41");
	TA_Guide_Player(20,0,8,0,"NW_TROLLAREA_RUINS_41");
};

func void Rtn_GUIDEMEDIUMWALD1_449()
{
	TA_Guide_Player(8,0,20,0,"NW_CITY_TO_FARM2_04");
	TA_Guide_Player(20,0,8,0,"NW_CITY_TO_FARM2_04");
};

func void Rtn_GUIDEMEDIUMWALD2_449()
{
	TA_Guide_Player(8,0,20,0,"NW_FOREST_PATH_62");
	TA_Guide_Player(20,0,8,0,"NW_FOREST_PATH_62");
};

func void Rtn_PreRangerMeeting_449()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_03");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_03");
};

func void Rtn_RangerMeeting_449()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

func void Rtn_Parking_449()
{
	TA_Stand_WP(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
	TA_Stand_WP(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

func void Rtn_WaitForShip_449()
{
	TA_Smalltalk(8,0,20,0,"NW_WAITFOR_SHIP_05");
	TA_Smalltalk(20,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void Rtn_ShipOff_449()
{
	TA_Stand_Guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void Rtn_Ship_449()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

func void rtn_tot_449()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_orcatcnw_449()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_BIGFARM_PATH_LARES_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_BIGFARM_PATH_LARES_01");
};

func void rtn_shipnew_449()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_11");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_11");
};

func void rtn_capturethrbattle_449()
{
	TA_Sit_Campfire(8,0,23,0,"NW_CITY_ALHIMIK_INPRISION");
	TA_Sit_Campfire(23,0,8,0,"NW_CITY_ALHIMIK_INPRISION");
};

func void rtn_inbattle_449()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8755");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8755");
};

func void rtn_fleefrombattle_449()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_follow_449()
{
	TA_Follow_Player(5,0,20,0,"BIGFARM");
	TA_Follow_Player(20,0,5,0,"BIGFARM");
};

func void rtn_followrent_449()
{
	TA_Follow_Player(5,0,20,0,"NW_CITY_HABOUR_02_B");
	TA_Follow_Player(20,0,5,0,"NW_CITY_HABOUR_02_B");
};

