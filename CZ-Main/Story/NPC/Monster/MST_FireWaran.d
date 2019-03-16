
prototype Mst_Default_FireWaran(C_Npc)
{
	name[0] = CZ_NAME_Monster_FireWaran;
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_FIREWARAN;
	level = 18;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 250;
	damage[DAM_INDEX_FIRE] = 2;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_Setvisuals_FireWaran()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_ApplyOverlayMds(self,"Firewaran.mds");
	Mdl_SetVisualBody(self,"War_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance FireWaran(Mst_Default_FireWaran)
{
	name[0] = CZ_NAME_Monster_FireWaran;
	aivar[AIV_Gender] = TRUE;
	level = 18;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 20;
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
};

instance FireWaran_Trf(Mst_Default_FireWaran)
{
	name[0] = CZ_NAME_Monster_FireWaran;
	aivar[AIV_Gender] = TRUE;
	level = 18;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 140;
	damage[DAM_INDEX_FIRE] = 1;
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
};

instance FireWaran_Rune(Mst_Default_FireWaran)
{
	name[0] = CZ_NAME_Monster_FireWaran;
	aivar[AIV_Gender] = TRUE;
	level = 18;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 220;
	damage[DAM_INDEX_FIRE] = 2;
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
};

instance FIRETESTMONSTER_02(Mst_Default_FireWaran)
{
	name[0] = CZ_NAME_Monster_FireWaran_FireSpirit;
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 175;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 400;
	damage[DAM_INDEX_FIRE] = 2;
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};

instance FIREWARAN_UNIQ(Mst_Default_FireWaran)
{
	name[0] = CZ_NAME_Monster_FireWaran_Ognedykh;
	level = 50;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 210;
	protection[PROT_EDGE] = 210;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 1700;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 40;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 450;
	damage[DAM_INDEX_FIRE] = 2;
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
};

instance FireWaran_LV(Mst_Default_FireWaran)
{
	name[0] = CZ_NAME_Monster_FireWaran_Ancient;
	level = 50;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 1700;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 240;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 600;
	damage[DAM_INDEX_FIRE] = 3;
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
};