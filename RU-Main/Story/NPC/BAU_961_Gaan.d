
instance BAU_961_Gaan(Npc_Default)
{
	name[0] = "Гаан";
	guild = GIL_NONE;
	id = 961;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_961;
};


func void Rtn_PreStart_961()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM3_PATH_LEVELCHANGE_02_2");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM3_PATH_LEVELCHANGE_02_2");
};

func void Rtn_Start_961()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM3_GAAN");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM3_STABLE_REST_01");
};

func void Rtn_PreRangerMeeting_961()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_03");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_03");
};

func void Rtn_RangerMeeting_961()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_961()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_ArmsCrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_orcatcbegan_961()
{
	TA_Stand_Guarding(6,55,20,30,"NW_HUNTERCAMP_GAAN");
	TA_Stand_Guarding(20,30,6,55,"NW_HUNTERCAMP_GAAN");
};

func void rtn_campon_961()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_09");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_09");
};

func void rtn_inbattle_961()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8756");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8756");
};

