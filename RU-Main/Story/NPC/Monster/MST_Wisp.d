
prototype Mst_Default_Wisp(C_Npc)
{
	name[0] = "Огонек";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_WISP;
	level = 2;
	flags = FALSE;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_MAGIC;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_Wisp()
{
	Mdl_SetVisual(self,"Irrlicht.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Wisp(Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Nugget,1);
};

instance SoulKeeperWisp_01(Mst_Default_Wisp)
{
	name[0] = "Плененная душа";
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wisp();
	aivar[AIV_EnemyOverride] = TRUE;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance SoulKeeperWisp_02(Mst_Default_Wisp)
{
	name[0] = "Плененная душа";
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wisp();
	aivar[AIV_EnemyOverride] = TRUE;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance SoulKeeperWisp_03(Mst_Default_Wisp)
{
	name[0] = "Плененная душа";
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wisp();
	aivar[AIV_EnemyOverride] = TRUE;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance SoulKeeperWisp_04(Mst_Default_Wisp)
{
	name[0] = "Плененная душа";
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wisp();
	aivar[AIV_EnemyOverride] = TRUE;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance SoulKeeperWisp_05(Mst_Default_Wisp)
{
	name[0] = "Плененная душа";
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wisp();
	aivar[AIV_EnemyOverride] = TRUE;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance SoulKeeperWisp_06(Mst_Default_Wisp)
{
	name[0] = "Плененная душа";
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Wisp();
	aivar[AIV_EnemyOverride] = TRUE;
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance Wisp_Detector(Mst_Default_Wisp)
{
	level = 0;
	voice = 18;
	id = 820;
	npcType = npctype_main;
	B_SetVisuals_Wisp();
	senses_range = 3000;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetToFistMode(self);
	aivar[AIV_NoFightParker] = TRUE;
	start_aistate = ZS_MM_Rtn_Summoned;
};