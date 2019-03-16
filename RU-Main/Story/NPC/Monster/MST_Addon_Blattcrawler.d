
prototype Mst_Default_Blattcrawler(C_Npc)
{
	name[0] = "Богомол";
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_BLATTCRAWLER;
	level = 8;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 15;
	damagetype = DAM_POINT;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Blattcrawler()
{
	Mdl_SetVisual(self,"Blattcrawler.mds");
	Mdl_SetVisualBody(self,"BlattCrawler_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_blattcrawler_ex()
{
	Mdl_SetVisual(self,"Blattcrawler.mds");
	Mdl_SetVisualBody(self,"BlattCrawles_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Blattcrawler(Mst_Default_Blattcrawler)
{
	name[0] = "Богомол";
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Blattcrawler();
	Npc_SetToFistMode(self);
};

instance BLATTCRAWLEREX(Mst_Default_Blattcrawler)
{
	name[0] = "Самка богомола";
	guild = GIL_BLOODFLY;
	level = 70;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 275;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 175;
	protection[PROT_EDGE] = 175;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 15;
	CreateInvItems(self,itam_benkenob,1);
	b_setvisuals_blattcrawler_ex();
	Npc_SetToFistMode(self);
};