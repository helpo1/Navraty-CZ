
instance ORC_8516_TUMPAK(C_Npc)
{
	name[0] = CZ_NAME_Orc_Unique_Tumpak;
	guild = GIL_ORC;
	id = 8516;
	voice = 18;
	level = 50;
	flags = 0;
	aivar[90] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	npcType = NPCTYPE_AMBIENT;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
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
	fight_tactic = FAI_ELITEORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit3",DEFAULT,DEFAULT,"Orc_HeadWarrior",4,DEFAULT,-1);
	EquipItem(self,itmw_2h_orcsword_03);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

