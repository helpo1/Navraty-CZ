
prototype Mst_Default_Wolf(C_Npc)
{
	name[0] = CZ_NAME_Monster_Wolf;
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 3;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 3;

};

func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_wolf_ex()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_wolf_uniq()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",3,3,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_wolf_dog()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",2,2,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_UndeadWolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"UNDEADWOL_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance WOLF1(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Young;
	level = 2;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.5,0.5,0.5);
};

instance Wolf(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf;
	aivar[AIV_Gender] = TRUE;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance Wolf_Trf(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf;
	aivar[AIV_Gender] = TRUE;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance WOLF_NOEXP(Mst_Default_Wolf)
{
	level = 1;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance HUNT_WOLF_01(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Killer;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf_ex();
	Npc_SetToFistMode(self);
};

instance HUNT_WOLF_02(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Killer;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf_ex();
	Npc_SetToFistMode(self);
};

instance HUNT_WOLF_03(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Killer;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf_ex();
	Npc_SetToFistMode(self);
};

instance HUNT_WOLF_04(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Killer;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf_ex();
	Npc_SetToFistMode(self);
};

instance Summoned_Wolf(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Summoned;
	guild = gil_summoned_wolf;
	aivar[AIV_MM_REAL_ID] = id_summoned_wolf;
	level = 0;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	effect = "SPELLFX_MOON_SMOKE";
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWolf1(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWolf2(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWolf3(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWolf4(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

instance NIXDOG(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Klyk;
	guild = GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	b_setvisuals_wolf_dog();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_SleepStart] = 1;
	aivar[AIV_MM_SleepEnd] = 23;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_Sleep;
};

instance FIRETESTMONSTER_01(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_FireSpirit;
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf_uniq();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.05,1.05,1.05);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};

instance HUNT_WOLF_UNIQ(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Kamnelap;
	level = 30;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 20;
	aivar[90] = TRUE;
	b_setvisuals_wolf_uniq();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_XtoneClaw,1);
	CreateInvItems(self,ItMi_Mutagen_HP_Low,1);
};

instance Wolf_Druid(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Druid;
	aivar[AIV_Gender] = TRUE;
	aivar[AIV_DeathInvGiven] = TRUE;
	level = 0;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 120;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

//--------------------epik----------------------------------------

instance ShadowWolf(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_Shadow;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	aivar[94] = NPC_LEGEND;
	level = 60;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 360;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 290;
	protection[PROT_EDGE] = 290;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	B_SetVisuals_UndeadWolf();
	Npc_SetToFistMode(self);
};

instance ShadowWolf_DeadTree(Mst_Default_Wolf)
{
	name[0] = CZ_NAME_Monster_Wolf_TreeGuardian;
	guild = GIL_SKELETON;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 50;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 360;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_UndeadWolf();
	Npc_SetToFistMode(self);
};