
prototype Mst_Default_Razor(C_Npc)
{
	name[0] = CZ_NAME_Monster_Razor;
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_Razor;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void Set_Razor_Visuals()
{
	Mdl_SetVisual(self,"Razor.mds");
	Mdl_SetVisualBody(self,"Raz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Razor(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor01(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor02(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor03(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor04(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor05(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor06(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor07(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor08(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor09(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

instance CanyonRazor10(Mst_Default_Razor)
{
	name[0] = CZ_NAME_Monster_Razor;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

