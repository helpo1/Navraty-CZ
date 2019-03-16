
prototype Mst_Default_Shadowbeast_Skeleton(C_Npc)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	guild = GIL_SHADOWBEAST_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST_SKELETON;
	level = 20;
	attribute[ATR_STRENGTH] = 240;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Shadowbeast_Skeleton()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Shadowbeast_Skeleton(Mst_Default_Shadowbeast_Skeleton)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	level = 20;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Shadowbeast_Skeleton();
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Skeleton_Low(Mst_Default_Shadowbeast_Skeleton)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	level = 20;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Shadowbeast_Skeleton();
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Skeleton_Vino(Mst_Default_Shadowbeast_Skeleton)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	level = 20;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Shadowbeast_Skeleton();
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Npc_SetToFistMode(self);
};


instance Shadowbeast_Skeleton_Angar(Mst_Default_Shadowbeast_Skeleton)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	level = 20;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Shadowbeast_Skeleton();
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Npc_SetToFistMode(self);
};

instance SHADOWBEAST_SKELETON_COASTSWAMP(Mst_Default_Shadowbeast_Skeleton)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	level = 20;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Shadowbeast_Skeleton();
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Npc_SetToFistMode(self);
};

instance SHADOWBEAST_SKELETON_OT(Mst_Default_Shadowbeast_Skeleton)
{
	name[0] = CZ_NAME_Monster_ShadowbeastSkeleton;
	level = 20;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Shadowbeast_Skeleton();
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	CreateInvItems(self,ItAt_SkeletonBone,1);
	Npc_SetToFistMode(self);
};