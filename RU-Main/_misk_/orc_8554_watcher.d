
instance ORC_8554_WATCHER(C_Npc)
{
	name[0] = "Черный орк-охранник";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	id = 8554;
	level = 20;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 65;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	EquipItem(self,ItMw_2H_OrcSword_02);
	start_aistate = ZS_MM_AllScheduler;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcSword_01);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

