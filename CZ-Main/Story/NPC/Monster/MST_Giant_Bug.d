
prototype Mst_Default_Giant_Bug(C_Npc)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	guild = GIL_GIANT_BUG;
	aivar[AIV_MM_REAL_ID] = ID_GIANT_BUG;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_POINT;
	fight_tactic = FAI_GIANT_BUG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Giant_Bug()
{
	Mdl_SetVisual(self,"Giant_Bug.mds");
	Mdl_SetVisualBody(self,"Giant_Bug_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance YGiant_Bug(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug_Young;
	level = 2;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance Giant_Bug(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance YGiant_Bug_VinoRitual1(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance YGiant_Bug_VinoRitual2(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_GIANT_BUG;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance Lobarts_Giant_Bug1(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance Lobarts_Giant_Bug2(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance Lobarts_Giant_Bug3(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance Lobarts_Giant_Bug4(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance Lobarts_Giant_Bug5(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance Lobarts_Giant_Bug6(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

instance Lobarts_Giant_Bug7(Mst_Default_Giant_Bug)
{
	name[0] = CZ_NAME_Monster_GiantBug;
	level = 4;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};