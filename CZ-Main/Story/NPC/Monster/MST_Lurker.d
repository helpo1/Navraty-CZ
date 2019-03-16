
prototype Mst_Default_Lurker(C_Npc)
{
	name[0] = CZ_NAME_Monster_Lurker;
	guild = GIL_LURKER;
	aivar[AIV_MM_REAL_ID] = ID_LURKER;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_LURKER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_Lurker()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_lurker_ex()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",1,1,"",DEFAULT,DEFAULT,-1);
};


instance Lurker(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance EGGLURKER(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker_Old;
	level = 18;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 450;
	attribute[ATR_HITPOINTS] = 450;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	b_setvisuals_lurker_ex();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance Kervo_Lurker1(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance Kervo_Lurker2(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance Kervo_Lurker3(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance Kervo_Lurker4(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance Kervo_Lurker5(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance Kervo_Lurker6(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance BeachLurker1(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance BeachLurker2(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance BeachLurker3(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

instance LURKER_UNIQ(Mst_Default_Lurker)
{
	name[0] = CZ_NAME_Monster_Lurker_Raboglav;
	level = 40;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 220;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 220;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ITAT_LEADERLURKER,1);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Low,1);
};