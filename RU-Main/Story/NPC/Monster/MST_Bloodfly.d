
prototype Mst_Default_Bloodfly(C_Npc)
{
	name[0] = "Кровяной шершень";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 3;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_POINT;
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

func void B_SetVisuals_Bloodfly()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_bloodfly_poison()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",1,1,"",DEFAULT,DEFAULT,-1);
};


instance BLOODFLY1(Mst_Default_Bloodfly)
{
	name[0] = "Малый кровяной шершень";
	level = 2;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance Bloodfly(Mst_Default_Bloodfly)
{
	name[0] = "Кровяной шершень";
	aivar[AIV_Gender] = TRUE;
	level = 3;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};

instance Bloodfly_Rune(Mst_Default_Bloodfly)
{
	name[0] = "Кровяной шершень";
	aivar[AIV_Gender] = TRUE;
	level = 3;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};

instance BLOODFLY_POISON(Mst_Default_Bloodfly)
{
	name[0] = "Ядовитый кровяной шершень";
	aivar[AIV_Gender] = TRUE;
	level = 8;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_bloodfly_poison();
	Npc_SetToFistMode(self);
};

instance BLOODFLY_UNIQ(Mst_Default_Bloodfly)
{
	name[0] = "Плотоядный шершень";
	level = 30;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	aivar[90] = TRUE;
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.2,1.2,1.2);
};