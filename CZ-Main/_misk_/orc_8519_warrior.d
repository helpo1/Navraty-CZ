
instance ORC_8519_WARRIOR(C_Npc)
{
	name[0] = CZ_NAME_Orc_Scout;
	guild = GIL_ORC;
	id = 8519;
	voice = 18;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ORCBOWMEN;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 20;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaScout",DEFAULT,DEFAULT,"Orc_HeadWarrior",8,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_03);
	EquipItem(self,itrw_crossbow_orc_light);
	CreateInvItems(self,ItRw_Bolt,10);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	daily_routine = rtn_start_8519;
};


func void rtn_start_8519()
{
	TA_Stand_Dementor(6,0,7,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(7,0,8,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(8,0,9,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(9,0,10,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(10,0,11,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(11,0,12,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(12,0,13,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(13,0,14,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(14,0,15,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(15,0,16,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(16,0,17,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(17,0,18,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(18,0,19,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(19,0,20,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(20,0,21,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(21,0,22,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(22,0,23,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(23,0,0,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(0,0,1,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(1,0,2,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(2,0,3,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(3,0,4,0,"NW_FOREST_PATH_14");
	TA_Stand_Dementor(4,0,5,0,"NW_FOREST_PATH_38");
	TA_Stand_Dementor(5,0,6,0,"NW_FOREST_PATH_14");
};

