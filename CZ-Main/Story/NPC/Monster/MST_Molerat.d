
prototype Mst_Default_Molerat(C_Npc)
{
	name[0] = CZ_NAME_Monster_Molerat;
	guild = GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID] = ID_MOLERAT;
	level = 1;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 25;
	protection[PROT_EDGE] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_Molerat()
{
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Molerat(Mst_Default_Molerat)
{
	name[0] = CZ_NAME_Monster_Molerat;
	level = 1;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
};