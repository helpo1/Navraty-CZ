
prototype Mst_Default_Snapper(C_Npc)
{
	name[0] = CZ_NAME_Monster_Snapper;
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_SNAPPER;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_Oster()
{
	Mdl_SetVisual(self,"Oster.mds");
	Mdl_SetVisualBody(self,"Sno_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Snapper()
{
	Mdl_SetVisual(self,"Snappez.mds");
	Mdl_SetVisualBody(self,"Snz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_snapper_lead()
{
	Mdl_SetVisual(self,"Snappez.mds");
	Mdl_SetVisualBody(self,"Snz_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_snapper_uniq()
{
	Mdl_SetVisual(self,"Snappez.mds");
	Mdl_SetVisualBody(self,"Snz_Body",2,2,"",DEFAULT,DEFAULT,-1);
};

instance Snapper(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance Snapper_Trf(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance Oster(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	aivar[AIV_Gender] = TRUE;
	level = 20;
	attribute[ATR_STRENGTH] = 290;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper1(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper2(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper3(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper4(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper5(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper6(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper7(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_Snapper8(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance NewMine_LeadSnapper(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Leader;
	aivar[90] = TRUE;
	level = 30;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 175;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 135;
	protection[PROT_EDGE] = 135;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	CreateInvItems(self,ItAt_ClawLeader,1);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	b_setvisuals_snapper_lead();
	Npc_SetToFistMode(self);
};

instance Grimbald_Snapper1(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance Grimbald_Snapper2(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance Grimbald_Snapper3(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

instance BLACKSNAPPER(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_BlackLeader;
	aivar[90] = TRUE;
	level = 35;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	CreateInvItems(self,itat_clawblacksnapper,1);
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	CreateInvItems(self,ItMi_Mutagen_Dex_Low,1);
};

instance SNAPPER_UNIQ(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Kostoglod;
	level = 40;
	attribute[ATR_STRENGTH] = 490;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	b_setvisuals_snapper_uniq();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance Snapper_Black_Osair_01(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};

instance Snapper_Black_Osair_02(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};

instance Snapper_Black_Osair_03(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};

instance Snapper_Black_Osair_04(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};

instance Snapper_Black_Osair_05(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};

instance Snapper_Black(Mst_Default_Snapper)
{
	name[0] = CZ_NAME_Monster_Snapper_Black;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_Oster();
	Npc_SetToFistMode(self);
};