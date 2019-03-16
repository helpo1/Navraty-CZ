
prototype Mst_Default_DragonSnapper(C_Npc)
{
	name[0] = CZ_NAME_Monster_DragonSnapper;
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_DRAGONSNAPPER;
	level = 40;
	attribute[ATR_STRENGTH] = 380;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 2400;
	attribute[ATR_HITPOINTS] = 2400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 230;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_DragonSnapper()
{
	Mdl_SetVisual(self,"DragonSnapper.mds");
	Mdl_SetVisualBody(self,"Razor_Demon_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance DragonSnapper(Mst_Default_DragonSnapper)
{
	name[0] = CZ_NAME_Monster_DragonSnapper;
	aivar[AIV_Gender] = TRUE;
	level = 40;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 2400;
	attribute[ATR_HITPOINTS] = 2400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 230;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

instance DragonSnapper_Trf(Mst_Default_DragonSnapper)
{
	name[0] = CZ_NAME_Monster_DragonSnapper;
	aivar[AIV_Gender] = TRUE;
	level = 40;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

instance DragonSnapper_Rune(Mst_Default_DragonSnapper)
{
	name[0] = CZ_NAME_Monster_DragonSnapper;
	aivar[AIV_Gender] = TRUE;
	level = 40;
	attribute[ATR_STRENGTH] = 380;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 230;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

instance DRAGONSNAPPERWITHKEY(Mst_Default_DragonSnapper)
{
	name[0] = CZ_NAME_Monster_DragonSnapper;
	aivar[AIV_Gender] = TRUE;
	level = 40;
	attribute[ATR_STRENGTH] = 380;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 2400;
	attribute[ATR_HITPOINTS] = 2400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 230;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itke_dragonsnapper,1);
};

instance Gaans_Snapper(Mst_Default_DragonSnapper)
{
	name[0] = CZ_NAME_Monster_DragonSnapper_Young;
	aivar[AIV_Gender] = TRUE;
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 115;
	protection[PROT_EDGE] = 115;
	protection[PROT_POINT] = 105;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};