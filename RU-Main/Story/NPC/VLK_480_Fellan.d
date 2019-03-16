
instance VLK_480_Fellan(Npc_Default)
{
	name[0] = "Феллан";
	guild = GIL_NONE;
	id = 480;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_MM_RestStart] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal19,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_480;
};


func void Rtn_Start_480()
{
	TA_Repair_Hut(4,30,8,0,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut(8,0,12,0,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut(12,0,16,0,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut(16,0,20,0,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut(20,0,1,30,"NW_CITY_PATH_HABOUR_09");
	TA_Sleep(1,30,4,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};

func void Rtn_OhneHammer_480()
{
	TA_Sit_Bench(6,0,23,0,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sleep(23,0,6,0,"NW_CITY_HABOUR_HUT_05_BED_01");
};

func void rtn_insane_480()
{
	TA_Stand_ArmsCrossed(6,0,23,0,"NW_FELLAN_REPAIR_01");
	TA_Stand_ArmsCrossed(23,0,6,0,"NW_FELLAN_REPAIR_01");
};

func void rtn_tot_480()
{
	TA_Stand_WP(6,0,23,0,"TOT");
	TA_Stand_WP(23,0,6,0,"TOT");
};

func void rtn_insanepath_480()
{
	TA_Stand_ArmsCrossed(9,0,10,0,"NW_FOREST_PATH_35_MONSTER");
	TA_Stand_ArmsCrossed(10,0,11,0,"NW_FOREST_PATH_80_1_MOVEMENT8_M4");
	TA_Stand_ArmsCrossed(11,0,12,0,"NW_FOREST_PATH_80_1_MOVEMENT");
	TA_Stand_ArmsCrossed(12,0,13,0,"NW_FOREST_PATH_75");
	TA_Stand_ArmsCrossed(13,0,14,0,"NW_FOREST_PATH_71");
	TA_Stand_ArmsCrossed(14,0,15,0,"NW_FOREST_PATH_62");
	TA_Stand_ArmsCrossed(15,0,16,0,"NW_TROLLAREA_RITUALFOREST_15");
	TA_Stand_ArmsCrossed(16,0,17,0,"NW_TROLLAREA_RITUAL_06");
	TA_Stand_ArmsCrossed(17,0,18,0,"NW_TROLLAREA_RITUALFOREST_03");
	TA_Stand_ArmsCrossed(18,0,19,0,"NW_TROLLAREA_PATH_74");
	TA_Stand_ArmsCrossed(19,0,20,0,"NW_TROLLAREA_PATH_25");
	TA_Stand_ArmsCrossed(20,0,21,0,"NW_TROLLAREA_RUINS_22");
	TA_Stand_ArmsCrossed(21,0,22,0,"NW_TROLLAREA_RUINS_05");
	TA_Stand_ArmsCrossed(22,0,23,0,"NW_TROLLAREA_PATH_47_01");
	TA_Stand_ArmsCrossed(23,0,0,0,"NW_TROLLAREA_PATH_58");
	TA_Stand_ArmsCrossed(0,0,1,0,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	TA_Stand_ArmsCrossed(1,0,2,0,"NW_BIGFARM_LAKE_MONSTER_03_01");
	TA_Stand_ArmsCrossed(2,0,3,0,"NW_RUMBOLD_FLUCHT2");
	TA_Stand_ArmsCrossed(3,0,4,0,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
	TA_Stand_ArmsCrossed(4,0,5,0,"NW_FARM3_PATH_11_SMALLRIVER_03");
	TA_Stand_ArmsCrossed(5,0,6,0,"NW_FARM2_TO_TAVERN_09_MONSTER");
	TA_Stand_ArmsCrossed(6,0,7,0,"NW_FOREST_PATH_02");
	TA_Stand_ArmsCrossed(7,0,8,0,"NW_FOREST_PATH_18_MONSTER");
	TA_Stand_ArmsCrossed(8,0,9,0,"NW_FOREST_PATH_31_NAVIGATION");
};

func void rtn_insanepathnext_480()
{
	TA_Stand_ArmsCrossed(21,0,22,0,"NW_FOREST_PATH_35_MONSTER");
	TA_Stand_ArmsCrossed(22,0,23,0,"NW_FOREST_PATH_80_1_MOVEMENT8_M4");
	TA_Stand_ArmsCrossed(23,0,0,0,"NW_FOREST_PATH_80_1_MOVEMENT");
	TA_Stand_ArmsCrossed(0,0,1,0,"NW_FOREST_PATH_75");
	TA_Stand_ArmsCrossed(1,0,2,0,"NW_FOREST_PATH_71");
	TA_Stand_ArmsCrossed(2,0,3,0,"NW_FOREST_PATH_62");
	TA_Stand_ArmsCrossed(3,0,4,0,"NW_TROLLAREA_RITUALFOREST_15");
	TA_Stand_ArmsCrossed(4,0,5,0,"NW_TROLLAREA_RITUAL_06");
	TA_Stand_ArmsCrossed(5,0,6,0,"NW_TROLLAREA_RITUALFOREST_03");
	TA_Stand_ArmsCrossed(6,0,7,0,"NW_TROLLAREA_PATH_74");
	TA_Stand_ArmsCrossed(7,0,8,0,"NW_TROLLAREA_PATH_25");
	TA_Stand_ArmsCrossed(8,0,9,0,"NW_TROLLAREA_RUINS_22");
	TA_Stand_ArmsCrossed(9,0,10,0,"NW_TROLLAREA_RUINS_05");
	TA_Stand_ArmsCrossed(10,0,11,0,"NW_TROLLAREA_PATH_47_01");
	TA_Stand_ArmsCrossed(11,0,12,0,"NW_TROLLAREA_PATH_58");
	TA_Stand_ArmsCrossed(12,0,13,0,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	TA_Stand_ArmsCrossed(13,0,14,0,"NW_BIGFARM_LAKE_MONSTER_03_01");
	TA_Stand_ArmsCrossed(14,0,15,0,"NW_RUMBOLD_FLUCHT2");
	TA_Stand_ArmsCrossed(15,0,16,0,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
	TA_Stand_ArmsCrossed(16,0,17,0,"NW_FARM3_PATH_11_SMALLRIVER_03");
	TA_Stand_ArmsCrossed(17,0,18,0,"NW_FARM2_TO_TAVERN_09_MONSTER");
	TA_Stand_ArmsCrossed(18,0,19,0,"NW_FOREST_PATH_02");
	TA_Stand_ArmsCrossed(19,0,20,0,"NW_FOREST_PATH_18_MONSTER");
	TA_Stand_ArmsCrossed(20,0,21,0,"NW_FOREST_PATH_31_NAVIGATION");
};