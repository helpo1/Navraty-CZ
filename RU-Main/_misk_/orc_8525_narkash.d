
instance ORC_8525_NARKASH(C_Npc)
{
	name[0] = "Нар-Каш";
	guild = GIL_ORC;
	id = 8525;
	voice = 18;
	level = 50;
	flags = 0;
	aivar[90] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	npcType = NPCTYPE_AMBIENT;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 450;
	attribute[ATR_HITPOINTS] = 450;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 160;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 100;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ELITEORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcSword_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

