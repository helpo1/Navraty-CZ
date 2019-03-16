
instance Orc_5500_WoundedOrc(C_Npc)
{
	name[0] = CZ_NAME_Orc_Unique_WoundedOrc;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	id = 5500;
	level = 10;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	HitChance[NPC_TALENT_1H] = 10;
	HitChance[NPC_TALENT_2H] = 10;
	HitChance[NPC_TALENT_BOW] = 10;
	HitChance[NPC_TALENT_CROSSBOW] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ELITEORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_EnemyOverride] = TRUE;
	EquipItem(self,ItMw_2H_OrcSword_04);
	start_aistate = ZS_MM_AllScheduler;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit4",DEFAULT,DEFAULT,"Orc_HeadWarrior",4,DEFAULT,-1);
	start_aistate = ZS_MM_Rtn_DragonRest_OrcSit;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void Rtn_TOT_5500()
{
	TA_Orc_Stand_Drinking(8,0,22,0,"TOT");
	TA_Orc_Stand_Drinking(22,0,8,0,"TOT");
};