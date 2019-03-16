
prototype Mst_Default_Swampshark(C_Npc)
{
	name[0] = "Болотожор";
	guild = GIL_SWAMPSHARK;
	vars[1] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPSHARK;
	level = 25;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Swampshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Desertshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

instance Swampshark(Mst_Default_Swampshark)
{
	name[0] = "Болотожор";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_SWAMPSHARK;
	level = 25;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance Desertshark(Mst_Default_Swampshark)
{
	name[0] = "Песчаный червь";
	aivar[AIV_Gender] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_DESERTSHARK;
	level = 30;
	attribute[ATR_STRENGTH] = 490;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	B_SetVisuals_Desertshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_01(Mst_Default_Swampshark)
{
	name[0] = "Болотожор";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_SWAMPSHARK;
	level = 25;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_02(Mst_Default_Swampshark)
{
	name[0] = "Болотожор";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_SWAMPSHARK;
	level = 25;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_03(Mst_Default_Swampshark)
{
	name[0] = "Болотожор";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_SWAMPSHARK;
	level = 25;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_Lou(Mst_Default_Swampshark)
{
	name[0] = "Болотожор";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_SWAMPSHARK;
	level = 25;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ITKE_Addon_Tavern_01,1);
};

instance SWAMPSHARK_UNIQ(Mst_Default_Swampshark)
{
	name[0] = "Живоглот";
	level = 50;
	vars[1] = TRUE;
	guild = GIL_SWAMPSHARK;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 230;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 20;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};