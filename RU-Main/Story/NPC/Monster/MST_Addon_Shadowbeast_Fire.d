
prototype Mst_Default_Shadowbeast_Addon_Fire(C_Npc)
{
	name[0] = "Огненный дух-охотник";
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	level = 25;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_FIRE;
	fight_tactic = FAI_SHADOWBEAST;
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

func void B_SetVisuals_Shadowbeast_Fire()
{
	Mdl_SetVisual(self,"FireShadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Shadowbeast_Addon_Fire(Mst_Default_Shadowbeast_Addon_Fire)
{
	name[0] = "Огненный дух-охотник";
	level = 25;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance Shadowbeast_Addon_Fire_CanyonLib(Mst_Default_Shadowbeast_Addon_Fire)
{
	name[0] = "Айшар, огненный дух-хранитель";
	level = 50;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
	aivar[AIV_OriginalFightTactic] = FAI_Gargoyle;
	CreateInvItems(self,ItMi_Ruby,1);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance Shadowbeast_Addon_Fire_Lib(Mst_Default_Shadowbeast_Addon_Fire)
{
	name[0] = "Огненный дух-охотник";
	level = 25;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
	aivar[AIV_OriginalFightTactic] = FAI_Gargoyle;
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};