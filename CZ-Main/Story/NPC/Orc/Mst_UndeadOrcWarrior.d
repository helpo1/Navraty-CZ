
prototype Mst_Default_UndeadOrcWarrior(C_Npc)
{
	name[0] = CZ_NAME_Orc_Undead;
	guild = GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCWARRIOR;
	level = 25;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 0;
	HitChance[NPC_TALENT_1H] = 50;
	HitChance[NPC_TALENT_2H] = 50;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

prototype MST_DEFAULT_UNDEADORCSHAMAN(C_Npc)
{
	name[0] = CZ_NAME_Orc_UndeadShaman;
	guild = GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCSHAMAN;
	voice = 18;
	level = 30;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 200;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};

func void B_SetVisuals_UndeadOrcWarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_undeadorcwarrior_extro()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_undeadorcshaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_ApplyOverlayMds(self,"ORC_GLM_MAGE.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UndeadOrcWarrior(Mst_Default_UndeadOrcWarrior)
{
	B_SetVisuals_UndeadOrcWarrior();
	EquipItem(self,itmw_2h_orcmace_01);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance UNDEADORCWARRIORELITE(Mst_Default_UndeadOrcWarrior)
{
	name[0] = CZ_NAME_Orc_UndeadLich;
	level = 40;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 550;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 260;
	protection[PROT_EDGE] = 260;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 300;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	b_setvisuals_undeadorcwarrior_extro();
	EquipItem(self,itmw_2h_orcmace_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
};

instance UNDEADORCSHAMAN(MST_DEFAULT_UNDEADORCSHAMAN)
{
	b_setvisuals_undeadorcshaman();
	EquipItem(self,itmw_orcstaff_undead);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance UNDEADORCSHAMAN_1(MST_DEFAULT_UNDEADORCSHAMAN)
{
	name[0] = CZ_NAME_Orc_Unique_UndeadOrcShaman_1;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCSHAMAN;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 300;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	b_setvisuals_undeadorcshaman();
	effect = "SPELLFX_MAGIC_SMOKE";
	EquipItem(self,itmw_orcstaff_undead);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItems(self,itmi_rockcrystal_ot1,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance UNDEADORCSHAMAN_2(MST_DEFAULT_UNDEADORCSHAMAN)
{
	name[0] = CZ_NAME_Orc_Unique_UndeadOrcShaman_2;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCSHAMAN;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 300;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	b_setvisuals_undeadorcshaman();
	effect = "SPELLFX_MAGIC_SMOKE";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,itmw_orcstaff_undead);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	CreateInvItems(self,itmi_rockcrystal_ot2,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance UNDEADORCSHAMAN_3(MST_DEFAULT_UNDEADORCSHAMAN)
{
	name[0] = CZ_NAME_Orc_Unique_UndeadOrcShaman_3;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCSHAMAN;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 300;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	b_setvisuals_undeadorcshaman();
	effect = "SPELLFX_MAGIC_SMOKE";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,itmw_orcstaff_undead);
	CreateInvItems(self,itmi_rockcrystal_ot3,1);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance UNDEADORCSHAMAN_4(MST_DEFAULT_UNDEADORCSHAMAN)
{
	name[0] = CZ_NAME_Orc_Unique_UndeadOrcShaman_4;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCSHAMAN;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 300;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	b_setvisuals_undeadorcshaman();
	effect = "SPELLFX_MAGIC_SMOKE";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,itmw_orcstaff_undead);
	CreateInvItems(self,itmi_rockcrystal_ot4,1);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};


prototype MST_DEFAULT_UNDEADORCWARRIORSH(C_Npc)
{
	name[0] = CZ_NAME_Orc_UndeadGhost;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	voice = 18;
	level = 10;
	flags = ORCTEMPLENPCFLAGS;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 1000;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

prototype MST_DEFAULT_UNDEADORCELITESH(C_Npc)
{
	name[0] = CZ_NAME_Orc_UndeadGhostBlack;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	level = 10;
	flags = ORCTEMPLENPCFLAGS;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 1000;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

prototype MST_DEFAULT_UNDEADORCSHAMANSH(C_Npc)
{
	name[0] = CZ_NAME_Orc_UndeadGhostShaman;
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 10;
	flags = ORCTEMPLENPCFLAGS;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 1000;
	HitChance[NPC_TALENT_1H] = 50;
	HitChance[NPC_TALENT_2H] = 50;
	HitChance[NPC_TALENT_BOW] = 50;
	HitChance[NPC_TALENT_CROSSBOW] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void b_setvisuals_orcsh()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaOrc",DEFAULT,DEFAULT,"Orc_HeadWarrior",0,1,-1);
};

func void b_setvisuals_orchuntersh()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaHun",DEFAULT,DEFAULT,"Orc_HeadWarrior",1,1,-1);
};

func void b_setvisuals_orcscoutsh()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaScout",DEFAULT,DEFAULT,"Orc_HeadWarrior",8,DEFAULT,-1);
};

func void b_setvisuals_orcwarriorsh()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWaSoldt",DEFAULT,DEFAULT,"Orc_HeadWarrior",0,DEFAULT,-1);
};

func void b_setvisuals_orcelitesh()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",9,DEFAULT,-1);
};

func void b_setvisuals_orcshamansh()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShamCm",1,1,"Orc_HeadShaman",0,DEFAULT,-1);
};


instance ORCWARRIOR_SH_01(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcscoutsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_02(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_03(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_04(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orchuntersh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_05(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_06(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcscoutsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_07(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orchuntersh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_08(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_09(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_10(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcscoutsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_11(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_12(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_13(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orchuntersh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_14(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_15(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcscoutsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_16(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_01(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_02(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_03(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_04(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_05(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_06(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_07(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_08(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_09(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_10(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_11(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCELITE_SH_12(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_01(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_02(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_03(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_04(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_05(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_06(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcwarriorsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCWARRIOR_SH_SIT_07(MST_DEFAULT_UNDEADORCWARRIORSH)
{
	b_setvisuals_orcscoutsh();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCELITE_SH_SIT_01(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCELITE_SH_SIT_02(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCELITE_SH_SIT_03(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCELITE_SH_SIT_04(MST_DEFAULT_UNDEADORCELITESH)
{
	b_setvisuals_orcelitesh();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_SH_01(MST_DEFAULT_UNDEADORCSHAMANSH)
{
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshamansh();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_SH_02(MST_DEFAULT_UNDEADORCSHAMANSH)
{
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshamansh();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_SH_03(MST_DEFAULT_UNDEADORCSHAMANSH)
{
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshamansh();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_SH_04(MST_DEFAULT_UNDEADORCSHAMANSH)
{
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshamansh();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_SH_05(MST_DEFAULT_UNDEADORCSHAMANSH)
{
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshamansh();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance ORCSHAMAN_SH_06(MST_DEFAULT_UNDEADORCSHAMANSH)
{
	EquipItem(self,itmw_orcstaff);
	b_setvisuals_orcshamansh();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

