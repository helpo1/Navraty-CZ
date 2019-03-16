
prototype Mst_Default_Addon_Alligator(C_Npc)
{
	name[0] = "Аллигатор";
	guild = GIL_Alligator;
	aivar[AIV_MM_REAL_ID] = ID_Alligator;
	level = 10;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Alligator;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 18;
	aivar[AIV_MM_RoamStart] = 18;
	aivar[AIV_MM_RoamEnd] = 22;

};

func void B_SetVisuals_Alligator()
{
	Mdl_SetVisual(self,"Alligator.mds");
	Mdl_SetVisualBody(self,"KRO_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Alligator(Mst_Default_Addon_Alligator)
{
	name[0] = "Аллигатор";
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

instance Alligator_PortalDead(Mst_Default_Addon_Alligator)
{
	name[0] = "Аллигатор";
	aivar[AIV_Gender] = TRUE;
	level = 13;
	attribute[ATR_STRENGTH] = 280;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

instance ALLIGATOR_UNIQ(Mst_Default_Addon_Alligator)
{
	name[0] = "Древний Скалозуб";
	level = 80;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 50;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_ZubSkalo,1);
};