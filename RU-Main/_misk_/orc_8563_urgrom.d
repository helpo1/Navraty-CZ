
instance ORC_8563_URGROM(C_Npc)
{
	name[0] = "Призрак орка";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	id = 8563;
	level = 150;
	flags = ORCTEMPLENPCFLAGS;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 750;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 100;
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
	start_aistate = ZS_MM_AllScheduler;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit4",DEFAULT,DEFAULT,"Orc_HeadWarrior",6,DEFAULT,-1);
	EquipItem(self,itmw_2h_orcsword_03);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};


func void rtn_urgromgobattle_8563()
{
	ta_orc_stand_drinking(8,0,22,0,"WP_URGROM");
	ta_orc_stand_drinking(22,0,8,0,"WP_URGROM");
};

func void rtn_TOT_8563()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

func void rtn_urgromhome_8563()
{
	ta_orc_stand_drinking(8,0,22,0,"FP_ROAM_MONSTER_URGROM");
	ta_orc_stand_drinking(22,0,8,0,"FP_ROAM_MONSTER_URGROM");
};