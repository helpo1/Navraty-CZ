
prototype Mst_Default_Keiler(C_Npc)
{
	name[0] = CZ_NAME_Monster_Keiler;
	guild = GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID] = ID_Keiler;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_Keiler()
{
	Mdl_SetVisual(self,"Keiler.mds");
	Mdl_SetVisualBody(self,"Keiler_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_keiles()
{
	Mdl_SetVisual(self,"Keiler_VB.mds");
	Mdl_SetVisualBody(self,"Keilerv_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	//Mdl_SetVisual(self,"Keiler.mds");
	//Mdl_SetVisualBody(self,"Keiles_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Keiler(Mst_Default_Keiler)
{
	name[0] = CZ_NAME_Monster_Keiler;
	aivar[AIV_Gender] = TRUE;
	level = 8;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
};

instance KEILER_VEPR(Mst_Default_Keiler)
{
	name[0] = CZ_NAME_Monster_Keiler_Vepr;
	level = 35;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 175;
	protection[PROT_EDGE] = 175;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 30;
	b_setvisuals_keiles();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_veprfur,1);
	Mdl_SetModelScale(self,1.2,1.2,1.2);
};

instance KEILER_YOUNG(Mst_Default_Keiler)
{
	name[0] = CZ_NAME_Monster_Keiler;
	aivar[AIV_Gender] = TRUE;
	level = 6;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 60;
	attribute[ATR_HITPOINTS] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
};