
prototype Mst_Default_StonePuma(C_Npc)
{
	name[0] = "Пума";
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_STONEPUMA;
	level = 15;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 175;
	attribute[ATR_HITPOINTS_MAX] = 450;
	attribute[ATR_HITPOINTS] = 450;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 35;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 6;
	aivar[AIV_MM_SleepEnd] = 20;
	aivar[AIV_MM_RoamStart] = 20;
	aivar[AIV_MM_RoamEnd] = 6;
};

func void B_SetVisuals_StonePuma()
{
	Mdl_SetVisual(self,"StonePuma.mds");
	Mdl_SetVisualBody(self,"StonePuma_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_StonePumz()
{
	Mdl_SetVisual(self,"StonePuma.mds");
	Mdl_SetVisualBody(self,"StonePumz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_wartaspuma()
{
	Mdl_SetVisual(self,"StonePuma.mds");
	Mdl_SetVisualBody(self,"WARTAPUMA_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance StonePuma(Mst_Default_StonePuma)
{
	name[0] = "Пума";
	aivar[AIV_Gender] = TRUE;
	level = 15;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 175;
	attribute[ATR_HITPOINTS_MAX] = 450;
	attribute[ATR_HITPOINTS] = 450;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 35;
	B_SetVisuals_StonePuma();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance StonePuma_OZ(Mst_Default_StonePuma)
{
	name[0] = "Горная белая пума";
	aivar[AIV_Gender] = TRUE;
	level = 25;
	aivar[AIV_MM_REAL_ID] = ID_ICEPUMA;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 375;
	attribute[ATR_HITPOINTS_MAX] = 1450;
	attribute[ATR_HITPOINTS] = 1450;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 55;
	B_SetVisuals_StonePumz();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance WARTASPUMA(Mst_Default_StonePuma)
{
	name[0] = "Гайдэ";
	level = 50;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 50;
	b_setvisuals_wartaspuma();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_Dex_Low,1);
	CreateInvItems(self,ITMI_UTONEPUMAPIECE,1);
};