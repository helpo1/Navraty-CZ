
prototype Mst_Default_Skeleton_Mage(C_Npc)
{
	name[0] = "Cкелет-маг";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_MAGE;
	level = 25;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 275;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton_Mage()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
	self.effect = "SPELLFX_GREENEYES";
};

func void B_SetVisuals_Skeleton_Mage_Elite()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
	self.effect = "SPELLFX_REDEYES";
};

func void B_SetVisuals_Skeleton_Mage_New()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",1,1,"Ske_Head",1,1,ItAr_Mage_AV);
	self.effect = "SPELLFX_WHITEEYES";
};

instance SkeletonMage(Mst_Default_Skeleton_Mage)
{
	name[0] = "Cкелет-маг";
	level = 25;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 275;
	B_SetVisuals_Skeleton_Mage_New();
};

prototype SUMMONED_SKELETON_H(C_Npc)
{
	name[0] = "Cкелет-страж";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON_MAGE;
	level = 0;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 175;
	fight_tactic = FAI_HUMAN_STRONG;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	effect = "SPELLFX_MOON_SMOKE";
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Skeleton_Mage_New();
	EquipItem(self,ItMw_1h_MISC_Sword_Sum);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
};

instance Summoned_Skeleton_Mage(SUMMONED_SKELETON_H)
{
	name[0] = "Cкелет-страж";
	level = 0;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetVisuals_Skeleton_Mage_New();
};

instance SKELETONMAGE_DARKTOWER(Mst_Default_Skeleton_Mage)
{
	name[0] = "Cкелет-маг";
	level = 25;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 275;
	B_SetVisuals_Skeleton_Mage_New();
};

instance SkeletonMage_Angar(Mst_Default_Skeleton_Mage)
{
	name[0] = "Cкелет-маг";
	level = 25;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 275;
	B_SetVisuals_Skeleton_Mage_New();
	CreateInvItems(self,ItAm_Mana_Angar_MIS,1);
};

instance SKELETONMAGE_MINE(Mst_Default_Skeleton_Mage)
{
	name[0] = "Cкелет-маг";
	level = 25;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 175;
	B_SetVisuals_Skeleton_Mage_New();
};

instance Ghost(Mst_Default_Skeleton_Mage)
{
	name[0] = "Призрак";
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	B_SetVisuals_Skeleton_Mage();
	EquipItem(self,ITMW_1H_GHOSTSWORD);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ghost_OC(Mst_Default_Skeleton_Mage)
{
	name[0] = "Призрак";
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	B_SetVisuals_Skeleton_Mage();
	EquipItem(self,ITMW_1H_GHOSTSWORD);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ghost_LH(Mst_Default_Skeleton_Mage)
{
	name[0] = "Призрак";
	level = 1;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	B_SetVisuals_Skeleton_Mage();
	EquipItem(self,ITMW_1H_GHOSTSWORD);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ghost_LV(Mst_Default_Skeleton_Mage)
{
	name[0] = "Древний призрак";
	level = 100;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	B_SetVisuals_Skeleton_Mage();
	EquipItem(self,ITMW_1H_GHOSTSWORD);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ghost_Azgalor(Mst_Default_Skeleton_Mage)
{
	name[0] = "Призрак-миньон";
	level = 1;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	B_SetVisuals_Skeleton_Mage();
	EquipItem(self,ITMW_1H_GHOSTSWORD);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ghost_Uniq(Mst_Default_Skeleton_Mage)
{
	name[0] = "Изулг, страж мертвых";
	level = 150;
	guild = GIL_SKELETON;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	B_SetVisuals_Skeleton_Mage_Elite();
	EquipItem(self,ItMw_2H_IzgulScy);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_Mana_Strong,1);
};

instance Ghost_SoulKeeper(Mst_Default_Skeleton_Mage)
{
	name[0] = "Асинокс, хранитель душ";
	level = 150;
	guild = GIL_SKELETON;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_MM_REAL_ID] = ID_GHOST;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 50000;
	attribute[ATR_HITPOINTS] = 50000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	damagetype = DAM_MAGIC;
	damage[DAM_INDEX_MAGIC] = 100;
	aivar[AIV_EnemyOverride] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	B_SetVisuals_Skeleton_Mage_Elite();
	EquipItem(self,ItMw_SoulKeeperStaff);
	start_aistate = ZS_MM_Rtn_Ghost;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_IlesilSoul,1);
};
