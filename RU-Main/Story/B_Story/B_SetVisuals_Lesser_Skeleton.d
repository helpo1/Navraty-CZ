
var int randomposition;

prototype Mst_Default_Skeleton(C_Npc)
{
	name[0] = "Скелет-боец";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 15;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,60);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Lesser_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Orc_Skeleton()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_ske_body_01",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Skeleton_Ds_M()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"SKELETON_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_skeleton_om()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
};

func void b_setvisuals_skeleton_am()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
};

func void b_setvisuals_lesser_skeleton_dark()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",1,1,"Ske_Head",1,1,-1);
	self.effect = "SPELLFX_GREENEYES";
};

func void B_SetVisuals_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,itar_skel_war);
	self.effect = "SPELLFX_WHITEEYES";
};

func void B_SetVisuals_Skeleton_Summon()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,itar_skel_war);
};

func void B_SetVisuals_Skeleton_Speer()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,itar_skel_war);
	self.effect = "SPELLFX_WHITEEYES";
};

func void b_setvisuals_skeleton_dark()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body3",DEFAULT,DEFAULT,"Ske_Head",1,1,itar_skel_dar);
	self.effect = "SPELLFX_GREENEYES";
};

func void b_setvisuals_skeleton_warrior()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,ITAR_WEMON_ADDON);
	self.effect = "SPELLFX_WHITEEYES";
};

func void b_setvisuals_skeleton_warrior_dark()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",2,2,ITAR_DEMON_ADDON);
	self.effect = "SPELLFX_GREENEYES";
};

func void b_setvisuals_skeleton_warrior_dark_ilarah()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",2,2,ITAR_ILARAH);
	self.effect = "SPELLFX_WHITEEYES";
};

func void b_setvisuals_skeleton_warrior_dark_summon()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Skeleton_Wait.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",2,2,ITAR_DEMON_ADDON);
};

func void B_SetVisuals_Skeleton_Capitan_Drake()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_pirate.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"SKE_DRKCAP_BODY",DEFAULT,DEFAULT,"Ske_Head",2,2,-1);
	self.effect = "SPELLFX_GREENEYES";
};

func void B_SetVisuals_Skeleton_Capitan()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_pirate.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"SKE_PIRCAP_BODY",DEFAULT,DEFAULT,"Ske_Head",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Skeleton_Sailor()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"SKE_PIRSAIL_BODY",DEFAULT,DEFAULT,"Ske_Head",DEFAULT,DEFAULT,-1);
};

instance SKELETON_OM01(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om01;
};

func void rtn_start_skeleton_om01()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_01");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_01");
};

instance SKELETON_OM02(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om02;
};


func void rtn_start_skeleton_om02()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_02");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_02");
};


instance SKELETON_OM03(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om03;
};


func void rtn_start_skeleton_om03()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_03");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_03");
};


instance SKELETON_OM04(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om04;
};


func void rtn_start_skeleton_om04()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_04");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_04");
};


instance SKELETON_OM05(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om05;
};


func void rtn_start_skeleton_om05()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_05");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_05");
};


instance SKELETON_OM06(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om06;
};


func void rtn_start_skeleton_om06()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_06");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_06");
};


instance SKELETON_OM07(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om07;
};


func void rtn_start_skeleton_om07()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_07");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_07");
};


instance SKELETON_OM08(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om08;
};


func void rtn_start_skeleton_om08()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_08");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_08");
};


instance SKELETON_OM09(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om09;
};


func void rtn_start_skeleton_om09()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_09");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_09");
};


instance SKELETON_OM10(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om10;
};


func void rtn_start_skeleton_om10()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_10");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_10");
};


instance SKELETON_OM11(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om11;
};


func void rtn_start_skeleton_om11()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_11");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_11");
};


instance SKELETON_OM12(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om12;
};


func void rtn_start_skeleton_om12()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_12");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_12");
};


instance SKELETON_OM13(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om13;
};


func void rtn_start_skeleton_om13()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_13");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_13");
};


instance SKELETON_OM14(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om14;
};


func void rtn_start_skeleton_om14()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_14");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_14");
};


instance SKELETON_OM15(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om15;
};


func void rtn_start_skeleton_om15()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_15");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_15");
};


instance SKELETON_OM16(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om16;
};


func void rtn_start_skeleton_om16()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_16");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_16");
};


instance SKELETON_OM17(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om17;
};


func void rtn_start_skeleton_om17()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_17");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_17");
};


instance SKELETON_OM18(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om18;
};


func void rtn_start_skeleton_om18()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_18");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_18");
};


instance SKELETON_OM19(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om19;
};


func void rtn_start_skeleton_om19()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_19");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_19");
};


instance SKELETON_OM20(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om20;
};


func void rtn_start_skeleton_om20()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_20");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_20");
};


instance SKELETON_OM21(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om21;
};


func void rtn_start_skeleton_om21()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_21");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_21");
};


instance SKELETON_OM22(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om22;
};


func void rtn_start_skeleton_om22()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_22");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_22");
};


instance SKELETON_OM23(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om23;
};


func void rtn_start_skeleton_om23()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_23");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_23");
};


instance SKELETON_OM24(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om24;
};


func void rtn_start_skeleton_om24()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_24");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_24");
};


instance SKELETON_OM25(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om25;
};


func void rtn_start_skeleton_om25()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_25");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_25");
};


instance SKELETON_OM26(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om26;
};


func void rtn_start_skeleton_om26()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_26");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_26");
};


instance SKELETON_OM27(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om27;
};


func void rtn_start_skeleton_om27()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_27");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_27");
};


instance SKELETON_OM28(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om28;
};


func void rtn_start_skeleton_om28()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_28");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_28");
};


instance SKELETON_OM29(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om29;
};


func void rtn_start_skeleton_om29()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_29");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_29");
};


instance SKELETON_OM30(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om30;
};


func void rtn_start_skeleton_om30()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_30");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_30");
};


instance SKELETON_OM31(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om31;
};


func void rtn_start_skeleton_om31()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_31");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_31");
};


instance SKELETON_OM32(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om32;
};


func void rtn_start_skeleton_om32()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_32");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_32");
};


instance SKELETON_OM33(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om33;
};


func void rtn_start_skeleton_om33()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_33");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_33");
};


instance SKELETON_OM34(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om34;
};


func void rtn_start_skeleton_om34()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_34");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_34");
};


instance SKELETON_OM35(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om35;
};


func void rtn_start_skeleton_om35()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_35");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_35");
};


instance SKELETON_OM36(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om36;
};


func void rtn_start_skeleton_om36()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_36");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_36");
};


instance SKELETON_OM37(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om37;
};


func void rtn_start_skeleton_om37()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_37");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_37");
};


instance SKELETON_OM38(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om38;
};


func void rtn_start_skeleton_om38()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_38");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_38");
};


instance SKELETON_OM39(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om39;
};


func void rtn_start_skeleton_om39()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_39");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_39");
};


instance SKELETON_OM40(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om40;
};


func void rtn_start_skeleton_om40()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_40");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_40");
};


instance SKELETON_OM41(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om41;
};


func void rtn_start_skeleton_om41()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_41");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_41");
};


instance SKELETON_OM42(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om42;
};


func void rtn_start_skeleton_om42()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_42");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_42");
};


instance SKELETON_OM43(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om43;
};


func void rtn_start_skeleton_om43()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_43");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_43");
};


instance SKELETON_OM44(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om44;
};


func void rtn_start_skeleton_om44()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_44");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_44");
};


instance SKELETON_OM45(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om45;
};


func void rtn_start_skeleton_om45()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_45");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_45");
};


instance SKELETON_OM46(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_om();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_om46;
};


func void rtn_start_skeleton_om46()
{
	TA_Pick_Ore(8,0,23,0,"OMS_PICKORE_46");
	TA_Pick_Ore(23,0,8,0,"OMS_PICKORE_46");
};


instance SKELETON_AM01(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am01;
};


func void rtn_start_skeleton_am01()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_01");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_01");
};


instance SKELETON_AM02(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am02;
};


func void rtn_start_skeleton_am02()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_02");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_02");
};


instance SKELETON_AM03(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am03;
};


func void rtn_start_skeleton_am03()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_03");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_03");
};


instance SKELETON_AM04(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am04;
};


func void rtn_start_skeleton_am04()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_04");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_04");
};


instance SKELETON_AM05(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am05;
};


func void rtn_start_skeleton_am05()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_05");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_05");
};


instance SKELETON_AM06(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am06;
};


func void rtn_start_skeleton_am06()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_06");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_06");
};


instance SKELETON_AM07(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am07;
};


func void rtn_start_skeleton_am07()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_07");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_07");
};


instance SKELETON_AM08(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am08;
};


func void rtn_start_skeleton_am08()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_08");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_08");
};


instance SKELETON_AM09(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am09;
};


func void rtn_start_skeleton_am09()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_09");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_09");
};


instance SKELETON_AM10(Npc_Default)
{
	name[0] = "Скелет рудокопа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_am10;
};


func void rtn_start_skeleton_am10()
{
	TA_Pick_Ore(8,0,23,0,"AM_PICKORE_10");
	TA_Pick_Ore(23,0,8,0,"AM_PICKORE_10");
};


instance SKELETON_ALEF(Npc_Default)
{
	name[0] = "Скелет Алефа";
	guild = GIL_SKELETON;
	level = 10;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	b_setvisuals_skeleton_am();
	B_GiveNpcTalents(self);
	CreateInvItems(self,itat_skeletonbonealef,1);
	B_SetFightSkills(self,60);
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_skeleton_alef;
};


func void rtn_start_skeleton_alef()
{
	TA_Stand_WP(8,0,23,0,"WP_ALEF");
	TA_Stand_WP(23,0,8,0,"WP_ALEF");
};


instance Lesser_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Скелет";
	level = 10;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance LESSER_SKELETON_NOEXP(Mst_Default_Skeleton)
{
	name[0] = "Скелет";
	level = 1;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance LESSER_SKELETON_DARK(Mst_Default_Skeleton)
{
	name[0] = "Демонический cкелет";
	level = 12;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetFightSkills(self,90);
	b_setvisuals_lesser_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Скелет-боец";
	level = 15;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Speer(Mst_Default_Skeleton)
{
	name[0] = "Скелет-копейщик";
	level = 15;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton_Speer();
	B_SetFightSkills(self,80);
	EquipItem(self,ITMW_1H_DoomSpeer);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Shield(Mst_Default_Skeleton)
{
	name[0] = "Скелет-страж";
	level = 20;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,80);
	B_SetVisuals_Skeleton();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItAr_Shield_03_Damn);
};

instance Skeleton_Shield_OC(Mst_Default_Skeleton)
{
	name[0] = "Скелет-страж";
	level = 20;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,80);
	B_SetVisuals_Skeleton();
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItAr_Shield_03_Damn);
};

instance SKELETON_NONEEXP(Mst_Default_Skeleton)
{
	name[0] = "Скелет-боец";
	level = 1;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_DARK(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-боец";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 17;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Dark_NoExp(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-боец";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 1;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance WATERRITUALZOMBIE_01(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 15;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 900;
	attribute[ATR_HITPOINTS] = 900;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance WATERRITUALZOMBIE_02(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 15;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 900;
	attribute[ATR_HITPOINTS] = 900;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance WATERRITUALZOMBIE_03(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 15;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 900;
	attribute[ATR_HITPOINTS] = 900;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance WATERRITUALZOMBIE_04(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 15;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 900;
	attribute[ATR_HITPOINTS] = 900;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance XARDAS_SKELETON_GUARD_01(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 20;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance XARDAS_SKELETON_GUARD_02(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 20;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance XARDAS_SKELETON_GUARD_SUM_01(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 20;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance XARDAS_SKELETON_GUARD_SUM_02(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_SKELETON;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 20;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR(Mst_Default_Skeleton)
{
	name[0] = "Скелет-воин";
	level = 20;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_warrior();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_OC(Mst_Default_Skeleton)
{
	name[0] = "Скелет-воин";
	level = 20;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_warrior();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_OC(Mst_Default_Skeleton)
{
	name[0] = "Скелет-боец";
	level = 15;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Speer_OC(Mst_Default_Skeleton)
{
	name[0] = "Скелет-копейщик";
	level = 15;
	attribute[ATR_STRENGTH] = 270;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton_Speer();
	B_SetFightSkills(self,80);
	EquipItem(self,ITMW_1H_DoomSpeer);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_DARK(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-воин";
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance SKELETON_WARRIOR_DARK_AXE(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-берсерк";
	level = 40;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 90;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMAXE);
};

instance SKELETON_WARRIOR_DARK_SPEER(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-копейщик";
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 90;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DoomSpeer_Elite);
};

instance SKELETON_WARRIOR_DARK_OC(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-воин";
	level = 50;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance SKELETON_WARRIOR_DARK_NOEXP(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-воин";
	level = 1;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance SKELETON_WARRIOR_DARK_NOEXP_MAR(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-воин";
	level = 1;
	attribute[ATR_STRENGTH] = 99999;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 99999;
	attribute[ATR_HITPOINTS] = 99999;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance SKELETON_WARRIOR_DARK_SHIELD(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 45;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance SKELETON_WARRIOR_DARK_SHIELD_MASTER(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-военочальник";
	level = 75;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance SKELETON_WARRIOR_DARK_SHIELD_NOEXP(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 1;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance SKELETON_WARRIOR_DARK_SHIELD_OC(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 45;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
};

instance SKELETON_KREOL_01(Mst_Default_Skeleton)
{
	name[0] = "Страж Креола";
	guild = GIL_SKELETON;
	level = 60;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance SKELETON_KREOL_02(Mst_Default_Skeleton)
{
	name[0] = "Страж Креола";
	guild = GIL_SKELETON;
	level = 60;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance SKELETON_KREOL_03(Mst_Default_Skeleton)
{
	name[0] = "Страж Креола";
	guild = GIL_SKELETON;
	level = 60;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance SKELETON_KREOL_04(Mst_Default_Skeleton)
{
	name[0] = "Страж Креола";
	guild = GIL_SKELETON;
	level = 60;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 20;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance Skeleton_SoulKeeper(Mst_Default_Skeleton)
{
	name[0] = "Душа-страж";
	level = 1;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 240;
	protection[PROT_EDGE] = 240;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 290;
	protection[PROT_FLY] = 210;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance SKELETON_WARRIOR_DARK_FIRESHPERE(Mst_Default_Skeleton)
{
	name[0] = "Даг'Кар";
	level = 100;
	attribute[ATR_STRENGTH] = 830;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance SKELETON_WARRIOR_DARK_DARKSHPERE(Mst_Default_Skeleton)
{
	name[0] = "Вал'Зар";
	level = 100;
	attribute[ATR_STRENGTH] = 820;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
	CreateInvItem(self,ITMW_2H_KMR_SOULSWORD_01);
};

instance SKELETON_WARRIOR_DARK_WATERSHPERE(Mst_Default_Skeleton)
{
	name[0] = "Тра'Кор";
	level = 100;
	attribute[ATR_STRENGTH] = 820;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance SKELETON_WARRIOR_DARK_STONESHPERE(Mst_Default_Skeleton)
{
	name[0] = "Иту'Сед";
	level = 100;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	CreateInvItem(self,ItMi_PortalCrystal);
	CreateInvItem(self,ItWr_Stonnos_05);
	CreateInvItem(self,ItWr_StonePower);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

prototype SUMMONED_SKELETON_A(C_Npc)
{
	name[0] = "Cкелет-слуга";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Lesser_Skeleton();
	B_SetFightSkills(self,50);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword_Sum);
};

instance Summoned_Skeleton(SUMMONED_SKELETON_A)
{
	name[0] = "Cкелет-слуга";
	level = 0;
	B_SetVisuals_Lesser_Skeleton();
};

prototype SUMMONED_SKELETON_B(C_Npc)
{
	name[0] = "Cкелет-воин";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 20;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,80);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Skeleton_Summon();
	EquipItem(self,ItMw_1h_MISC_Sword_Str);
};

instance Summoned_Skeleton_Warrior(SUMMONED_SKELETON_B)
{
	name[0] = "Cкелет-воин";
	level = 0;
	B_SetVisuals_Skeleton_Summon();
};

prototype SUMMONED_SKELETON_C(C_Npc)
{
	name[0] = "Cкелет-страж";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 30;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	b_setvisuals_skeleton_warrior_dark_Summon();
	EquipItem(self,ItMw_1h_MISC_Sword_Mst);
};

instance Summoned_Skeleton_Guard(SUMMONED_SKELETON_C)
{
	name[0] = "Cкелет-страж";
	level = 0;
	b_setvisuals_skeleton_warrior_dark_Summon();
};

prototype SUMMONED_SKELETON_E(C_Npc)
{
	name[0] = "Cкелет-воин";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 20;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,80);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Skeleton_Summon();
	EquipItem(self,ItMw_1h_MISC_Sword_Str);
};

instance Summoned_Skeleton_Warrior_Chosen(SUMMONED_SKELETON_E)
{
	name[0] = "Cкелет-воин";
	level = 0;
	B_SetVisuals_Skeleton_Summon();
};

prototype SUMMONED_SKELETON_ORC_A(C_Npc)
{
	name[0] = "Cкелет-орк";
	guild = GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_SKELETON;
	level = 0;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 4;
	attribute[ATR_MANA] = 4;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 20;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Orc_Skeleton();
	EquipItem(self,ITMW_2H_DRACONSWORD_DEAD_SUM);
};

instance Summoned_Skeleton_Orc(SUMMONED_SKELETON_ORC_A)
{
	name[0] = "Cкелет-орк";
	level = 0;
	B_SetVisuals_Orc_Skeleton();
};

instance DARKSKELETON1_SENDSENYAK(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-боец";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 1;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance DARKSKELETON2_SENDSENYAK(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-боец";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 1;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_skeleton_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON1_SENDSENYAK(Mst_Default_Skeleton)
{
	name[0] = "Скелет-боец";
	level = 1;
	attribute[ATR_STRENGTH] = 325;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON2_SENDSENYAK(Mst_Default_Skeleton)
{
	name[0] = "Скелет-боец";
	level = 1;
	attribute[ATR_STRENGTH] = 325;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON3_SENDSENYAK(Mst_Default_Skeleton)
{
	name[0] = "Скелет-боец";
	level = 1;
	attribute[ATR_STRENGTH] = 325;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Crypt_Skeleton_Room_01(Mst_Default_Skeleton)
{
	name[0] = "Страж склепа";
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	CreateInvItem(self,ItKe_EVT_CRYPT_01);
};

instance Crypt_Skeleton_Room_02(Mst_Default_Skeleton)
{
	name[0] = "Страж склепа";
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	CreateInvItem(self,ItKe_EVT_CRYPT_02);
};

instance Crypt_Skeleton_Room_03(Mst_Default_Skeleton)
{
	name[0] = "Страж склепа";
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	CreateInvItem(self,ItKe_EVT_CRYPT_03);
};

instance Skeleton_Mario1(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
};

instance Skeleton_Mario2(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_2H_DOOMSWORD);
};

instance Skeleton_Mario3(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
};

instance Skeleton_Mario4(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_2H_DOOMSWORD);
};

func void b_setvisuals_zombie_om1()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_stt_z);
};

func void b_setvisuals_zombie_om2()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_stt_z1);
};

func void b_setvisuals_zombie_om3()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_grd_z);
};

func void b_setvisuals_zombie_om4()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_Bloodwyn_Addoz);
};

func void b_setvisuals_zombie_om5()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_Thorus_Addoz);
};

func void b_setvisuals_zombie_oc1()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_TPL_Z);
};

func void b_setvisuals_ancientwarrior_01()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_MayaZombie_Addon);
};

func void b_setvisuals_ancientwarrior_02()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
};

instance Ancient_Warrior_01(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance ZOMBIE_OC1(Mst_Default_Skeleton)
{
	name[0] = "Зомби-страж";
	level = 20;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	attribute[ATR_STRENGTH] = 355;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 70;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_zombie_oc1();
	B_SetFightSkills(self,80);
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
};

instance ZOMBIE_OM1(Mst_Default_Skeleton)
{
	name[0] = "Зомби-страж";
	level = 20;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 1400;
	attribute[ATR_HITPOINTS] = 1400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 70;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_zombie_om1();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	b_createambientinv_om(1);
	start_aistate = ZS_MM_AllScheduler;
};

instance ZOMBIE_OM2(Mst_Default_Skeleton)
{
	name[0] = "Зомби-страж";
	level = 20;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 1400;
	attribute[ATR_HITPOINTS] = 1400;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 70;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_zombie_om2();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	b_createambientinv_om(1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance FIRETESTMONSTER_04(Mst_Default_Skeleton)
{
	name[0] = "Дух Огня";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 20;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};

instance XARDAS_SKELETON_GUARD_03(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 40;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 110;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance XARDAS_SKELETON_GUARD_04(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 40;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 110;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance XARDAS_SKELETON_GUARD_05(Mst_Default_Skeleton)
{
	name[0] = "Cтраж Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 40;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 110;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton();
	start_aistate = ZS_MM_AllScheduler;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton_Priest()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_priest_v01",DEFAULT,DEFAULT,"Ske_Head",6,6,-1);
};

instance Skeleton_Priest(Mst_Default_Skeleton)
{
	name[0] = "Скелет-жрец";
	level = 15;
	attribute[ATR_STRENGTH] = 370;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton_Priest();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETONMAGE_STRANGECAVE(Mst_Default_Skeleton)
{
	name[0] = "Cкелет-призрак";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	flags = NPC_FLAG_GHOST;
	level = 50;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 180;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 75;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_Priest();
	EquipItem(self,ItMw_1h_MISC_Sword);
	CreateInvItems(self,ItPo_Perm_Mana,1);
	CreateInvItems(self,ItPo_Perm_Health,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_PW_GUARD_01(Mst_Default_Skeleton)
{
	name[0] = "Скелет-страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_PW_GUARD_02(Mst_Default_Skeleton)
{
	name[0] = "Скелет-страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_PW_GUARD_03(Mst_Default_Skeleton)
{
	name[0] = "Скелет-страж";
	level = 15;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_DARK_PW_GUARD_01(Mst_Default_Skeleton)
{
	name[0] = "Воин-страж";
	level = 25;
	attribute[ATR_STRENGTH] = 275;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
};

instance SKELETON_DARK_PW_GUARD_02(Mst_Default_Skeleton)
{
	name[0] = "Воин-страж";
	level = 25;
	attribute[ATR_STRENGTH] = 275;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
};

instance SKELETON_DARK_PW_GUARD_03(Mst_Default_Skeleton)
{
	name[0] = "Воин-страж";
	level = 25;
	attribute[ATR_STRENGTH] = 275;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD);
};

func void B_SetVisuals_Skeleton_AV()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_priest_v02",DEFAULT,DEFAULT,"Ske_Head",6,6,-1);
};

func void B_SetVisuals_Skeleton_AV_Elite()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_priest_v03",DEFAULT,DEFAULT,"Ske_Head",6,6,-1);
	self.effect = "SPELLFX_WHITEEYES";
};

func void B_SetVisuals_Skeleton_AV_Elite_Xert()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_priest_v03",DEFAULT,DEFAULT,"Ske_Head",6,6,-1);
	self.effect = "SPELLFX_WHITEEYES";
};

instance SKELETON_WARRIOR_AV(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};


instance Raven_SkelWar_01(Mst_Default_Skeleton)
{
	name[0] = "Скелет-миньон";
	level = 40;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_SkelWar_02(Mst_Default_Skeleton)
{
	name[0] = "Скелет-миньон";
	level = 40;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_SkelWar_03(Mst_Default_Skeleton)
{
	name[0] = "Скелет-миньон";
	level = 40;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Raven_SkelWar_04(Mst_Default_Skeleton)
{
	name[0] = "Скелет-миньон";
	level = 40;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_War_TT(Mst_Default_Skeleton)
{
	name[0] = "Аму'Хас";
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 230;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 50;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance Skeleton_Capitan_Drake(Mst_Default_Skeleton)
{
	name[0] = " Дрейк ";
	level = 100;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 290;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	B_SetVisuals_Skeleton_Capitan_Drake();
	CreateInvItems(self,ItMI_Addon_Kompass_Mis,1);
	CreateInvItems(self,ItMw_Drakesaebel,1);
	EquipItem(self,ItMw_Doom_OldPiratensaebel);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Skeleton_Capitan(Mst_Default_Skeleton)
{
	name[0] = "Скелет-капитан";
	level = 20;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1200;
	attribute[ATR_HITPOINTS] = 1200;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	B_SetVisuals_Skeleton_Capitan();
	EquipItem(self,ItMw_Doom_OldPiratensaebel);
	EquipItem(self,ItAr_PirateHat);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Skeleton_Sailor(Mst_Default_Skeleton)
{
	name[0] = "Скелет-пират";
	level = 15;
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	B_SetVisuals_Skeleton_Sailor();
	EquipItem(self,ItMw_Doom_OldPiratensaebel);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Skeleton_Test(Mst_Default_Skeleton)
{
	name[0] = "Скелет-чучело";
	guild = GIL_MEATBUG;
	level = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_Skeleton();
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Xardas_Skeleton_Servant_01(Mst_Default_Skeleton)
{
	name[0] = "Слуга Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	id = 716;
	level = 10;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 380;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_716;
};

func void Rtn_Start_716()
{
	TA_Stand_Sweeping(8,0,16,0,"NW_IDOL_01_04");
	TA_Stand_Sweeping(16,0,23,0,"NW_XARDAS_TOWER_IN1_03");
	TA_Stand_Sweeping(23,0,8,0,"NW_XARDAS_TOWER_IN1_02");
};

instance Xardas_Skeleton_Servant_02(Mst_Default_Skeleton)
{
	name[0] = "Слуга Ксардаса";
	guild = GIL_KDM;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	id = 717;
	level = 10;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 380;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	daily_routine = rtn_start_717;
};

func void Rtn_Start_717()
{
	TA_Cook_Stove(8,0,23,0,"NW_XARDAS_TOWER_IN1_97");
	TA_Cook_Stove(23,0,8,0,"NW_XARDAS_TOWER_IN1_97");
};

instance Orc_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Орк-скелет";
	level = 35;
	attribute[ATR_STRENGTH] = 580;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 240;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	fight_tactic = FAI_ORC;
	B_SetVisuals_Orc_Skeleton();
	EquipItem(self,ITMW_2H_DRACONSWORD_DEAD);
	CreateInvItems(self,ItAt_SkeletonBone,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance WATERRITUALDARKSKELETON_01(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 20;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance WATERRITUALDARKSKELETON_02(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 20;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance WATERRITUALDARKSKELETON_03(Mst_Default_Skeleton)
{
	name[0] = "Слуга зла";
	level = 20;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2700;
	attribute[ATR_HITPOINTS] = 2700;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,90);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance Skeleton_Chaos(Mst_Default_Skeleton)
{
	name[0] = "Миньон Хаоса";
	level = 100;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};

instance ShadowGuardOne(Mst_Default_Skeleton)
{
	name[0] = "Ксерт, Призрачное Солнце";
	level = 150;
	flags = NPC_FLAG_IMMORTAL;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 35000;
	attribute[ATR_HITPOINTS] = 35000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 4000;
	protection[PROT_MAGIC] = 400;
	B_SetFightSkills(self,100);
	B_SetVisuals_Skeleton_AV_Elite_Xert();
	Mdl_ApplyOverlayMds(self,"humans_1hST3.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST3.mds");
	EquipItem(self,ItMw_2H_ShadowBlade_Xert);
	fight_tactic = FAI_HUMAN_MASTER;

};

//----------------------армия кварходрона--------------------------


instance Ancient_Warrior_Q1(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q2(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q3(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q4(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q5(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q6(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q7(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q8(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Ancient_Warrior_Q9(Mst_Default_Skeleton)
{
	name[0] = "Древний воин зодчих";
	level = 40;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 240;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_STRONG;
	b_setvisuals_ancientwarrior_01();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q1(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q2(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q3(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q4(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q5(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q6(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q7(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_ELITE_Q8(Mst_Default_Skeleton)
{
	name[0] = "Страж Древних";
	level = 40;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV_Elite();
	EquipItem(self,ITMW_2H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q1(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q2(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q3(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q4(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q5(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q6(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q7(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance SKELETON_WARRIOR_AV_Q8(Mst_Default_Skeleton)
{
	name[0] = "Воин Древних";
	level = 30;
	aivar[AIV_StoryBandit] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_AV();
	EquipItem(self,ITMW_1H_DOOMSWORD);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

//----------------эпик-----------------------------------

instance SKELETON_WARRIOR_LV_SHIELD(Mst_Default_Skeleton)
{
	name[0] = "Древний скелет-страж";
	level = 70;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance SKELETON_WARRIOR_DARK_LV_SPEER(Mst_Default_Skeleton)
{
	name[0] = "Древний скелет-копейщик";
	level = 65;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DoomSpeer_Elite);
};

instance SKELETON_WARRIOR_LV(Mst_Default_Skeleton)
{
	name[0] = "Древний скелет-воин";
	level = 65;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
};

instance SKELETON_WARRIOR_LV_AXE(Mst_Default_Skeleton)
{
	name[0] = "Древний скелет-берсерк";
	level = 75;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 150;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMAXE);
};

//----------------------------братья призраки-------------------------------------

func void B_SetVisuals_Skeleton_Dex_Kzar()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_priest_v03",DEFAULT,DEFAULT,"Ske_Head",6,6,-1);
	self.effect = "SPELLFX_GREENEYES";
};

func void B_SetVisuals_Skeleton_Str_Kzar()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",2,2,ITAR_DEMON_ADDON);
	self.effect = "SPELLFX_REDEYES";
};

func void B_SetVisuals_Skeleton_Mag_Kzar()
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

instance Skeleton_Bro_Dex(Mst_Default_Skeleton)
{
	name[0] = "Дра'Кзар, призрак-страж";
	level = 150;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 120;
	protection[PROT_FLY] = 120;
	protection[PROT_MAGIC] = 120;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton_Dex_Kzar();
	B_SetFightSkills(self,100);
	EquipItem(self,ItRw_Undead);
	CreateInvItems(self,ItRw_Arrow,10);
	EquipItem(self,ITMW_1H_DoomSpeer_Elite);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Bro_Str(Mst_Default_Skeleton)
{
	name[0] = "Иль'Кзар, призрак-страж";
	level = 150;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 750;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 80;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	B_SetVisuals_Skeleton_Str_Kzar();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Bro_Mag(Mst_Default_Skeleton)
{
	name[0] = "Ар'Кзар, призрак-страж";
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	bodyStateInterruptableOverride = TRUE;
	level = 150;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 40000;
	attribute[ATR_HITPOINTS] = 40000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 390;
	protection[PROT_MAGIC] = 375;
	B_SetVisuals_Skeleton_Mag_Kzar();
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Xardas_DT_Demon1(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance Xardas_DT_Demon2(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance Xardas_DT_Demon3(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance Xardas_DT_Demon4(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance Xardas_DT_Demon5(Mst_Default_Skeleton)
{
	name[0] = "Демонический скелет-страж";
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 60;
	fight_tactic = FAI_HUMAN_MASTER;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetFightSkills(self,100);
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItAr_Shield_02_Damn);
};

instance Xardas_DT_DemonLord(Mst_Default_Skeleton)
{
	name[0] = "Демонический страж-хранитель";
	level = 100;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_MANA] = 6666;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	fight_tactic = FAI_HUMAN_MASTER;
	b_setvisuals_skeleton_warrior_dark();
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
};