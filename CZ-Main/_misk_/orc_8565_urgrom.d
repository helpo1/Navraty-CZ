
instance ORC_8565_URGROM(C_Npc)
{
	name[0] = CZ_NAME_Orc_Unique_Urgrom_8565;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	id = 8565;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 4800;
	attribute[ATR_HITPOINTS] = 4800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	EquipItem(self,itmw_2h_orcsword_04);
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit4",DEFAULT,DEFAULT,"Orc_HeadWarrior",6,DEFAULT,-1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};


func void rtn_homeurgrom_8565()
{
	ta_orc_stand_drinking(8,0,22,0,"WP_PLACEURGROM");
	ta_orc_stand_drinking(22,0,8,0,"WP_PLACEURGROM");
};

