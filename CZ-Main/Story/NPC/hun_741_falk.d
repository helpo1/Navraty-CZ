
instance HUN_741_FALK(Npc_Default)
{
	name[0] = "Falk";
	guild = GIL_NONE;
	id = 741;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,4);
	aivar[AIV_ToughGuy] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_master_01);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",FACE_N_FALK,BodyTex_N,ItAr_HuntArmor_H_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_741;
};


func void rtn_start_741()
{
	TA_Practice_Sword(8,0,20,0,"NW_HUNTERCAMP_02");
	TA_Sit_Bench(20,0,8,0,"NW_HUNTERCAMP_04");
};

func void rtn_huntslokers_741()
{
	TA_Stand_ArmsCrossed(8,0,11,0,"NW_TROLLAREA_PATH_49");
	TA_Stand_ArmsCrossed(11,0,14,0,"NW_BIGFARM_SHEEP1_02");
	TA_Stand_ArmsCrossed(14,0,17,0,"NW_FARM3_PATH_03");
	TA_Stand_ArmsCrossed(17,0,20,0,"NW_CITY_TO_FARM2_05_MOV3");
	TA_Stand_ArmsCrossed(20,0,23,0,"NW_XARDAS_PATH_FARM1_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_HUNTERCAMP_04");
};

func void rtn_campon_741()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_04");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_04");
};

func void rtn_inbattle_741()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_10");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_10");
};

func void rtn_fleefrombattle_741()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_ship_741()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_CREW_04");
	TA_Stand_ArmsCrossed(23,0,8,0,"SHIP_CREW_04");
};

