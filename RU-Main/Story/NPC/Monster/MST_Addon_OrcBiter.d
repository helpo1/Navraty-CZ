
prototype Mst_Default_OrcBiter(C_Npc)
{
	name[0] = "Орочий кусач";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_OrcBiter;
	level = 9;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_ApplyOverlayMds(self,"Orcbiter.mds");
	Mdl_SetVisualBody(self,"Sc2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance OrcBiter(Mst_Default_OrcBiter)
{
	name[0] = "Орочий кусач";
	aivar[AIV_Gender] = TRUE;
	level = 9;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
};

instance OrcBiter_Falk_01(Mst_Default_OrcBiter)
{
	name[0] = "Орочий кусач";
	aivar[AIV_Gender] = TRUE;
	level = 9;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
};

instance OrcBiter_Falk_02(Mst_Default_OrcBiter)
{
	name[0] = "Орочий кусач";
	aivar[AIV_Gender] = TRUE;
	level = 9;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
};

instance OrcBiter_Falk_03(Mst_Default_OrcBiter)
{
	name[0] = "Орочий кусач";
	aivar[AIV_Gender] = TRUE;
	level = 9;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
};

instance OrcBiter_Falk_04(Mst_Default_OrcBiter)
{
	name[0] = "Орочий кусач";
	aivar[AIV_Gender] = TRUE;
	level = 9;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
};

instance OrcBiter_Falk_05(Mst_Default_OrcBiter)
{
	name[0] = "Орочий кусач";
	aivar[AIV_Gender] = TRUE;
	level = 9;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 10;
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
};