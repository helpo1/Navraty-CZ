
prototype Mst_Default_Gobbo_Green(C_Npc)
{
	name[0] = "Гоблин";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_GREEN;
	level = 5;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_Gobbo_Green()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GOBBO_GREEN1(Mst_Default_Gobbo_Green)
{
	name[0] = "Молодой гоблин";
	level = 4;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 25;
	attribute[ATR_HITPOINTS] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance Gobbo_Green(Mst_Default_Gobbo_Green)
{
	name[0] = "Гоблин";
	aivar[AIV_Gender] = TRUE;
	level = 5;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance XARDAS_GOBLIN(Mst_Default_Gobbo_Green)
{
	name[0] = "Гоблин";
	flags = NPC_FLAG_IMMORTAL;
	level = 50;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	B_SetVisuals_Gobbo_Green();
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance GOBBO_GREEN_UNIQ(Mst_Default_Gobbo_Green)
{
	name[0] = " Мирбл ";
	level = 30;
	damagetype = DAM_BLUNT;
	attribute[ATR_STRENGTH] = 115;
	attribute[ATR_DEXTERITY] = 195;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 20;
	aivar[90] = TRUE;
	B_SetVisuals_Gobbo_Green();
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};