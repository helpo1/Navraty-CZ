
prototype Mst_Default_Sheep(C_Npc)
{
	name[0] = CZ_NAME_Monster_Sheep;
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_BARAN;
	level = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_Sheep()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Sheep_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Hammel()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Hammel_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Sheep(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Hammel(Mst_Default_Sheep)
{
	name[0] = CZ_NAME_Monster_Sheep_Ram;
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Follow_Sheep(Mst_Default_Sheep)
{
	name[0] = CZ_NAME_Monster_Sheep_Betsy;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_Follow_Sheep;
};

instance Follow_Sheep_AKIL(Mst_Default_Sheep)
{
	name[0] = CZ_NAME_Monster_Sheep;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_Follow_Sheep;
};

instance Balthasar_Sheep1(Mst_Default_Sheep)
{
	name[0] = CZ_NAME_Monster_Sheep_Ram;
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Balthasar_Sheep2(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Balthasar_Sheep3(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

PROTOTYPE Mst_Default_Ziege(C_Npc)			
{
	name	= CZ_NAME_Monster_Ziege;
	guild	 = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_ZIEGE;
	level	= 1;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 12;
	protection[PROT_EDGE] = 12;
	protection[PROT_POINT] = 12;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY]	= 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = FALSE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
};

func void B_SetVisuals_Ziege_01()
{
	Mdl_SetVisual(self,"Ziege.mds");
	Mdl_SetVisualBody(self,"Ziege_01_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Ziege_01(Mst_Default_Ziege)
{
	B_SetVisuals_Ziege_01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
};

PROTOTYPE Mst_Default_Aim(C_Npc)			
{
	name = CZ_NAME_EMPTY;
	guild	 = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level	 = 1;
	attribute	[ATR_STRENGTH] = 5;
	attribute	[ATR_DEXTERITY]	= 5;
	attribute	[ATR_HITPOINTS_MAX] = 50000;
	attribute	[ATR_HITPOINTS]	= 50000;
	attribute	[ATR_MANA_MAX] = 0;
	attribute	[ATR_MANA] = 0;
	protection	[PROT_BLUNT] = 0;
	protection	[PROT_EDGE] = 0;
	protection	[PROT_POINT] = 0;	
	protection	[PROT_FIRE] = IMMUNE;
	protection	[PROT_FLY] = IMMUNE;	
	protection	[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_Aim()
{
      Mdl_SetVisual(self,"zielscheibe.mds");
      Mdl_SetVisualBody(self,"zielscheibe_body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_AimInv()
{
      Mdl_SetVisual(self,"zielscheibe.mds");
      Mdl_SetVisualBody(self,"zielscheibe_bodz",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Aim(Mst_Default_Aim)
{
	name = CZ_NAME_Monster_Aim;
	B_SetVisuals_AimInv();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Mdl_SetModelScale(self,0.3,0.3,0.3);
};

instance SchwaPuFass(Npc_Default)
{
	name = CZ_NAME_EMPTY;
	guild	 = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 10;
	attribute [ATR_STRENGTH] = 10;
	attribute [ATR_DEXTERITY] = 10;
	attribute [ATR_HITPOINTS_MAX] = 10;
	attribute [ATR_HITPOINTS] = 10;
	attribute [ATR_MANA_MAX] = 10;
	attribute [ATR_MANA] = 10;
	protection	[PROT_BLUNT] = IMMUNE;
	protection	[PROT_EDGE] = IMMUNE;
	protection	[PROT_POINT] = IMMUNE;	
	protection	[PROT_FIRE] = IMMUNE;
	protection	[PROT_FLY] = IMMUNE;	
	protection	[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Mdl_SetVisual(self,"SchwaPuFass.mds");
	Mdl_SetVisualBody(self,"SchwaPuFass_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"SchwaPuFass_deep.mds");
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};