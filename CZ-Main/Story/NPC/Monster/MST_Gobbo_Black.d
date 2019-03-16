
prototype Mst_Default_Gobbo_Black(C_Npc)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

prototype MST_DEFAULT_GOBBO_MAGE(C_Npc)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 12;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
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

func void B_SetVisuals_Gobbo_Black()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Gobbo_Desert()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Bodz",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_gobbo_mage()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_gobbo_shaman()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",3,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Gobbo_Shaman(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack_Shaman;
	aivar[AIV_Gender] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_MAGE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 75;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	b_setvisuals_gobbo_shaman();
	Npc_SetToFightMode(self,ItMi_GoblinRune);
};

instance Gobbo_Black(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance Gobbo_DaronsStatuenKlauer(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Gobbo_Black();
	CreateInvItems(self,ItMi_LostInnosStatue_Daron,1);
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance GOBBO_MAGE(MST_DEFAULT_GOBBO_MAGE)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_gobbo_mage();
	Npc_SetToFightMode(self,ItMw_1h_Gobbo_Hammer);
};

instance GOBBO_MAGE_GR1(MST_DEFAULT_GOBBO_MAGE)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_gobbo_mage();
	Npc_SetToFightMode(self,ItMw_1h_Gobbo_Hammer);
};

instance GOBBO_MAGE_GR2(MST_DEFAULT_GOBBO_MAGE)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_gobbo_mage();
	Npc_SetToFightMode(self,ItMw_1h_Gobbo_Hammer);
};

instance GOBBO_MAGE_GR3(MST_DEFAULT_GOBBO_MAGE)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_gobbo_mage();
	Npc_SetToFightMode(self,ItMw_1h_Gobbo_Hammer);
};

instance GOBBO_MAGE_GR4(MST_DEFAULT_GOBBO_MAGE)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_gobbo_mage();
	Npc_SetToFightMode(self,ItMw_1h_Gobbo_Hammer);
};

instance GOBBO_MAGE_GR5(MST_DEFAULT_GOBBO_MAGE)
{
	name[0] = CZ_NAME_Monster_GobboMage;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_gobbo_mage();
	Npc_SetToFightMode(self,ItMw_1h_Gobbo_Hammer);
};

instance GOBBO_BLACK_UNIQ(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack_Resheza;
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 65;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	B_SetVisuals_Gobbo_Black();
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetToFightMode(self,ItMw_1H_GoblinTotem);
};

instance Engrom_Goblin_01(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance Engrom_Goblin_02(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance Engrom_Goblin_03(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance Engrom_Goblin_04(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance Gobbo_Desert(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack_Desert;
	aivar[AIV_Gender] = TRUE;
	level = 20;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_DESERT;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 320;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Gobbo_Desert();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance Gobbo_Desert_Shaman(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack_DesertShaman;
	aivar[AIV_Gender] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_MAGE_DESERT;
	level = 25;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 950;
	attribute[ATR_HITPOINTS] = 950;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 175;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	B_SetVisuals_Gobbo_Desert();
	Npc_SetToFightMode(self,ItMi_GoblinRune);
};

instance Gobbo_Desert_Leader(Mst_Default_Gobbo_Black)
{
	name[0] = CZ_NAME_Monster_GobboBlack_Shakzi;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_DESERT;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 470;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 65;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_Gobbo_Desert();
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetToFightMode(self,ItMw_1H_GoblinTotem);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};