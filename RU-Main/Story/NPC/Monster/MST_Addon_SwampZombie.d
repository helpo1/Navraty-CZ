
prototype Mst_Default_SwampZombie(C_Npc)
{
	name[0] = "Болотный зомби";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 15;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_SwampZombie()
{
	Mdl_SetVisual(self,"SwampZombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,-1);
};


instance SwampZombie(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

