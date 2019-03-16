
instance ORC_8560_WARRIOR(C_Npc)
{
	name[0] = NAME_ORCWARRIOR;
	guild = GIL_ORC;
	id = 8560;
	voice = 18;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	npcType = NPCTYPE_AMBIENT;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
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
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaOrc",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
	EquipItem(self,itmw_addon_keule_1h_03);
	start_aistate = zs_mm_rtn_orcdancef;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};