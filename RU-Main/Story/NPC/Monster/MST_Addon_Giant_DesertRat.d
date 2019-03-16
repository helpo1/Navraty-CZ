
prototype Mst_Default_Giant_DesertRat(C_Npc)
{
	name[0] = "Пустынная крыса";
	guild = GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID] = ID_Giant_Rat;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 75;
	attribute[ATR_HITPOINTS] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
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
};

func void B_SetVisuals_Giant_DesertRat()
{
	Mdl_SetVisual(self,"Giant_Rat.mds");
	Mdl_SetVisualBody(self,"Giant_DesertRat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Giant_DesertRat(Mst_Default_Giant_DesertRat)
{
	name[0] = "Пустынная крыса";
	aivar[AIV_Gender] = TRUE;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 75;
	attribute[ATR_HITPOINTS] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Giant_DesertRat();
	Npc_SetToFistMode(self);
};

instance GIANT_DESERTRAT_UNIQ(Mst_Default_Giant_DesertRat)
{
	name[0] = "Чумная крыса";
	level = 10;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 95;
	attribute[ATR_HITPOINTS_MAX] = 550;
	attribute[ATR_HITPOINTS] = 550;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	aivar[90] = TRUE;
	B_SetVisuals_Giant_DesertRat();
	Npc_SetToFistMode(self);
};