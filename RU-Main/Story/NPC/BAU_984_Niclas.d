
instance BAU_984_Niclas(Npc_Default)
{
	name[0] = "Никлас";
	guild = GIL_NONE;
	id = 984;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart12,BodyTex_N,ItAr_HuntArmor_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_984;
};


func void Rtn_Start_984()
{
	TA_Sit_Campfire(8,0,23,0,"NW_CITY_JAEGER_SIT_99");
	TA_Sit_Campfire(23,0,8,0,"NW_CITY_JAEGER_SIT_99");
};

func void rtn_orcatcbegan_984()
{
	TA_Stand_Guarding(6,55,20,30,"NW_HUNTERCAMP_NICLAS");
	TA_Stand_Guarding(20,30,6,55,"NW_HUNTERCAMP_NICLAS");
};

func void rtn_InCastle_984()
{
	TA_Saw(8,0,10,0,"NW_CASTLEMINE_PATH_HUT_02");
	TA_MakeArrows(10,0,13,0,"NW_CASTLEMINE_HUT_08");
	TA_Stand_Guarding(13,0,18,0,"TOT");
	TA_Stand_Eating(18,0,22,0,"NW_CASTLEMINE_HUT_03_NIK");
	TA_Sit_Chair(22,0,8,0,"NW_CASTLEMINE_PATH_HUT_IN_SIT");
};

func void rtn_campon_984()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_HUN_05");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_HUN_05");
};

func void rtn_inbattle_984()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8766");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8766");
};

