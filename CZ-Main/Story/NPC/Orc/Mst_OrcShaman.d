
prototype Mst_Default_OrcShaman(C_Npc)
{
	name[0] = CZ_NAME_Orc_Shaman_V2;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = FALSE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};

func void B_SetVisuals_OrcShaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_ApplyOverlayMds(self,"ORC_GLM_MAGE.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShamEl",DEFAULT,DEFAULT,"Orc_HeadShaman",1,DEFAULT,-1);

};

func void b_setvisuals_orcshaman_common()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShamCm",0,0,"Orc_HeadShaman",0,DEFAULT,-1);
};

instance OrcShaman_Common(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Pray_01(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Pray_02(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Pray_03(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Elite(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	EquipItem(self,itmw_orcstaff);
	B_SetVisuals_OrcShaman();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Sit(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance GorkOrcShaman_Sit(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_MountainShaman;
	level = 20;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 370;
	attribute[ATR_HITPOINTS_MAX] = 1350;
	attribute[ATR_HITPOINTS] = 1350;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance MorkOrcShaman_Sit(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_MountainShaman;
	level = 20;
	guild = GIL_GOBBO_SKELETON;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 3000;
	attribute[ATR_DEXTERITY] = 370;
	attribute[ATR_HITPOINTS_MAX] = 13500;
	attribute[ATR_HITPOINTS] = 13500;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_ELITE_SIT(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_ShamanElite_V2;
	level = 15;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance GorkEliteShaman_Sit(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_ShamanEliteClan;
	level = 35;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 490;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 125;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance MorkEliteShaman_Sit(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_ShamanEliteClan;
	level = 35;
	guild = GIL_GOBBO_SKELETON;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	attribute[ATR_STRENGTH] = 4500;
	attribute[ATR_DEXTERITY] = 490;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 125;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_REST(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance ORCSHAMAN_ROAM(Mst_Default_OrcShaman)
{
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshaman_common();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance OrcShaman_Hosh_Pak(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Hosh_Pak;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance Orc_8572_UrHoshNar(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_UrHoshNar;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_Rtn_DragonRest_OrcSit;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance ORCSHAMAN_VAN_XAN(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Van_Xan;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Sit_CanyonLibraryKey(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_CanyonLibraryKey;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itke_canyonlibrary_hierarchy_books_addon,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_LEADER1(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_Leader1;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_LEADER2(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_Leader2;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_LEADER3(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_Leader3;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1200;
	attribute[ATR_MANA] = 1200;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_LEADER4(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_Leader4;
	level = 70;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_LEADER5(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_Leader5;
	level = 70;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_TEMPLE(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Special_Temple;
	level = 70;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_UR_DAH(Mst_Default_OrcShaman)
{
	name[0] = CZ_NAME_Orc_Unique_Ur_Dah;
	level = 50;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	aivar[90] = TRUE;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_OrcShaman();
	EquipItem(self,itmw_orcstaff_elite);
	CreateInvItems(self,itpo_xorcpotion,1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};