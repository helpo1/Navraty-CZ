
prototype MST_SKELETON_KNIGHT(C_Npc)
{
	name[0] = CZ_NAME_Monster_SkeletonKnight;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	level = 25;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1700;
	attribute[ATR_HITPOINTS] = 1700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

prototype Mst_Skeleton_Lord(C_Npc)
{
	name[0] = CZ_NAME_Monster_SkeletonLord;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	level = 30;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

prototype Mst_Skeleton_Priest(C_Npc)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	level = 30;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

prototype MST_SKELETON_KNIGHT_DEATH(C_Npc)
{
	name[0] = CZ_NAME_Monster_SkeletonKnightDeath;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	level = 35;
	attribute[ATR_STRENGTH] = 570;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

prototype MST_SKELETON_LORD_SHADOW(C_Npc)
{
	name[0] = CZ_NAME_Monster_SkeletonLordShadow;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	level = 40;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 430;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 230;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 90;
	damagetype = DAM_EDGE;
	EquipItem(self,ITMW_2H_DOOMSWORD_PreElite);
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void b_setvisuals_skeleton_knight()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	self.effect = "SPELLFX_WHITEEYES";
};

func void b_setvisuals_skeleton_knight_shield()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Shield.MDS");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_k);
	self.effect = "SPELLFX_WHITEEYES";
};

func void B_SetVisuals_Skeleton_Lord()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",DEFAULT,DEFAULT,itar_pal_skel_p);
};

func void b_setvisuals_skeleton_knight_death()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",7,7,itar_pal_skel_d);
	self.effect = "SPELLFX_GREENEYES";
};

func void b_setvisuals_skeleton_lord_shadow()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",4,4,itar_pal_skel);
};

func void b_setvisuals_skeleton_lord_death()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",2,2,itar_pal_skel_u);
	self.effect = "SPELLFX_REDEYES";
};

func void b_setvisuals_skeleton_lord_death_pal()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",2,2,itar_pal_skel_vh);
	self.effect = "SPELLFX_REDEYES";
};

instance SKELETON_KNIGHT(MST_SKELETON_KNIGHT)
{
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_KNIGHT_DI(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Archol1(MST_SKELETON_KNIGHT)
{
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Archol2(MST_SKELETON_KNIGHT)
{
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Archol3(MST_SKELETON_KNIGHT)
{
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Archol4(MST_SKELETON_KNIGHT)
{
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Archol5(MST_SKELETON_KNIGHT)
{
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Archol6(MST_SKELETON_KNIGHT)
{
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_KNIGHT_SHIELD_DI(MST_SKELETON_KNIGHT)
{
	name[0] = CZ_NAME_Monster_SkeletonKnight_Shield;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3400;
	attribute[ATR_HITPOINTS] = 3400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 40;
	attribute[ATR_REGENERATEMANA] = 150;
	b_setvisuals_skeleton_knight_shield();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
	EquipItem(self,ItAr_Shield_01_Damn);
};

instance SKELETON_KNIGHT_SHIELD(MST_SKELETON_KNIGHT)
{
	name[0] = CZ_NAME_Monster_SkeletonKnight_Shield;
	protection[PROT_POINT] = 1000;
	attribute[ATR_REGENERATEMANA] = 150;
	b_setvisuals_skeleton_knight_shield();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
	EquipItem(self,ItAr_Shield_01_Damn);
};

instance skeleton_knight_ginnok_01(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance skeleton_knight_ginnok_02(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance skeleton_knight_ginnok_03(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance skeleton_knight_ginnok_04(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance skeleton_knight_ginnok_05(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance skeleton_knight_ginnok_06(MST_SKELETON_KNIGHT)
{
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Lord(Mst_Skeleton_Lord)
{
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_2H_DOOMSWORD);
	B_SetVisuals_Skeleton_Lord();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Lord_DI(Mst_Skeleton_Lord)
{
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	B_SetVisuals_Skeleton_Lord();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Lord_Champion(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_SanctuaryGuardian;
	level = 75;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 850;
	attribute[ATR_DEXTERITY] = 800;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	b_setvisuals_skeleton_lord_death_pal();
};

instance Skeleton_Lord_UD(MST_SKELETON_KNIGHT)
{
	name[0] = CZ_NAME_Monster_SkeletonKnight_GuardMinion;
	level = 1;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	B_SetVisuals_Skeleton_Lord();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_LORD_SHADOW(MST_SKELETON_LORD_SHADOW)
{
	name[0] = CZ_NAME_Monster_SkeletonLordShadow;
	protection[PROT_POINT] = IMMUNE;
	b_setvisuals_skeleton_lord_shadow();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

//---------------Dolina Teney---------------------------------

instance SKELETON_KNIGHT_DEATH(MST_SKELETON_KNIGHT_DEATH)
{
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_KNIGHT_DEATH_01(MST_SKELETON_KNIGHT_DEATH)
{
	protection[PROT_POINT] = 1000;
	aivar[AIV_EnemyOverride] = TRUE;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_KNIGHT_DEATH_02(MST_SKELETON_KNIGHT_DEATH)
{
	protection[PROT_POINT] = 1000;
	aivar[AIV_EnemyOverride] = TRUE;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_KNIGHT_DEATH_03(MST_SKELETON_KNIGHT_DEATH)
{
	protection[PROT_POINT] = 1000;
	aivar[AIV_EnemyOverride] = TRUE;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_KNIGHT_DEATH_04(MST_SKELETON_KNIGHT_DEATH)
{
	protection[PROT_POINT] = 1000;
	aivar[AIV_EnemyOverride] = TRUE;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_LORD_KELTUZED(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Dakkat;
	level = 400;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 45000;
	attribute[ATR_HITPOINTS] = 45000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 270;
	protection[PROT_EDGE] = 340;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 290;
	protection[PROT_FLY] = 240;
	protection[PROT_MAGIC] = 250;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death();
	EquipItem(self,itmw_2h_weltenspalter);
	CreateInvItems(self,ItMi_Gold,5000);
	CreateInvItems(self,itke_kod_shv,1);
	CreateInvItems(self,ItPo_Mana_03,1);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
};


//-----------------------Ritual Adanosa------------------------------------

instance WATERRITUALKNIGHTDEATH_01(MST_SKELETON_KNIGHT)
{
	name[0] = CZ_NAME_Monster_SkeletonKnight_ServantEvil;
	level = 30;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance WATERRITUALKNIGHTDEATH_02(MST_SKELETON_KNIGHT)
{
	name[0] = CZ_NAME_Monster_SkeletonKnight_ServantEvil;
	level = 30;
	protection[PROT_POINT] = 1000;
	b_setvisuals_skeleton_knight_death();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance WATERRITUALSKELETONLORD(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_ServantEvil;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 600;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	b_setvisuals_skeleton_lord_death();
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

//-----------------------Plato drevnikh------------------------------------

prototype Mst_Skeleton_Lord_Mage(C_Npc)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_MAGE;
	level = 35;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton_Mage_AV()
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

instance Skeleton_Mage_AV(Mst_Skeleton_Lord_Mage)
{
	protection[PROT_POINT] = 1000;
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Raven_SkelMag_01(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_PriestMinion;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Raven_SkelMag_02(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_PriestMinion;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Raven_SkelMag_03(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_PriestMinion;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Raven_SkelMag_04(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_PriestMinion;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Oazis_02(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
	CreateInvItems(self,ItKe_Oazis_02,1);
};

instance Skeleton_Mage_AV_Oazis_03(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItKe_Oazis_03,1);
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_TT(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_Malsur;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance SKELETON_LORD_KADAR(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Kaddar;
	level = 250;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 320;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITWR_HROMANIN,1);
	CreateInvItems(self,ItMi_Gold,2000);
	CreateInvItems(self,ItPo_Mana_03,2);
	CreateInvItems(self,ItPo_Health_03,2);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance Skeleton_Lord_Archol(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_ArKhol;
	level = 400;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 230;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death_pal();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ItMi_Gold,2500);
	CreateInvItems(self,ItKe_EVT_UNDEAD_01,1);
	CreateInvItems(self,ItPo_Mana_03,2);
	CreateInvItems(self,ItPo_Health_03,2);
	CreateInvItems(self,ItPl_Perm_Herb,1);
};

instance SKELETON_LORD_SERDAH(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Sengakh;
	level = 200;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 210;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death_pal();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ItMi_Gold,1000);
	CreateInvItems(self,ItPo_Mana_03,2);
	CreateInvItems(self,ItPl_Perm_Herb,1);
};

//--------------Temnyy orden----------------------------------------

instance Crypt_Skeleton_Lord(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Inubis;
	level = 250;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 210;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death_pal();
	CreateInvItems(self,ItMi_DragonStaffPiece_03,1);
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ItMi_Gold,1500);
	CreateInvItems(self,ItPo_Health_03,2);
	CreateInvItems(self,ItPl_Perm_Herb,1);
};

instance SKELETON_LORD_MIRAT(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Mirrat;
	level = 300;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 210;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death_pal();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ItMi_Gold,1000);
	CreateInvItems(self,ItPo_Mana_03,2);
	CreateInvItems(self,ItPl_Perm_Herb,1);
};

instance DARKTOWER_SKELETON_LORD(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Ulzar;
	level = 350;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 35000;
	attribute[ATR_HITPOINTS] = 35000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 230;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ItMi_Gold,250);
	CreateInvItems(self,itpo_demon_potion,1);
	CreateInvItem(self,ItSc_HarmUndead);
};

instance Skeleton_Lord_Ginnok(Mst_Skeleton_Lord)
{
	name[0] = CZ_NAME_Monster_SkeletonLord_Ginnok_Title;
	level = 500;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_LORD;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 240;
	protection[PROT_MAGIC] = 250;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_lord_death_pal();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ItKe_Ginnok,1);
};

//--------------------------------Zhretsy-----------------------------------


func void B_SetVisuals_Skeleton_Shadow_Priest()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,4,"Zom_Head",4,DEFAULT,ItAr_DEAD_PRIEST);
};

func void B_SetVisuals_Skeleton_Shadow_Priest_Hi()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,4,"Zom_Head",4,DEFAULT,ItAr_DEAD_PRIEST);
};

func void B_SetVisuals_Skeleton_Shadow_Priest_PW()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,4,"Zom_Head",4,DEFAULT,ITAR_ASSASINS_DEAD);
};

func void B_SetVisuals_Skeleton_Shadow_Priest_KDF()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,4,"Zom_Head",4,DEFAULT,ITAR_FIREGUARDIAN);
};

instance Skeleton_Shadow_Priest_AdanosHram(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Temple;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Hrom(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	CreateInvItems(self,ITWR_HROMANIN_6,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Elite(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Skeleton_Shadow_Priest_JC(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 70;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_ADW_01(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Skeleton_Shadow_Priest_ADW_02(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Skeleton_Shadow_Priest_ADW_03(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Skeleton_Shadow_Priest_ADW_04(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Skeleton_Shadow_Priest_ADW_05(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Skeleton_Shadow_Priest_Quardimon(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Kardimon_Title;
	voice = 18;
	id = 1160;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = FALSE;
	level = 200;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 190;
	protection[PROT_MAGIC] = 175;
	B_SetVisuals_Skeleton_Shadow_Priest_Hi();
	CreateInvItems(self,ItPo_Perm_Mana,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance SkeletonMage_Azgolor(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Ikhiyal_Title;
	level = 100;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Skeleton_Shadow_Priest();
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	CreateInvItems(self,itke_mage_shv,1);
	CreateInvItems(self,ItPo_Perm_Mana,1);
	CreateInvItems(self,ItPo_Mana_Addon_04,2);
	CreateInvItems(self,ItRi_Ihiyal,1);
};

instance SecretLibrarySkeleton(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Ilkrus_Title;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	level = 200;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 175;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_Shadow_Priest_KDF();
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	CreateInvItems(self,ItPo_Perm_Mana,1);
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
};

instance ShadowGuardTwo(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_Elayr_Title;
	guild = GIL_SKELETON;
	aivar[90] = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_MAGE;
	level = 150;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 35000;
	attribute[ATR_HITPOINTS] = 35000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 360;
	protection[PROT_FLY] = 340;
	protection[PROT_MAGIC] = 350;
	damagetype = DAM_EDGE;
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	EquipItem(self,ITMW_SHADOWPRIEST_Elair);
	B_SetVisuals_Skeleton_Mage_AV();
};

instance Skeleton_Mage_AV_Elite_Q1(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q2(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q3(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q4(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q5(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q6(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q7(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Mage_AV_Elite_Q8(Mst_Skeleton_Lord_Mage)
{
	name[0] = CZ_NAME_Monster_SkeletonLordMage_AncientHighPriest;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	protection[PROT_POINT] = 1000;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	B_SetVisuals_Skeleton_Mage_AV();
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Skeleton_Shadow_Priest_Q1(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q2(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q3(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q4(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q5(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q6(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q7(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Skeleton_Shadow_Priest_Q8(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	bodyStateInterruptableOverride = FALSE;
	level = 50;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 75;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItPo_Mana_Addon_04,1);
	EquipItem(self,ITMW_SHADOWPRIEST);
};

instance Druid_Agony(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Druid;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	aivar[94] = NPC_LEGEND;
	bodyStateInterruptableOverride = FALSE;
	level = 100;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItMi_Seed_Agony,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Druid_Despair(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Druid;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	aivar[94] = NPC_LEGEND;
	bodyStateInterruptableOverride = FALSE;
	level = 100;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItMi_Seed_Despair,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};

instance Druid_Doom(Mst_Skeleton_Priest)
{
	name[0] = CZ_NAME_Monster_SkeletonPriest_Druid;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_PRIEST;
	aivar[94] = NPC_LEGEND;
	bodyStateInterruptableOverride = FALSE;
	level = 100;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	B_SetVisuals_Skeleton_Shadow_Priest();
	CreateInvItems(self,ItMi_Seed_Doom,1);
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
};