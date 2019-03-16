
prototype Mst_Default_Icewolf(C_Npc)
{
	name[0] = CZ_NAME_Monster_IceWolf;
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_Icewolf;
	level = 10;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 175;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 140;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Icewolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"SnoWol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Icewolf(Mst_Default_Icewolf)
{
	name[0] = CZ_NAME_Monster_IceWolf;
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 175;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 140;
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
};

instance ICEWOLF_NOEXP(Mst_Default_Icewolf)
{
	level = 1;
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
};

instance ICEWOLF_SUMMONED(Mst_Default_Icewolf)
{
	name[0] = CZ_NAME_Monster_IceWolf_Summoned;
	guild = GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_WOLF;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	effect = "SPELLFX_MOON_SMOKE";
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
};

instance ICEWOLF_UNIQ_01(Mst_Default_Icewolf)
{
	name[0] = CZ_NAME_Monster_IceWolf_Arctic;
	level = 25;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 185;
	protection[PROT_EDGE] = 185;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 150;
	aivar[90] = TRUE;
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.05,1.05,1.05);
};

instance ICEWOLF_UNIQ_02(Mst_Default_Icewolf)
{
	name[0] = CZ_NAME_Monster_IceWolf_Opalla;
	level = 40;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 105;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 160;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance Icewolf_OZ(Mst_Default_Icewolf)
{
	name[0] = CZ_NAME_Monster_IceWolf_Mountain;
	aivar[AIV_Gender] = TRUE;
	level = 25;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 275;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 260;
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
};