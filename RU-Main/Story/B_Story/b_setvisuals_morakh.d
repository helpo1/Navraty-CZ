
prototype MST_DEFAULT_MORAKH(C_Npc)
{
	name[0] = "Морак";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 20;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 20;
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

func void b_setvisuals_morakh()
{
	Mdl_SetVisual(self,"MORAKH.mds");
	Mdl_SetVisualBody(self,"MORAKH_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MORAKH(MST_DEFAULT_MORAKH)
{
	b_setvisuals_morakh();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
};

