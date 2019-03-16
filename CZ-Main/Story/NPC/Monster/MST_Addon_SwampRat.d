
prototype Mst_Default_Swamprat(C_Npc)
{
	name[0] = CZ_NAME_Monster_SwampRat;
	guild = GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID] = ID_Swamprat;
	level = 4;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Swamprat()
{
	Mdl_SetVisual(self,"Swamprat.mds");
	Mdl_SetVisualBody(self,"Swamprat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Swamprat(Mst_Default_Swamprat)
{
	name[0] = CZ_NAME_Monster_SwampRat;
	aivar[AIV_Gender] = TRUE;
	level = 4;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Swamprat();
	Npc_SetToFistMode(self);
};