
prototype Mst_Default_Gobbo_Skeleton(C_Npc)
{
	name[0] = "Скелет гоблина";
	guild = GIL_GOBBO_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_SKELETON;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Gobbo_Skeleton()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gobbo_Skeleton_Body",DEFAULT,DEFAULT,"Ske_Head",DEFAULT,DEFAULT,-1);
};


instance Gobbo_Skeleton(Mst_Default_Gobbo_Skeleton)
{
	B_SetVisuals_Gobbo_Skeleton();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

instance GOBBO_SKELETON_NONEEXP(Mst_Default_Gobbo_Skeleton)
{
	level = 1;
	B_SetVisuals_Gobbo_Skeleton();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};


prototype SUMMONED_GOBBO_SKELETON_A(C_Npc)
{
	name[0] = "Рунный скелет гоблина";
	guild = GIL_SUMMONED_GOBBO_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_GOBBO_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	B_SetVisuals_Gobbo_Skeleton();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword_Sum);
};

instance Summoned_Gobbo_Skeleton(SUMMONED_GOBBO_SKELETON_A)
{
	name[0] = "Рунный скелет гоблина";
	level = 0;
	B_SetVisuals_Gobbo_Skeleton();
};

instance Gobbo_SkeletonOWDemonTower(Mst_Default_Gobbo_Skeleton)
{
	B_SetVisuals_Gobbo_Skeleton();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
};

