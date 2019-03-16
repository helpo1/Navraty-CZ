
prototype Mst_Default_Meatbug(C_Npc)
{
	name[0] = "Мясной жук";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
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
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

prototype Mst_Default_Rabbit(C_Npc)
{
	name[0] = "Кролик";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER;
	level = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
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
	aivar[AIV_MM_FollowInWater] = FALSE;
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

prototype Mst_Default_Horse(C_Npc)
{
	name[0] = "Лошадь";
	guild = GIL_NONE;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER;
	level = 1;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
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
	aivar[AIV_MM_FollowInWater] = FALSE;
	//Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Horse_V0()
{
	Mdl_SetVisual(self,"HRS.mds");
	Mdl_SetVisualBody(self,"HRS_BODY_V0",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Horse_V1()
{
	Mdl_SetVisual(self,"HRS.mds");
	Mdl_SetVisualBody(self,"HRS_BODY_V0",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Meatbug()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Rabbit()
{
	Mdl_SetVisual(self,"Zaic.mds");
	Mdl_SetVisualBody(self,"Zaic",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Rabbit_02()
{
	Mdl_SetVisual(self,"Rabbit.mds");
	Mdl_SetVisualBody(self,"Rabbit_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Meatbug(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Horse_01(Mst_Default_Horse)
{
	B_SetVisuals_Horse_V0();
};

instance Horse_02(Mst_Default_Horse)
{
	B_SetVisuals_Horse_V1();
};

instance Rabbit(Mst_Default_Rabbit)
{
	B_SetVisuals_Rabbit_02();
};

instance Rabbit_02(Mst_Default_Rabbit)
{
	B_SetVisuals_Rabbit();
};

instance Meatbug_Brutus1(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus2(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus3(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus4(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

prototype Mst_Default_StartHelpBug(C_Npc)
{
	name[0] = "";
	guild = GIL_MEATBUG;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	level = 1;
	noFocus = 1;
	bodyStateInterruptableOverride = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
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
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_StartHelpBug()
{
	Mdl_SetVisual(self,"Zaic.mds");
	Mdl_SetVisualBody(self,"Zaic",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.01,0.01,0.01);
};

instance StartHelpBug_01(Mst_Default_StartHelpBug)
{
	B_SetVisuals_StartHelpBug();
	start_aistate = ZS_MM_AllScheduler;
};

instance StartHelpBug_02(Mst_Default_StartHelpBug)
{
	B_SetVisuals_StartHelpBug();
	start_aistate = ZS_MM_AllScheduler;
};

instance StartHelpBug_03(Mst_Default_StartHelpBug)
{
	B_SetVisuals_StartHelpBug();
	start_aistate = ZS_MM_AllScheduler;
};

instance StartHelpBug_04(Mst_Default_StartHelpBug)
{
	B_SetVisuals_StartHelpBug();
	start_aistate = ZS_MM_AllScheduler;
};

instance StartHelpBug_05(Mst_Default_StartHelpBug)
{
	B_SetVisuals_StartHelpBug();
	start_aistate = ZS_MM_AllScheduler;
};

func void B_SetVisuals_Crab()
{
	Mdl_SetVisual(self,"crab.mds");
	Mdl_SetVisualBody(self,"Crab_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Crab(Mst_Default_Meatbug)
{
	name[0] = "Краб";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_CRAB;
	level = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Crab();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.1,0.1,0.1);
};

PROTOTYPE Mst_Default_Riesennatter(C_Npc)			
{
	name = "Змея";
	guild	 = GIL_Meatbug;
	aivar[AIV_MM_REAL_ID] = ID_NATTER;
	level = 1;
	attribute	[ATR_STRENGTH] = 1;
	attribute	[ATR_DEXTERITY] = 1;
	attribute	[ATR_HITPOINTS_MAX] = 1;
	attribute	[ATR_HITPOINTS] = 1;
	attribute	[ATR_MANA_MAX] = 0;
	attribute	[ATR_MANA]	= 0;
	protection	[PROT_BLUNT] = 5;
	protection	[PROT_EDGE] = 5;
	protection	[PROT_POINT] = 0;	
	protection	[PROT_FIRE] = 0;
	protection	[PROT_FLY] = 0;	
	protection	[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = 8;
	aivar[AIV_MM_RoamEnd] = 20;
	aivar[AIV_MM_SleepStart] = 20;
	aivar[AIV_MM_SleepEnd] = 8;
};

func void B_SetVisuals_Riesennatter()
{
	Mdl_SetVisual(self,"Riesennatter.mds");
	Mdl_SetVisualBody(self,"Rnr_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

INSTANCE Riesennatter	(Mst_Default_Riesennatter)
{
	B_SetVisuals_Riesennatter();
	Npc_SetToFistMode(self);
};
