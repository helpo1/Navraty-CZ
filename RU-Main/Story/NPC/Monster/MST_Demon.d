
prototype Mst_Default_Demon(C_Npc)
{
	name[0] = "Демон";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON;
	level = 30;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 225;
	protection[PROT_EDGE] = 225;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Demon()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Demon(Mst_Default_Demon)
{
	name[0] = "Демон";
	level = 30;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance DEMON_NOEXP(Mst_Default_Demon)
{
	name[0] = "Демон";
	level = 1;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance DEMON_NONEEXP(Mst_Default_Demon)
{
	name[0] = "Демон";
	level = 30;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance SKELETONMAGE_SENDSENYAK_1(Mst_Default_Demon)
{
	name[0] = "Слуга архидемона С'эньяка";
	level = 1;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance SKELETONMAGE_SENDSENYAK_2(Mst_Default_Demon)
{
	name[0] = "Слуга архидемона С'эньяка";
	level = 1;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance SKELETONMAGE_SENDSENYAK_3(Mst_Default_Demon)
{
	name[0] = "Слуга архидемона С'эньяка";
	level = 1;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance Summoned_Demon_Low(Mst_Default_Demon)
{
	name[0] = "Низший демон-слуга";
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	protection[PROT_MAGIC] = 125;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

instance Summoned_Demon(Mst_Default_Demon)
{
	name[0] = "Младший демон-слуга";
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	attribute[ATR_STRENGTH] = 225;
	attribute[ATR_DEXTERITY] = 225;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 15;
	attribute[ATR_MANA] = 15;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	Npc_SetToFistMode(self);
};

instance Summoned_Demon_Up_01(Mst_Default_Demon)
{
	name[0] = "Старший демон-слуга";
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2750;
	attribute[ATR_HITPOINTS] = 2750;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 175;
	protection[PROT_EDGE] = 175;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 175;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 175;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance Summoned_Demon_Up_02(Mst_Default_Demon)
{
	name[0] = "Высший демон-слуга";
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	attribute[ATR_STRENGTH] = 275;
	attribute[ATR_DEXTERITY] = 275;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 25;
	attribute[ATR_MANA] = 25;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Demon_SMD(Mst_Default_Demon)
{
	name[0] = "Кейрон";
	level = 75;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 250;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_SMD_Mutagen,1);
	CreateInvItems(self,ItMi_Ruby,1);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance Demon_MD(Mst_Default_Demon)
{
	name[0] = "Теамрук";
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7000;
	attribute[ATR_HITPOINTS] = 7000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 325;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_MD_Mutagen,1);
	CreateInvItems(self,ItMi_Diamod,1);
	Mdl_SetModelScale(self,0.9,0.9,0.9);
};