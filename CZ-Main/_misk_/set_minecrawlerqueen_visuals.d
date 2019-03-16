
prototype MST_DEFAULT_MINECRAWLERQUEEN(C_Npc)
{
	name[0] = CZ_NAME_Monster_MinecrawlerQueen;
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLER;
	level = 40;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 290;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	bodyStateInterruptableOverride = TRUE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void set_minecrawlerqueen_visuals()
{
	Mdl_SetVisual(self,"CrwQueen.mds");
	Mdl_SetVisualBody(self,"CrQ_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_minecrawlerqueen_visuals_EX()
{
	Mdl_SetVisual(self,"CrwQ2.mds");
	Mdl_SetVisualBody(self,"CrWQ2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance MINECRAWLERQUEEN(MST_DEFAULT_MINECRAWLERQUEEN)
{
	name[0] = CZ_NAME_Monster_MinecrawlerQueen;
	level = 40;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 290;
	protection[PROT_MAGIC] = 100;
	set_minecrawlerqueen_visuals();
	bodyStateInterruptableOverride = TRUE;
	CreateInvItems(self,itat_crawlerqueen,3);
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};


instance POISONMINECRAWLERQUEEN(MST_DEFAULT_MINECRAWLERQUEEN)
{
	name[0] = CZ_NAME_Monster_MinecrawlerQueen_Poison;
	level = 40;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 290;
	protection[PROT_MAGIC] = 100;
	bodyStateInterruptableOverride = TRUE;
	set_minecrawlerqueen_visuals_EX();
	CreateInvItems(self,itat_crawlerqueen,3);
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};