
instance BAU_4300_Addon_Cavalorn(Npc_Default)
{
	name[0] = "Cavalorn";
	guild = GIL_OUT;
	id = 4300;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 20;
	EquipItem(self,ItMw_1H_Sword_L_03);
	CreateInvItems(self,ItRw_Arrow,5);
	CreateInvItems(self,ItRw_Sld_Bow,1);
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ITAR_Bau_L,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Cavalorn,BodyTex_B,ITAR_RANGER_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_4300;
};

func void Rtn_Start_4300()
{
	TA_Cook_Campfire(5,0,20,0,"NW_XARDAS_GOBBO_01");
	TA_Cook_Campfire(20,0,5,0,"NW_XARDAS_GOBBO_01");
};

func void Rtn_KillBandits_4300()
{
	TA_RunToWP(5,0,20,0,"NW_XARDAS_BANDITS_LEFT");
	TA_RunToWP(20,0,5,0,"NW_XARDAS_BANDITS_LEFT");
};

func void Rtn_OrnamentSteinring_4300()
{
	TA_Stand_WP(5,0,20,0,"NW_LITTLESTONEHENDGE");
	TA_Stand_WP(20,0,5,0,"NW_LITTLESTONEHENDGE");
};

func void Rtn_PreRangerMeeting_4300()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_06");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_06");
};

func void Rtn_RangerMeeting_4300()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_4300()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_ArmsCrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Stadt_4300()
{
	TA_Sit_Bench(5,0,20,0,"NW_CITY_MERCHANT_PATH_15");
	TA_Sit_Bench(20,0,5,0,"NW_CITY_MERCHANT_PATH_15");
};

func void rtn_farmhide_4300()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_FARM2_TO_TAVERN_01");
	TA_Stand_ArmsCrossed(20,0,5,0,"NW_FARM2_TO_TAVERN_01");
};

func void rtn_follow_4300()
{
	TA_Follow_Player(5,0,20,0,"NW_FARM2_TO_TAVERN_01");
	TA_Follow_Player(20,0,5,0,"NW_FARM2_TO_TAVERN_01");
};

func void rtn_farmrest_4300()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_BIGFARM_CAVALORN");
	TA_Stand_Eating(20,0,5,0,"NW_BIGFARM_CAVALORN");
};

func void rtn_inbattle_4300()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8627");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8627");
};

func void rtn_fleefrombattle_4300()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

