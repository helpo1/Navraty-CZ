
prototype Mst_Default_Bloodhound(C_Npc)
{
	name[0] = CZ_NAME_Monster_Bloodhound;
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_Bloodhound;
	level = 12;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 25;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void Set_Bloodhound_Visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Bhd_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_Argul_Visuals()
{
	Mdl_SetVisual(self,"Rage.mds");
	Mdl_SetVisualBody(self,"Rage_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Argul(Mst_Default_Bloodhound)
{
	name[0] = CZ_NAME_Monster_Bloodhound_Argul;
	aivar[AIV_Gender] = TRUE;
	level = 25;
	attribute[ATR_STRENGTH] = 520;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 240;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 125;
	Set_Argul_Visuals();
	Npc_SetToFistMode(self);
};

instance BLOODHOUND_UNIQ_01(Mst_Default_Bloodhound)
{
	name[0] = CZ_NAME_Monster_Bloodhound_Eratu;
	level = 150;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 320;
	protection[PROT_EDGE] = 320;
	protection[PROT_POINT] = 280;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 275;
	protection[PROT_MAGIC] = 240;
	Set_Argul_Visuals();
	CreateInvItems(self,ItMi_Mutagen_HP_Strong,1);
	Npc_SetToFistMode(self);
};

instance Bloodhound(Mst_Default_Bloodhound)
{
	name[0] = CZ_NAME_Monster_Bloodhound;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 25;
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};

instance BLOODHOUND_UNIQ_02(Mst_Default_Bloodhound)
{
	name[0] = CZ_NAME_Monster_Bloodhound_Gaalar;
	level = 80;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 5500;
	attribute[ATR_HITPOINTS] = 5500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 70;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	CreateInvItems(self,ItMi_Mutagen_HP_Low,1);
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};