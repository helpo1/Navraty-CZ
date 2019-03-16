
prototype Mst_Default_FireGolem(C_Npc)
{
	name[0] = CZ_NAME_Monster_FireGolem;
	guild = GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_FIREGOLEM;
	level = 30;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 1750;
	attribute[ATR_HITPOINTS] = 1750;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 125;
	damagetype = DAM_BLUNT | DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 350;
	damage[DAM_INDEX_FIRE] = 250;
	damage[DAM_INDEX_FLY] = 100;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_FireGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_FireGolem_Uniq()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_firesoul()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gow_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Fire_Elemental()
{
	Mdl_SetVisual(self,"Avatar.mds");
	Mdl_SetVisualBody(self,"Avatar_Body_Fire",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance FireGolem(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem;
	level = 30;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 1800;
	attribute[ATR_HITPOINTS] = 1800;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 125;
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};

instance FireGolem_Dragon(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem_FireElemental;
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 125;
	B_SetVisuals_Fire_Elemental();
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	Npc_SetToFistMode(self);
};

instance FireGolem_Avatar(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem;
	level = 30;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 125;
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};

instance FIREGOLEM_NOEXP(Mst_Default_FireGolem)
{
	level = 1;
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};

instance SUMMONED_FIREGOLEM(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem_Summoned;
	guild = GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_GOLEM;
	level = 0;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 220;
	attribute[ATR_DEXTERITY] = 220;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};

instance FIRETESTMONSTER_05(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem_TrueFireSpirit;
	guild = GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 12000;
	attribute[ATR_HITPOINTS] = 12000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 125;
	effect = "SPELLFX_FIREARMOR";
	b_setvisuals_firesoul();
	CreateInvItems(self,ItMi_Sapphire,1);
	Npc_SetToFistMode(self);
};

instance FIREGOLEM_UNIQ(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem_Magolemus;
	flags = NPC_FLAG_IMMORTAL;
	level = 200;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	b_setvisuals_firesoul();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Ruby,1);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Normal,1);
};

instance FireGolem_LV(Mst_Default_FireGolem)
{
	name[0] = CZ_NAME_Monster_FireGolem_Fiaras;
	guild = GIL_FIREGOLEM;
	level = 250;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 50000;
	attribute[ATR_HITPOINTS] = 50000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 370;
	protection[PROT_EDGE] = 370;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	bodyStateInterruptableOverride = TRUE;
	damagetype = DAM_BLUNT | DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 500;
	damage[DAM_INDEX_FIRE] = 250;
	damage[DAM_INDEX_FLY] = 200;
	b_setvisuals_firesoul();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_FiarasHeart,1);
};