
prototype Mst_Default_Addon_SwampGolem(C_Npc)
{
	name[0] = "Болотный голем";
	guild = GIL_SWAMPGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_Swampgolem;
	level = 25;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1450;
	attribute[ATR_HITPOINTS] = 1450;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 200;
	damage[DAM_INDEX_FLY] = 100;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Swampgolem()
{
	Mdl_SetVisual(self,"SwampGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Sumpf_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_WoodGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"WoodGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Wood_Body",DEFAULT,	DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_DamnWoodGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"WoodGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Wood_Bodz",DEFAULT,	DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance SwampGolem(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Болотный голем";
	level = 25;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1400;
	attribute[ATR_HITPOINTS] = 1400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
};

instance WoodGolem(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Древесный голем";
	level = 30;
	aivar[AIV_MM_REAL_ID] = ID_WoodGolem;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1700;
	attribute[ATR_HITPOINTS] = 1700;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_WoodGolem();
	Npc_SetToFistMode(self);
};

instance SwampGolem_Dragon(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Элементаль земли";
	level = 1;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1400;
	attribute[ATR_HITPOINTS] = 1400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance SWAMPGOLEM_NOEXP(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Болотный голем";
	level = 1;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
};

instance SwampGolem_Valley(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Болотный голем";
	level = 25;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1400;
	attribute[ATR_HITPOINTS] = 1400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
	aivar[AIV_OriginalFightTactic] = FAI_STONEGOLEM;
};

instance SUMMONED_SWAMPGOLEM(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Рунный болотный голем";
	guild = GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_GOLEM;
	level = 0;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
};

instance AncientTreeGolem(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Экрон, проклятое древо";
	level = 300;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_WoodGolem;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 75000;
	attribute[ATR_HITPOINTS] = 75000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 500;
	B_SetVisuals_DamnWoodGolem();
	Npc_SetToFistMode(self);
};