
prototype Mst_Default_IceGolem(C_Npc)
{
	name[0] = "Ледяной голем";
	guild = GIL_ICEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_ICEGOLEM;
	level = 35;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 375;
	damagetype = DAM_BLUNT | DAM_MAGIC | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 350;
	damage[DAM_INDEX_MAGIC] = 250;
	damage[DAM_INDEX_FLY] = 100;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_IceGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_icegolem_water()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Wat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Ice_Elemental()
{
	Mdl_SetVisual(self,"Avatar.mds");
	Mdl_SetVisualBody(self,"Avatar_Body_Ice",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance IceGolem(Mst_Default_IceGolem)
{
	name[0] = "Ледяной голем";
	level = 35;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance IceGolem_Dragon(Mst_Default_IceGolem)
{
	name[0] = "Ледяной элементаль";
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 300;
	B_SetVisuals_Ice_Elemental();
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	Npc_SetToFistMode(self);
};

instance IceGolem_Avatar(Mst_Default_IceGolem)
{
	name[0] = "Ледяной голем";
	level = 35;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance ICEGOLEM_NOEXP(Mst_Default_IceGolem)
{
	level = 1;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance IceGolem_Sylvio1(Mst_Default_IceGolem)
{
	name[0] = "Ледяной голем";
	level = 35;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance IceGolem_Sylvio2(Mst_Default_IceGolem)
{
	name[0] = "Ледяной голем";
	level = 35;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance SUMMONED_ICEGOLEM(Mst_Default_IceGolem)
{
	name[0] = "Рунный ледяной голем";
	guild = GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_GOLEM;
	level = 0;
	attribute[ATR_STRENGTH] = 280;
	attribute[ATR_DEXTERITY] = 260;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 225;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 75;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance ICEGOLEM_UNIQ(Mst_Default_IceGolem)
{
	name[0] = "Октогор";
	level = 75;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 475;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Emerald,1);
	CreateInvItems(self,ItMi_Mutagen_Mana_Low,1);
};
