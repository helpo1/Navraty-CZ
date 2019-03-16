
prototype MST_DEFAULT_SLEEPER(C_Npc)
{
	name[0] = "Заркул";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SLEEPER;
	level = 500;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 600;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 600;
	effect = "SPELLFX_FIREARROW";
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};

func void b_setvisuals_sleeper()
{
	Mdl_SetVisual(self,"sleepkeeper.mds");
	Mdl_SetVisualBody(self,"sleepkeeper_Bodz",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_sleeper_old()
{
	Mdl_SetVisual(self,"sleepkeeper.mds");
	Mdl_SetVisualBody(self,"sleeper_old_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance SLEEPER(MST_DEFAULT_SLEEPER)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	b_setvisuals_sleeper();
	EquipItem(self,ItMw_DS_MonWeapon_ExElite);
	CreateInvItems(self,ItMi_Mutagen_Dex_Strong,1);
};

instance SLEEPER_OLD(MST_DEFAULT_SLEEPER)
{
	name[0] = "Спящий";
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	guild = GIL_DMT;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_MM_REAL_ID] = ID_SLEEPER_OLD;
	bodyStateInterruptableOverride = TRUE;
	level = 500;
	attribute[ATR_STRENGTH] = 2000;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 60000;
	attribute[ATR_HITPOINTS] = 60000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 500;
	b_setvisuals_sleeper_old();
	EquipItem(self,ItMw_DS_MonWeapon_SpElite);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Avatar_Dark,1);
	CreateInvItems(self,ItMi_Mutagen_HP_Strong,1);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};