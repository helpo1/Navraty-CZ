
prototype Mst_Default_Scavenger_Demon(C_Npc)
{
	name[0] = NAME_ADDON_SCAVENGERGL;
	guild = GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER_DEMON;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_EatGroundStart] = 6;
	aivar[AIV_MM_EatGroundEnd] = 22;
};

func void B_SetVisuals_Scavenger_Demon()
{
	Mdl_SetVisual(self,"ScavengerGL.mds");
	Mdl_SetVisualBody(self,"Scavenger_Demon_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Scavenger_Demon(Mst_Default_Scavenger_Demon)
{
	name[0] = CZ_NAME_Monster_ScavengerDemon;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
};