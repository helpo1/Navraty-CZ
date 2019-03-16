
instance XARDAS_SLAVE_03(C_Npc)
{
	name[0] = CZ_NAME_EMPTY;
	guild = GIL_ZOMBIE;
	id = 4769;
	voice = 18;
	level = 30;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	aivar[AIV_EnemyOverride] = TRUE;
	level = 100;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 275;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,-1);
	Npc_SetToFistMode(self);
	daily_routine = rtn_start_4769;
};


func void rtn_start_4769()
{
	TA_Stand_WP(5,0,23,0,"NW_XARDAS_RITUAL_03");
	TA_Stand_WP(23,0,5,0,"NW_XARDAS_RITUAL_03");
};

