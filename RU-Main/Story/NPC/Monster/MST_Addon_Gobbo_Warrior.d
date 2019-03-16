
prototype Mst_Default_Gobbo_Warrior(C_Npc)
{
	name[0] = "Гоблин-Воин";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 15;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 535;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Gobbo_Warrior()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_ApplyOverlayMds(self,"Gobbo_Berserk.mds");
	Mdl_SetVisualBody(self,"Gob_BodyWarri",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_gobbo_grandwarrior()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_ApplyOverlayMds(self,"Gobbo_Berserk.mds");
	Mdl_SetVisualBody(self,"Gob_BodyElite",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Gobbo_Warrior(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Гоблин-воин";
	aivar[AIV_Gender] = TRUE;
	level = 15;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 135;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_2H_Sword_M_01);
};

instance GOBBO_GRANDWARRIOR(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Гоблин-берсерк";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 30;
	b_setvisuals_gobbo_grandwarrior();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
};

instance GOBBO_GRANDWARRIOR_UNIQ(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Гримгаш";
	level = 35;
	attribute[ATR_STRENGTH] = 305;
	attribute[ATR_DEXTERITY] = 345;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 180;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 30;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	b_setvisuals_gobbo_grandwarrior();
	Npc_SetToFightMode(self,ItMw_2H_OrcAxe_02);
	CreateInvItems(self,itat_sheepgrimgash,1);
	CreateInvItems(self,ItMi_Opal,1);
};

instance GOBBO_GRANDWARRIOR_UNIQ_NEW(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Бердыш";
	level = 20;
	attribute[ATR_STRENGTH] = 280;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 5;
	protection[PROT_MAGIC] = 20;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	b_setvisuals_gobbo_grandwarrior();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	CreateInvItems(self,ItPl_Dex_Herb_01,1);
	CreateInvItems(self,ItMi_LostInnosStatue_Daron,1);
	CreateInvItems(self,ItMi_Topaz,1);
};

prototype Mst_GRD(C_Npc)
{
	name[0] = "Газкул";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = 8;
	aivar[AIV_MM_RoamEnd] = 20;
	aivar[AIV_MM_EatGroundStart] = 20;
	aivar[AIV_MM_EatGroundEnd] = 8;
};

func void Set_BTR_Visuals()
{
	Mdl_SetVisual(self,"GRD.mds");
	Mdl_SetVisualBody(self,"GRD_orc_biter",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"biter.mds");
};

instance Gobbo_Gazcul(Mst_GRD)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	Set_BTR_Visuals();
	Npc_SetToFightMode(self,ItMw_Speer_GoblinDemon);
	CreateInvItems(self,ItMi_Mutagen_Dex_Low,1);
	CreateInvItems(self,ItMi_TGoblin,1);
	CreateInvItems(self,ItMi_Ruby,1);
};