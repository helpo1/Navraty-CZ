
instance ORC_8600_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8600;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8600;
};


func void rtn_start_8600()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_00");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_00");
};


instance ORC_8601_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8601;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8601;
};


func void rtn_start_8601()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_01");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_01");
};


instance ORC_8602_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8602;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8602;
};


func void rtn_start_8602()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_02");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_02");
};


instance ORC_8603_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8603;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8603;
};


func void rtn_start_8603()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_03");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_03");
};


instance ORC_8604_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8604;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8604;
};


func void rtn_start_8604()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_04");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_04");
};


instance ORC_8605_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8605;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8605;
};


func void rtn_start_8605()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_05");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_05");
};


instance ORC_8606_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8606;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8606;
};


func void rtn_start_8606()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_06");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_06");
};


instance ORC_8607_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8607;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8607;
};


func void rtn_start_8607()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_07");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_07");
};


instance ORC_8608_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8608;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8608;
};


func void rtn_start_8608()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_08");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_08");
};


instance ORC_8609_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8609;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8609;
};


func void rtn_start_8609()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_09");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_09");
};


instance ORC_8610_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8610;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8610;
};


func void rtn_start_8610()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_10");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_10");
};


instance ORC_8611_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8611;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8611;
};


func void rtn_start_8611()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_11");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_11");
};


instance ORC_8612_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8612;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8612;
};


func void rtn_start_8612()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_12");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_12");
};


instance ORC_8613_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8613;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8613;
};


func void rtn_start_8613()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_13");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_13");
};


instance ORC_8614_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8614;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8614;
};


func void rtn_start_8614()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_14");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_14");
};


instance ORC_8615_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8615;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8615;
};


func void rtn_start_8615()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_15");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_15");
};


instance ORC_8616_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8616;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8616;
};


func void rtn_start_8616()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_16");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_16");
};


instance ORC_8617_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8617;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8617;
};


func void rtn_start_8617()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_17");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_17");
};


instance ORC_8618_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8618;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8618;
};


func void rtn_start_8618()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_18");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_18");
};


instance ORC_8619_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8619;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8619;
};


func void rtn_start_8619()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_19");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_19");
};


instance ORC_8620_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8620;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8620;
};


func void rtn_start_8620()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_20");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_20");
};


instance ORC_8621_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8621;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8621;
};


func void rtn_start_8621()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_21");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_21");
};


instance ORC_8622_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8622;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8622;
};


func void rtn_start_8622()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_22");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_22");
};


instance ORC_8623_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8623;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8623;
};


func void rtn_start_8623()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_23");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_23");
};


instance ORC_8624_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8624;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8624;
};


func void rtn_start_8624()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_24");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_24");
};


instance ORC_8625_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8625;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8625;
};


func void rtn_start_8625()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_25");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_25");
};


instance ORC_8626_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8626;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8626;
};


func void rtn_start_8626()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_26");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_26");
};


instance ORC_8627_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8627;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8627;
};


func void rtn_start_8627()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_27");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_27");
};


instance ORC_8628_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8628;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8628;
};


func void rtn_start_8628()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_28");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_28");
};


instance ORC_8629_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8629;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8629;
};


func void rtn_start_8629()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_29");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_29");
};


instance ORC_8630_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8630;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8630;
};


func void rtn_start_8630()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_30");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_30");
};


instance ORC_8631_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8631;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8631;
};


func void rtn_start_8631()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_31");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_31");
};


instance ORC_8632_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8632;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8632;
};


func void rtn_start_8632()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_32");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_32");
};


instance ORC_8633_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8633;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8633;
};


func void rtn_start_8633()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_33");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_33");
};


instance ORC_8634_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8634;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8634;
};


func void rtn_start_8634()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_34");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_34");
};


instance ORC_8635_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8635;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8635;
};


func void rtn_start_8635()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_35");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_35");
};


instance ORC_8636_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8636;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8636;
};


func void rtn_start_8636()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_36");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_36");
};


instance ORC_8637_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8637;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8637;
};


func void rtn_start_8637()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_37");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_37");
};


instance ORC_8638_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8638;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8638;
};


func void rtn_start_8638()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_38");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_38");
};


instance ORC_8639_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8639;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8639;
};


func void rtn_start_8639()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_39");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_39");
};


instance ORC_8640_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8640;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8640;
};


func void rtn_start_8640()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_40");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_40");
};


instance ORC_8641_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8641;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8641;
};


func void rtn_start_8641()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_41");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_41");
};


instance ORC_8642_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8642;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8642;
};


func void rtn_start_8642()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_42");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_42");
};


instance ORC_8643_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8643;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8643;
};


func void rtn_start_8643()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_43");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_43");
};


instance ORC_8644_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8644;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8644;
};


func void rtn_start_8644()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_44");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_44");
};


instance ORC_8645_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8645;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8645;
};


func void rtn_start_8645()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_45");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_45");
};


instance ORC_8646_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8646;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8646;
};


func void rtn_start_8646()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_46");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_46");
};


instance ORC_8647_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8647;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8647;
};


func void rtn_start_8647()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_47");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_47");
};


instance ORC_8648_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8648;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8648;
};


func void rtn_start_8648()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_48");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_48");
};


instance ORC_8649_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8649;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8649;
};


func void rtn_start_8649()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_49");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_49");
};


instance ORC_8650_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8650;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8650;
};


func void rtn_start_8650()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_50");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_50");
};


instance ORC_8651_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8651;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8651;
};


func void rtn_start_8651()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_51");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_51");
};


instance ORC_8652_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8652;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8652;
};


func void rtn_start_8652()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_52");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_52");
};


instance ORC_8653_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8653;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8653;
};


func void rtn_start_8653()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_53");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_53");
};


instance ORC_8654_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8654;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8654;
};


func void rtn_start_8654()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_54");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_54");
};


instance ORC_8655_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8655;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8655;
};


func void rtn_start_8655()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_55");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_55");
};


instance ORC_8656_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8656;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8656;
};


func void rtn_start_8656()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_56");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_56");
};


instance ORC_8657_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8657;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8657;
};


func void rtn_start_8657()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_57");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_57");
};


instance ORC_8658_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8658;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8658;
};


func void rtn_start_8658()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_58");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_58");
};


instance ORC_8659_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8659;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8659;
};


func void rtn_start_8659()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_59");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_59");
};


instance ORC_8660_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8660;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8660;
};


func void rtn_start_8660()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_60");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_60");
};


instance ORC_8661_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8661;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8661;
};


func void rtn_start_8661()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_61");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_61");
};


instance ORC_8662_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8662;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8662;
};


func void rtn_start_8662()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_62");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_62");
};


instance ORC_8663_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8663;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8663;
};


func void rtn_start_8663()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_63");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_63");
};


instance ORC_8664_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8664;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8664;
};


func void rtn_start_8664()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_64");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_64");
};


instance ORC_8665_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8665;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8665;
};


func void rtn_start_8665()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_65");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_65");
};


instance ORC_8666_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8666;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8666;
};


func void rtn_start_8666()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_66");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_66");
};


instance ORC_8667_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8667;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8667;
};


func void rtn_start_8667()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_67");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_67");
};


instance ORC_8668_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8668;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8668;
};


func void rtn_start_8668()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_68");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_68");
};


instance ORC_8669_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8669;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8669;
};


func void rtn_start_8669()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_69");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_69");
};


instance ORC_8670_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8670;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8670;
};


func void rtn_start_8670()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_70");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_70");
};


instance ORC_8671_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8671;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8671;
};


func void rtn_start_8671()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_71");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_71");
};


instance ORC_8672_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8672;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8672;
};


func void rtn_start_8672()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_72");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_72");
};


instance ORC_8673_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8673;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8673;
};


func void rtn_start_8673()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_73");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_73");
};


instance ORC_8674_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8674;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8674;
};


func void rtn_start_8674()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_74");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_74");
};


instance ORC_8675_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8675;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8675;
};


func void rtn_start_8675()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_75");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_75");
};


instance ORC_8676_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8676;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8676;
};


func void rtn_start_8676()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_76");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_76");
};


instance ORC_8677_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8677;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8677;
};


func void rtn_start_8677()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_77");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_77");
};


instance ORC_8678_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8678;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8678;
};


func void rtn_start_8678()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_78");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_78");
};


instance ORC_8679_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8679;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8679;
};


func void rtn_start_8679()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_79");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_79");
};


instance ORC_8680_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8680;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8680;
};


func void rtn_start_8680()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_80");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_80");
};


instance ORC_8681_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8681;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8681;
};


func void rtn_start_8681()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_81");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_81");
};


instance ORC_8682_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8682;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8682;
};


func void rtn_start_8682()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_82");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_82");
};


instance ORC_8683_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8683;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8683;
};


func void rtn_start_8683()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_83");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_83");
};


instance ORC_8684_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8684;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8684;
};


func void rtn_start_8684()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_84");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_84");
};


instance ORC_8685_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8685;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8685;
};


func void rtn_start_8685()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_85");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_85");
};


instance ORC_8686_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8686;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8686;
};


func void rtn_start_8686()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_86");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_86");
};


instance ORC_8687_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8687;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8687;
};


func void rtn_start_8687()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_87");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_87");
};


instance ORC_8688_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8688;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8688;
};


func void rtn_start_8688()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_88");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_88");
};


instance ORC_8689_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8689;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8689;
};


func void rtn_start_8689()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_89");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_89");
};


instance ORC_8690_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8690;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8690;
};


func void rtn_start_8690()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_90");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_90");
};


instance ORC_8691_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8691;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8691;
};


func void rtn_start_8691()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_91");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_91");
};


instance ORC_8692_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8692;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8692;
};


func void rtn_start_8692()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_92");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_92");
};


instance ORC_8693_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8693;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8693;
};


func void rtn_start_8693()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_93");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_93");
};


instance ORC_8694_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8694;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8694;
};


func void rtn_start_8694()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_94");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_94");
};


instance ORC_8695_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8695;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8695;
};


func void rtn_start_8695()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_95");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_95");
};


instance ORC_8696_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8696;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8696;
};


func void rtn_start_8696()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_96");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_96");
};


instance ORC_8697_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8697;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8697;
};


func void rtn_start_8697()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_97");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_97");
};


instance ORC_8698_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8698;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8698;
};


func void rtn_start_8698()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_98");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_98");
};


instance ORC_8699_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8699;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8699;
};


func void rtn_start_8699()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_99");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_99");
};


instance ORC_8751_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8751;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8751;
};


func void rtn_start_8751()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_151");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_151");
};


instance ORC_8752_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8752;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8752;
};


func void rtn_start_8752()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_152");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_152");
};


instance ORC_8753_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8753;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8753;
};


func void rtn_start_8753()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_153");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_153");
};


instance ORC_8754_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8754;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8754;
};


func void rtn_start_8754()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_154");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_154");
};


instance ORC_8755_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8755;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8755;
};


func void rtn_start_8755()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_155");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_155");
};


instance ORC_8756_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8756;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8756;
};


func void rtn_start_8756()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_156");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_156");
};


instance ORC_8757_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8757;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8757;
};


func void rtn_start_8757()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_157");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_157");
};


instance ORC_8758_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8758;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8758;
};


func void rtn_start_8758()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_158");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_158");
};


instance ORC_8759_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8759;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8759;
};


func void rtn_start_8759()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_159");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_159");
};


instance ORC_8760_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8760;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8760;
};


func void rtn_start_8760()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_160");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_160");
};


instance ORC_8761_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8761;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8761;
};


func void rtn_start_8761()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_161");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_161");
};


instance ORC_8762_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8762;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8762;
};


func void rtn_start_8762()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_162");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_162");
};


instance ORC_8763_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8763;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8763;
};


func void rtn_start_8763()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_163");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_163");
};


instance ORC_8764_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8764;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8764;
};


func void rtn_start_8764()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_164");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_164");
};


instance ORC_8765_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8765;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8765;
};


func void rtn_start_8765()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_165");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_165");
};


instance ORC_8766_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8766;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8766;
};


func void rtn_start_8766()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_166");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_166");
};


instance ORC_8767_BIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_Warrior;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8767;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcAxe_03);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",0,0,"Orc_HeadWarrior",0,0,-1);
	daily_routine = rtn_start_8767;
};


func void rtn_start_8767()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_167");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_167");
};


instance ORC_8700_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8700;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8700;
};


func void rtn_start_8700()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_100");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_100");
};


instance ORC_8701_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8701;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8701;
};


func void rtn_start_8701()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_101");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_101");
};


instance ORC_8702_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8702;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8702;
};


func void rtn_start_8702()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_102");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_102");
};


instance ORC_8703_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8703;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8703;
};


func void rtn_start_8703()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_103");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_103");
};


instance ORC_8704_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8704;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8704;
};


func void rtn_start_8704()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_104");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_104");
};


instance ORC_8705_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8705;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8705;
};


func void rtn_start_8705()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_105");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_105");
};


instance ORC_8706_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8706;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8706;
};


func void rtn_start_8706()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_106");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_106");
};


instance ORC_8707_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8707;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8707;
};


func void rtn_start_8707()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_107");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_107");
};


instance ORC_8708_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8708;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8708;
};


func void rtn_start_8708()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_108");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_108");
};


instance ORC_8709_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8709;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8709;
};


func void rtn_start_8709()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_109");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_109");
};


instance ORC_8710_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8710;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8710;
};


func void rtn_start_8710()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_110");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_110");
};


instance ORC_8711_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8711;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8711;
};


func void rtn_start_8711()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_111");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_111");
};


instance ORC_8712_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8712;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8712;
};


func void rtn_start_8712()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_112");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_112");
};


instance ORC_8713_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8713;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8713;
};


func void rtn_start_8713()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_113");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_113");
};


instance ORC_8714_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8714;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8714;
};


func void rtn_start_8714()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_114");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_114");
};


instance ORC_8715_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8715;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8715;
};


func void rtn_start_8715()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_115");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_115");
};


instance ORC_8716_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8716;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8716;
};


func void rtn_start_8716()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_116");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_116");
};


instance ORC_8717_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8717;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8717;
};


func void rtn_start_8717()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_117");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_117");
};


instance ORC_8718_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8718;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8718;
};


func void rtn_start_8718()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_118");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_118");
};


instance ORC_8719_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8719;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8719;
};


func void rtn_start_8719()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_119");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_119");
};


instance ORC_8720_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8720;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8720;
};


func void rtn_start_8720()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_120");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_120");
};


instance ORC_8721_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8721;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8721;
};


func void rtn_start_8721()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_121");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_121");
};


instance ORC_8722_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8722;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8722;
};


func void rtn_start_8722()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_122");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_122");
};


instance ORC_8723_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8723;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8723;
};


func void rtn_start_8723()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_123");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_123");
};


instance ORC_8724_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8724;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8724;
};


func void rtn_start_8724()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_124");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_124");
};


instance ORC_8725_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8725;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8725;
};


func void rtn_start_8725()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_125");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_125");
};


instance ORC_8726_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8726;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8726;
};


func void rtn_start_8726()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_126");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_126");
};


instance ORC_8727_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8727;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8727;
};


func void rtn_start_8727()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_127");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_127");
};


instance ORC_8728_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8728;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8728;
};


func void rtn_start_8728()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_128");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_128");
};


instance ORC_8729_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8729;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8729;
};


func void rtn_start_8729()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_129");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_129");
};


instance ORC_8730_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8730;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8730;
};


func void rtn_start_8730()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_130");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_130");
};


instance ORC_8731_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8731;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8731;
};


func void rtn_start_8731()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_131");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_131");
};


instance ORC_8732_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8732;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8732;
};


func void rtn_start_8732()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_132");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_132");
};


instance ORC_8733_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8733;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8733;
};


func void rtn_start_8733()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_133");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_133");
};


instance ORC_8734_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8734;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8734;
};


func void rtn_start_8734()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_134");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_134");
};


instance ORC_8735_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8735;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8735;
};


func void rtn_start_8735()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_135");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_135");
};


instance ORC_8736_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8736;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8736;
};


func void rtn_start_8736()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_136");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_136");
};


instance ORC_8737_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8737;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8737;
};


func void rtn_start_8737()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_137");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_137");
};


instance ORC_8738_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8738;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8738;
};


func void rtn_start_8738()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_138");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_138");
};


instance ORC_8739_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8739;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8739;
};


func void rtn_start_8739()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_139");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_139");
};


instance ORC_8740_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8740;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8740;
};


func void rtn_start_8740()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_140");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_140");
};


instance ORC_8741_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8741;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8741;
};


func void rtn_start_8741()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_141");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_141");
};


instance ORC_8742_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8742;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8742;
};


func void rtn_start_8742()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_142");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_142");
};


instance ORC_8743_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8743;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8743;
};


func void rtn_start_8743()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_143");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_143");
};


instance ORC_8744_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8744;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8744;
};


func void rtn_start_8744()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_144");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_144");
};


instance ORC_8745_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8745;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8745;
};


func void rtn_start_8745()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_145");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_145");
};


instance ORC_8746_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8746;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8746;
};


func void rtn_start_8746()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_146");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_146");
};


instance ORC_8747_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8747;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8747;
};


func void rtn_start_8747()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_ORC_147");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_ORC_147");
};


instance ORC_8800_COMMANDBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlackEliteCommander;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8800;
	voice = 18;
	level = 100;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,itmw_2h_orcsword_04);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit4",DEFAULT,DEFAULT,"Orc_HeadWarrior",4,DEFAULT,-1);
	daily_routine = rtn_start_8800;
};


func void rtn_start_8800()
{
	ta_orc_commandbigfight(5,0,23,0,"NW_BIGFIGHT_8750");
	ta_orc_commandbigfight(23,0,5,0,"NW_BIGFIGHT_8750");
};

func void rtn_inbattle_8800()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_LEE");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_LEE");
};


instance ORC_8801_COMMANDBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlackEliteElder;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8801;
	voice = 18;
	level = 60;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcSword_02);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	daily_routine = rtn_start_8801;
};


func void rtn_start_8801()
{
	ta_orc_guardbigfight(5,0,23,0,"NW_BIGFIGHT_ORC_149");
	ta_orc_guardbigfight(23,0,5,0,"NW_BIGFIGHT_ORC_149");
};

func void rtn_inbattle_8801()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_LEE");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_LEE");
};


instance ORC_8802_COMMANDBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlackEliteElder;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8802;
	voice = 18;
	level = 60;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	EquipItem(self,ItMw_2H_OrcSword_02);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit2",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	daily_routine = rtn_start_8802;
};


func void rtn_start_8802()
{
	ta_orc_guardbigfight(5,0,23,0,"NW_BIGFIGHT_ORC_148");
	ta_orc_guardbigfight(23,0,5,0,"NW_BIGFIGHT_ORC_148");
};

func void rtn_inbattle_8802()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_LEE");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_LEE");
};

func void rtn_inbattle_8600()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8600");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8600");
};

func void rtn_inbattle_8601()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8601");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8601");
};

func void rtn_inbattle_8602()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8602");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8602");
};

func void rtn_inbattle_8603()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8603");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8603");
};

func void rtn_inbattle_8604()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8604");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8604");
};

func void rtn_inbattle_8605()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8605");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8605");
};

func void rtn_inbattle_8606()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8606");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8606");
};

func void rtn_inbattle_8607()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8607");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8607");
};

func void rtn_inbattle_8608()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8608");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8608");
};

func void rtn_inbattle_8609()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8609");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8609");
};

func void rtn_inbattle_8610()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8610");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8610");
};

func void rtn_inbattle_8611()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8611");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8611");
};

func void rtn_inbattle_8612()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8612");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8612");
};

func void rtn_inbattle_8613()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8613");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8613");
};

func void rtn_inbattle_8614()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8614");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8614");
};

func void rtn_inbattle_8615()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8615");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8615");
};

func void rtn_inbattle_8616()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8616");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8616");
};

func void rtn_inbattle_8617()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8617");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8617");
};

func void rtn_inbattle_8618()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8618");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8618");
};

func void rtn_inbattle_8619()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8619");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8619");
};

func void rtn_inbattle_8620()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8620");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8620");
};

func void rtn_inbattle_8621()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8621");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8621");
};

func void rtn_inbattle_8622()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8622");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8622");
};

func void rtn_inbattle_8623()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8623");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8623");
};

func void rtn_inbattle_8624()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8624");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8624");
};

func void rtn_inbattle_8625()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8625");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8625");
};

func void rtn_inbattle_8626()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8626");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8626");
};

func void rtn_inbattle_8627()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8627");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8627");
};

func void rtn_inbattle_8628()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8628");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8628");
};

func void rtn_inbattle_8629()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8629");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8629");
};

func void rtn_inbattle_8630()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8630");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8630");
};

func void rtn_inbattle_8631()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8631");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8631");
};

func void rtn_inbattle_8632()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8632");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8632");
};

func void rtn_inbattle_8633()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8633");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8633");
};

func void rtn_inbattle_8634()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8634");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8634");
};

func void rtn_inbattle_8635()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8635");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8635");
};

func void rtn_inbattle_8636()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8636");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8636");
};

func void rtn_inbattle_8637()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8637");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8637");
};

func void rtn_inbattle_8638()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8638");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8638");
};

func void rtn_inbattle_8639()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8639");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8639");
};

func void rtn_inbattle_8640()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8640");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8640");
};

func void rtn_inbattle_8641()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8641");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8641");
};

func void rtn_inbattle_8642()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8642");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8642");
};

func void rtn_inbattle_8643()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8643");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8643");
};

func void rtn_inbattle_8644()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8644");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8644");
};

func void rtn_inbattle_8645()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8645");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8645");
};

func void rtn_inbattle_8646()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8646");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8646");
};

func void rtn_inbattle_8647()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8647");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8647");
};

func void rtn_inbattle_8648()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8648");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8648");
};

func void rtn_inbattle_8649()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8649");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8649");
};

func void rtn_inbattle_8650()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8650");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8650");
};

func void rtn_inbattle_8651()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8651");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8651");
};

func void rtn_inbattle_8652()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8652");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8652");
};

func void rtn_inbattle_8653()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8653");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8653");
};

func void rtn_inbattle_8654()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8654");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8654");
};

func void rtn_inbattle_8655()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8655");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8655");
};

func void rtn_inbattle_8656()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8656");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8656");
};

func void rtn_inbattle_8657()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8657");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8657");
};

func void rtn_inbattle_8658()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8658");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8658");
};

func void rtn_inbattle_8659()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8659");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8659");
};

func void rtn_inbattle_8660()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8660");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8660");
};

func void rtn_inbattle_8661()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8661");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8661");
};

func void rtn_inbattle_8662()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8662");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8662");
};

func void rtn_inbattle_8663()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8663");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8663");
};

func void rtn_inbattle_8664()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8664");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8664");
};

func void rtn_inbattle_8665()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8665");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8665");
};

func void rtn_inbattle_8666()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8666");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8666");
};

func void rtn_inbattle_8667()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8667");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8667");
};

func void rtn_inbattle_8668()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8668");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8668");
};

func void rtn_inbattle_8669()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8669");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8669");
};

func void rtn_inbattle_8670()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8670");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8670");
};

func void rtn_inbattle_8671()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8671");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8671");
};

func void rtn_inbattle_8672()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8672");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8672");
};

func void rtn_inbattle_8673()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8673");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8673");
};

func void rtn_inbattle_8674()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8674");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8674");
};

func void rtn_inbattle_8675()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8675");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8675");
};

func void rtn_inbattle_8676()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8676");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8676");
};

func void rtn_inbattle_8677()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8677");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8677");
};

func void rtn_inbattle_8678()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8678");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8678");
};

func void rtn_inbattle_8679()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8679");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8679");
};

func void rtn_inbattle_8680()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8680");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8680");
};

func void rtn_inbattle_8681()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8681");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8681");
};

func void rtn_inbattle_8682()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8682");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8682");
};

func void rtn_inbattle_8683()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8683");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8683");
};

func void rtn_inbattle_8684()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8684");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8684");
};

func void rtn_inbattle_8685()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8685");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8685");
};

func void rtn_inbattle_8686()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8686");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8686");
};

func void rtn_inbattle_8687()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8687");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8687");
};

func void rtn_inbattle_8688()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8688");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8688");
};

func void rtn_inbattle_8689()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8689");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8689");
};

func void rtn_inbattle_8690()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8600");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8690");
};

func void rtn_inbattle_8691()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8691");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8691");
};

func void rtn_inbattle_8692()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8692");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8692");
};

func void rtn_inbattle_8693()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8693");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8693");
};

func void rtn_inbattle_8694()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8694");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8694");
};

func void rtn_inbattle_8695()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8695");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8695");
};

func void rtn_inbattle_8696()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8696");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8696");
};

func void rtn_inbattle_8697()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8697");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8697");
};

func void rtn_inbattle_8698()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8698");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8698");
};

func void rtn_inbattle_8699()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8699");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8699");
};

func void rtn_inbattle_8700()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8700");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8700");
};

func void rtn_inbattle_8701()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8701");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8701");
};

func void rtn_inbattle_8702()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8702");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8702");
};

func void rtn_inbattle_8703()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8703");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8703");
};

func void rtn_inbattle_8704()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8704");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8704");
};

func void rtn_inbattle_8705()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8705");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8705");
};

func void rtn_inbattle_8706()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8706");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8706");
};

func void rtn_inbattle_8707()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8707");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8707");
};

func void rtn_inbattle_8708()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8708");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8708");
};

func void rtn_inbattle_8709()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8709");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8709");
};

func void rtn_inbattle_8710()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8710");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8710");
};

func void rtn_inbattle_8711()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8711");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8711");
};

func void rtn_inbattle_8712()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8712");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8712");
};

func void rtn_inbattle_8713()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8713");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8713");
};

func void rtn_inbattle_8714()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8714");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8714");
};

func void rtn_inbattle_8715()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8715");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8715");
};

func void rtn_inbattle_8716()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8716");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8716");
};

func void rtn_inbattle_8717()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8717");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8717");
};

func void rtn_inbattle_8718()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8718");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8718");
};

func void rtn_inbattle_8719()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8719");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8719");
};

func void rtn_inbattle_8720()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8720");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8720");
};

func void rtn_inbattle_8721()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8721");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8721");
};

func void rtn_inbattle_8722()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8722");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8722");
};

func void rtn_inbattle_8723()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8723");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8723");
};

func void rtn_inbattle_8724()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8724");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8724");
};

func void rtn_inbattle_8725()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8725");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8725");
};

func void rtn_inbattle_8726()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8726");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8726");
};

func void rtn_inbattle_8727()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8727");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8727");
};

func void rtn_inbattle_8728()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8728");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8728");
};

func void rtn_inbattle_8729()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8729");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8729");
};

func void rtn_inbattle_8730()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8730");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8730");
};

func void rtn_inbattle_8731()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8731");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8731");
};

func void rtn_inbattle_8732()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8732");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8732");
};

func void rtn_inbattle_8733()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8733");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8733");
};

func void rtn_inbattle_8734()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8734");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8734");
};

func void rtn_inbattle_8735()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8735");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8735");
};

func void rtn_inbattle_8736()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8736");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8736");
};

func void rtn_inbattle_8737()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8737");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8737");
};

func void rtn_inbattle_8738()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8738");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8738");
};

func void rtn_inbattle_8739()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8739");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8739");
};

func void rtn_inbattle_8740()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8740");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8740");
};

func void rtn_inbattle_8741()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8741");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8741");
};

func void rtn_inbattle_8742()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8742");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8742");
};

func void rtn_inbattle_8743()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8743");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8743");
};

func void rtn_inbattle_8744()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8744");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8744");
};

func void rtn_inbattle_8745()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8745");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8745");
};

func void rtn_inbattle_8746()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8746");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8746");
};

func void rtn_inbattle_8747()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8747");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8747");
};

func void rtn_inbattle_8751()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8751");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8751");
};

func void rtn_inbattle_8752()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8752");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8752");
};

func void rtn_inbattle_8753()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8753");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8753");
};

func void rtn_inbattle_8754()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8754");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8754");
};

func void rtn_inbattle_8755()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8755");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8755");
};

func void rtn_inbattle_8756()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8756");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8756");
};

func void rtn_inbattle_8757()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8757");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8757");
};

func void rtn_inbattle_8758()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8758");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8758");
};

func void rtn_inbattle_8759()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8759");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8759");
};

func void rtn_inbattle_8760()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8760");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8760");
};

func void rtn_inbattle_8761()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8761");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8761");
};

func void rtn_inbattle_8762()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8762");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8762");
};

func void rtn_inbattle_8763()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8763");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8763");
};

func void rtn_inbattle_8764()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8764");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8764");
};

func void rtn_inbattle_8765()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8765");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8765");
};

func void rtn_inbattle_8766()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8766");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8766");
};

func void rtn_inbattle_8767()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFIGHT_8767");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFIGHT_8767");
};

func void rtn_attackfarm_8600()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8601()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8602()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8603()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8604()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8605()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8606()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8607()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8608()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8609()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8610()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8611()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8612()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8613()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8614()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8615()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8616()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8617()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8618()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8619()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8620()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8621()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8622()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8623()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8624()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8625()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8626()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8627()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8628()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8629()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8630()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8631()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8632()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8633()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8634()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8635()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8636()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8637()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8638()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8639()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8640()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8641()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8642()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8643()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8644()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8645()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8646()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8647()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8648()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8649()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8650()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8651()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8652()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8653()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8654()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8655()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8656()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8657()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8658()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8659()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8660()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8661()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8662()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8663()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8664()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8665()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8666()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8667()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8668()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8669()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8670()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8671()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8672()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8673()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8674()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8675()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8676()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8677()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8678()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8679()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8680()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8681()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8682()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8683()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8684()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8685()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8686()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8687()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8688()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8689()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8690()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8691()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8692()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8693()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8694()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8695()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8696()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8697()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8698()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8699()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8700()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8701()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8702()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8703()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8704()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8705()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8706()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8707()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8708()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8709()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8710()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8711()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8712()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8713()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8714()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8715()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8716()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8717()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8718()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8719()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8720()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8721()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8722()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8723()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8724()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8725()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8726()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8727()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8728()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8729()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8730()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8731()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8732()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8733()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8734()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8735()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8736()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8737()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8738()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8739()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8740()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8741()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8742()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8743()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8744()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8745()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8746()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8747()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8751()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8752()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8753()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8754()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8755()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8756()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8757()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8758()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8759()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8760()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8761()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8762()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8763()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8764()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8765()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8766()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};

func void rtn_attackfarm_8767()
{
	TA_Stand_WP(5,0,23,0,"NW_BIGFARM_PATH_04");
	TA_Stand_WP(23,0,5,0,"NW_BIGFARM_PATH_04");
};


instance ORC_8810_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8810;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8810;
};


func void rtn_start_8810()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8811_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8811;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8811;
};


func void rtn_start_8811()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8812_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8812;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8812;
};


func void rtn_start_8812()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8813_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8813;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8813;
};


func void rtn_start_8813()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8814_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8814;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8814;
};


func void rtn_start_8814()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8815_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8815;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8815;
};


func void rtn_start_8815()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8816_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8816;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8816;
};


func void rtn_start_8816()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8817_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8817;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8817;
};


func void rtn_start_8817()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8818_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8818;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8818;
};


func void rtn_start_8818()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8819_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8819;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8819;
};


func void rtn_start_8819()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8820_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8820;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8820;
};


func void rtn_start_8820()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8821_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8821;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8821;
};


func void rtn_start_8821()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8822_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8822;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8822;
};


func void rtn_start_8822()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8823_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8823;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8823;
};


func void rtn_start_8823()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8824_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8824;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8824;
};


func void rtn_start_8824()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8825_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8825;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8825;
};


func void rtn_start_8825()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8826_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8826;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8826;
};


func void rtn_start_8826()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8827_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8827;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8827;
};


func void rtn_start_8827()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8828_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8828;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8828;
};


func void rtn_start_8828()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};


instance ORC_8829_ELITEBIGFIGHTER(C_Npc)
{
	name[0] = CZ_NAME_Orc_WarriorBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCBF;
	id = 8829;
	voice = 18;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_04);
	daily_routine = rtn_start_8829;
};


func void rtn_start_8829()
{
	TA_Stand_WP(5,0,23,0,"TOT_ORC");
	TA_Stand_WP(23,0,5,0,"TOT_ORC");
};

func void rtn_comedeath_8810()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_PATH_HODGES");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_PATH_HODGES");
};

func void rtn_comedeath_8811()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_NIGEL");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_NIGEL");
};

func void rtn_comedeath_8812()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_KDF_07");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_KDF_07");
};

func void rtn_comedeath_8813()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_STABLE_OUT_031");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_STABLE_OUT_031");
};

func void rtn_comedeath_8814()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_KDF_03");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_KDF_03");
};

func void rtn_comedeath_8815()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_STABLE_OUT_04");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_STABLE_OUT_04");
};

func void rtn_comedeath_8816()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_KDF_02");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_KDF_02");
};

func void rtn_comedeath_8817()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_KDF_01");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_KDF_01");
};

func void rtn_comedeath_8818()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_KDF_04");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_KDF_04");
};

func void rtn_comedeath_8819()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_PATH_BIFF_01");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_PATH_BIFF_01");
};

func void rtn_comedeath_8820()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_RUDAR");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_RUDAR");
};

func void rtn_comedeath_8821()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_PATH_05");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_PATH_05");
};

func void rtn_comedeath_8822()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_PIR_02");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_PIR_02");
};

func void rtn_comedeath_8823()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_HOUSE_OUT_04");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_HOUSE_OUT_04");
};

func void rtn_comedeath_8824()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_TREE");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_TREE");
};

func void rtn_comedeath_8825()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_KITCHEN_OUT_01");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_KITCHEN_OUT_01");
};

func void rtn_comedeath_8826()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_CAMPON_PIR_05");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_CAMPON_PIR_05");
};

func void rtn_comedeath_8827()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_PATH_01");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_PATH_01");
};

func void rtn_comedeath_8828()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_KITCHEN_05");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_KITCHEN_05");
};

func void rtn_comedeath_8829()
{
	ta_orc_bigfight(5,0,23,0,"NW_BIGFARM_KITCHEN_BUSTER");
	ta_orc_bigfight(23,0,5,0,"NW_BIGFARM_KITCHEN_BUSTER");
};

