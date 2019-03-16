
prototype Mst_Default_Giant_Rat(C_Npc)
{
	name[0] = "Крыса";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_Giant_Rat;
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
	fight_tactic = FAI_GIANT_RAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

func void B_SetVisuals_Giant_Rat()
{
	Mdl_SetVisual(self,"Giant_Rat.mds");
	Mdl_SetVisualBody(self,"Giant_Rat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance YGiant_Rat(Mst_Default_Giant_Rat)
{
	name[0] = "Крыса";
	guild = GIL_MEATBUG;
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
	fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Giant_Rat(Mst_Default_Giant_Rat)
{
	name[0] = "Крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Ship_Rat_01(Mst_Default_Giant_Rat)
{
	name[0] = "Корабельная крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Ship_Rat_02(Mst_Default_Giant_Rat)
{
	name[0] = "Корабельная крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Ship_Rat_03(Mst_Default_Giant_Rat)
{
	name[0] = "Корабельная крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Ship_Rat_04(Mst_Default_Giant_Rat)
{
	name[0] = "Корабельная крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Ship_Rat_05(Mst_Default_Giant_Rat)
{
	name[0] = "Корабельная крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};

instance Ship_Rat_06(Mst_Default_Giant_Rat)
{
	name[0] = "Корабельная крыса";
	guild = GIL_MEATBUG;
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
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};
