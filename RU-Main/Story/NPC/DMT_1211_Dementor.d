instance DMT_1211_Dementor(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 1211;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1211;
};


func void Rtn_Start_1211()
{
	TA_Stand_Dementor(8,0,23,0,"NW_TROLLAREA_RITUAL_13");
	TA_Stand_Dementor(23,0,8,0,"NW_TROLLAREA_RITUAL_13");
};

func void Rtn_AfterRitual_1211()
{
	TA_Stand_Dementor(6,0,7,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(7,0,8,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(8,0,9,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(9,0,10,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(10,0,11,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(11,0,12,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(12,0,13,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(13,0,14,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(14,0,15,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(15,0,16,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(16,0,17,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(17,0,18,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(18,0,19,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(19,0,20,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(20,0,21,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(21,0,22,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(22,0,23,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(23,0,0,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(0,0,1,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(1,0,2,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(2,0,3,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(3,0,4,0,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor(4,0,5,0,"NW_FOREST_PATH_79");
	TA_Stand_Dementor(5,0,6,0,"NW_CITY_TO_FARM2_05");
};

instance DMT_1812_Dementor(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 1812;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1812;
};

func void Rtn_Start_1812()
{
	TA_Stand_Dementor(8,0,23,0,"NW_FARM2_TO_TAVERN_09_MONSTER4");
	TA_Stand_Dementor(23,0,8,0,"NW_FARM2_TO_TAVERN_09_MONSTER4");
};

instance Skeleton_Bow(Npc_Default)
{
	name[0] = "Скелет-лучник";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	id = 1258;
	voice = 18;
	flags = 0;
	level = 150;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,4);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItRw_Undead);
	effect = "SPELLFX_WHITEEYES";
	CreateInvItems(self,ItRw_Arrow,10);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,itar_skel_war);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

instance Ancient_Warrior_02(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1259;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

instance ZOMBIE_OM3(Npc_Default)
{
	name[0] = "Зомби-страж";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1260;
	voice = 18;
	flags = 0;
	level = 200;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,4);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_grd_z);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

instance ZOMBIE_OM4(Npc_Default)
{
	name[0] = "Зомби-страж";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1261;
	voice = 18;
	flags = 0;
	level = 200;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,4);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_Bloodwyn_Addoz);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

instance ZOMBIE_OM5(Npc_Default)
{
	name[0] = "Зомби-страж";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1262;
	voice = 18;
	flags = 0;
	level = 200;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,4);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_Thorus_Addoz);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

instance Ahiron(Npc_Default)
{
	name[0] = "Ахирон";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	id = 2022;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 250;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	protection[PROT_POINT] = 1000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	effect = "SPELLFX_WHITEEYES";
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,ItAr_Mage_AV);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
	CreateInvItems(self,ItKe_AhironKey,1);
};

instance Imarah(Npc_Default)
{
	name[0] = "Им'Арах";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	id = 2021;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_EnemyOverride] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 500;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	protection[PROT_POINT] = 1000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	effect = "SPELLFX_WHITEEYES";
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,ItAr_Mage_AV);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
	CreateInvItems(self,ItMi_OldCoin,Hlp_Random(3) + 1);
};

instance Ancient_Warrior_QT1(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1263;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1263()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT2(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1264;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1264()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT3(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1265;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};


func void Rtn_TOT_1265()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT4(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1266;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1266()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT5(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1267;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1267()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT6(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1268;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1268()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT7(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1269;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1269()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT8(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1273;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1273()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Ancient_Warrior_QT9(Npc_Default)
{
	name[0] = "Древний воин зодчих";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE_OM;
	id = 1274;
	voice = 18;
	flags = 0;
	level = 400;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	EquipItem(self,ItRw_Crossbow_Undead);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ITMI_ZOMBIECORPSE,1);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	fight_tactic = FAI_HUMAN_MASTER;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	start_aistate = ZS_Stand_Dementor;
};

func void Rtn_TOT_1274()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance NONE_1813_Ilesil(Npc_Default)
{
	name[0] = "Иле'Силь";
	guild = GIL_NONE;
	id = 1813;
	voice = 18;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_DropDeadAndKill] = TRUE;
	npcType = npctype_main;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,888);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_1H_DOOMSWORD);
	EquipItem(self,ItRw_Undead);
	effect = "SPELLFX_WHITEEYES";
	CreateInvItems(self,ItRw_Arrow,10);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",1,1,"Ske_Head",1,1,ItAr_Mage_AV);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1813;
};

func void Rtn_Start_1813()
{
	TA_Sit_Campfire(8,0,23,0,"LOSTVALLEY_01");
	TA_Sit_Campfire(23,0,8,0,"LOSTVALLEY_01");
};

func void Rtn_HesFree_1813()
{
	TA_Stand_Guarding(8,0,23,0,"LOSTVALLEY_SOULKEEPER_01");
	TA_Stand_Guarding(23,0,8,0,"LOSTVALLEY_SOULKEEPER_01");
};

func void Rtn_SearchPlace_1813()
{
	TA_GhostWusel(8,0,23,0,"LOSTVALLEY_SOULKEEPER_01");
	TA_GhostWusel(23,0,8,0,"LOSTVALLEY_SOULKEEPER_01");
};

func void Rtn_FollowTemple_1813()
{
	TA_Follow_Player(5,0,20,0,"LOSTVALLEY_SOULKEEPER_01");
	TA_Follow_Player(20,0,5,0,"LOSTVALLEY_SOULKEEPER_01");
};

func void Rtn_WaitForHero_1813()
{
	TA_Stand_Guarding(8,0,23,0,"LV_WAITFORHERO_01");
	TA_Stand_Guarding(23,0,8,0,"LV_WAITFORHERO_01");
};

func void Rtn_InspectCircle_1813()
{
	TA_GhostWusel(8,0,23,0,"LV_WAITFORHERO_01");
	TA_GhostWusel(23,0,8,0,"LV_WAITFORHERO_01");
};

func void Rtn_TOT_1813()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void Rtn_TreeIsDead_1813()
{
	TA_Stand_Guarding(8,0,23,0,"WDS_LAVA_CASTLEYARD_01");
	TA_Stand_Guarding(23,0,8,0,"WDS_LAVA_CASTLEYARD_01");
};

func void Rtn_OpenHram_1813()
{
	TA_Stand_Guarding(8,0,23,0,"LOSTVALLEY_TEMPLE_IN");
	TA_Stand_Guarding(23,0,8,0,"LOSTVALLEY_TEMPLE_IN");
};

func void Rtn_TransText_1813()
{
	TA_Study_WP(8,0,23,0,"LOSTVALLEY_TEMPLE_IN");
	TA_Study_WP(23,0,8,0,"LOSTVALLEY_TEMPLE_IN");
};

instance Ilesil_Evil(Npc_Default)
{
	name[0] = "Иле'Силь";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	id = 1815;
	voice = 18;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,888);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	effect = "SPELLFX_REDEYES";
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,ItAr_Ilesil);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	daily_routine = Rtn_Start_1815;
};

func void Rtn_Start_1815()
{
	TA_Stand_Guarding(8,0,23,0,"WDS_LAVA_CASTLE_27");
	TA_Stand_Guarding(23,0,8,0,"WDS_LAVA_CASTLE_27");
};

instance Skeleton_Stefan(Npc_Default)
{
	name[0] = "Призрак";
	guild = GIL_DMT;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	id = 1816;
	voice = 18;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_Gender] = MALE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,58);
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_1H_DOOMSWORD_Elite);
	effect = "SPELLFX_WHITEEYES";
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_priest_v01",DEFAULT,DEFAULT,"Ske_Head",6,6,-1);
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1000;
	daily_routine = Rtn_Start_1816;
};

func void Rtn_Start_1816()
{
	TA_Stand_Sweeping(9,0,21,0,"NW_SOUL_LH_01");
	TA_Stand_Sweeping(21,0,9,0,"NW_SOUL_LH_01");
};

func void Rtn_JackTalk_1816()
{
	TA_Smalltalk(8,0,22,0,"NW_SOUL_LH_01");
	TA_Smalltalk(22,0,8,0,"NW_SOUL_LH_01");
};

func void Rtn_TOT_1816()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};
