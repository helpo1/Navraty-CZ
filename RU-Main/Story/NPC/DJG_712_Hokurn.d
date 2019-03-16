instance SLD_849_Hokurn(Npc_Default)
{
	name[0] = "Хокурн";
	guild = GIL_SLD;
	id = 849;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Sharky,BodyTex_B,itar_sld_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_849;
};

func void Rtn_Start_849()
{
	TA_Stand_Eating(8,0,10,0,"NW_BIGFARM_KITCHEN_09_B_HOK");
	TA_Stand_Guarding(10,0,12,0,"NW_BIGFARM_CAMPON_KDF_09");
	TA_Stand_Drinking(12,0,16,0,"NW_BIGFARM_KITCHEN_09_B_HOK");
	TA_Sit_Bench(16,0,18,0,"NW_BIGFARM_KITCHEN_09_B_HOK2");
	TA_Stand_Drinking(18,0,23,0,"NW_BIGFARM_KITCHEN_09_B_HOK");
	TA_Sleep(23,0,8,0,"NW_BIGFARM_CAMPON_HUN_08_HOK");
};

func void rtn_tot_849()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};


instance DJG_712_Hokurn(Npc_Default)
{
	name[0] = "Хокурн";
	guild = GIL_DJG;
	id = 712;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[96] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Sharky,BodyTex_B,itar_djg_m_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_712;
};


func void Rtn_PreStart_712()
{
	TA_Smalltalk(8,0,23,0,"OW_DJG_STARTCAMP_01");
	TA_Smalltalk(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void Rtn_Start_712()
{
	TA_Smalltalk(8,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	TA_Smalltalk(23,0,8,0,"SPAWN_OW_BLACKGOBBO_A1");
};

func void rtn_sturm_712()
{
	TA_Stand_Guarding(8,0,23,0,"OC_DJG_JOIN_03_03");
	TA_Stand_Guarding(23,0,8,0,"OC_DJG_JOIN_03_03");
};

func void rtn_follow_712()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_712()
{
	TA_Sit_Campfire(8,0,23,0,"OC_CAMPFIRE_OUT_03");
	TA_Sit_Campfire(23,0,8,0,"OC_CAMPFIRE_OUT_03");
};

func void rtn_palexit_712()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16_1");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16_1");
};

func void rtn_tot_712()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};


//----------------пасхальные персы-----------------------------------

instance SEK_4567_Unicorn(Npc_Default)
{
	name[0] = "Ю'Никорн";
	guild = GIL_SEK;
	id = 4567;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_SEKTANT_4,BodyTex_N,itar_gur_l);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_4567;
};

func void rtn_start_4567()
{
	TA_Smoke_Joint(8,0,22,0,"NW_PSICAMP_UNICORN");
	TA_Smoke_Joint(22,0,8,0,"NW_PSICAMP_UNICORN");
};

instance BDT_4568_KINJARTS(Npc_Default)
{
	name[0] = "Кинжартс";
	guild = GIL_BDT;
	id = 4568;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_BDT_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ImportantGrey,BodyTex_N,ITAR_THORUS_ADDON);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_4568;
};

func void Rtn_Start_4568()
{
	TA_Practice_Sword(8,0,22,0,"BL_UP_PLACE_04_B");
	TA_Stand_Drinking(22,0,8,0,"BL_INN_BAR_01");
};

func void Rtn_Invasion_4568()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"ADW_PIRATECAMP_CAVE3_01");
	TA_Stand_ArmsCrossed(22,0,8,0,"ADW_PIRATECAMP_CAVE3_01");
};

instance KDF_4569_AlexOne(Npc_Default)
{
	name[0] = "Лекс";
	guild = GIL_KDF;
	id = 4569;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,6);
	EquipItem(self,ItRw_Crossbow_L_02);
	CreateInvItems(self,ItRw_Bolt,10);
	aivar[AIV_IgnoresArmor] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",95,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_4569;
};

func void rtn_start_4569()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_ALEXONE");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_ALEXONE");
};

instance VLK_4570_Avabul(Npc_Default)
{
	name[0] = "Авабюл, жрица Белиара";
	guild = GIL_DMT;
	id = 4570;
	voice = 16;
	level = 100;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
 	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 2000;
	attribute[ATR_DEXTERITY] = 2000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 150;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_Gender] = FEMALE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	fight_tactic = FAI_HUMAN_MASTER;
	bodyStateInterruptableOverride = TRUE;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS");
	Mdl_SetVisualBody(self,"Demoness_bod",-1,-1,"Demoness_head",-1,0,-1);
	Mdl_ApplyOverlayMds(self,"SRN_GLM_DEMONESS.mds");
	EquipItem(self,ItMw_Avabul_Dagger);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_4570;
};

func void Rtn_Start_4570()
{
	TA_Stand_ArmsCrossed(7,0,23,0,"CP_AVABUL_01");
	TA_Stand_ArmsCrossed(23,0,7,0,"CP_AVABUL_01");
};

func void Rtn_TOT_4570()
{
	TA_Stand_ArmsCrossed(7,0,23,0,"TOT");
	TA_Stand_ArmsCrossed(23,0,7,0,"TOT");
};

instance VLK_5570_Avabul(Npc_Default)
{
	name[0] = "Авабюл, жрица Белиара";
	guild = GIL_DMT;
	id = 5570;
	voice = 16;
	level = 200;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
 	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 350;
	protection[PROT_FIRE] = 299;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 299;
	Mdl_SetVisual(self,"SRN_GLM.MDS");
	Mdl_SetVisualBody(self,"Demoness_bod",-1,-1,"Demoness_head",-1,0,-1);
	Mdl_ApplyOverlayMds(self,"SRN_GLM_DEMONESS.mds");
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_Gender] = FEMALE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	fight_tactic = FAI_HUMAN_MASTER;
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMw_Avabul_Dagger);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_5570;
};

func void Rtn_Start_5570()
{
	TA_Stand_Guarding(7,0,23,0,"ORM_AVABUL_01");
	TA_Stand_Guarding(23,0,7,0,"ORM_AVABUL_01");
};

instance DMT_4571_Jan(Npc_Default)
{
	name[0] = "Янус Двуликий";
	guild = GIL_DMT;
	id = 4571;
	voice = 18;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 350;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_Gender] = MALE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_DOOMSWORD_Elite);
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"Ske_Head",6,6,ITAR_WEMON_ADDON);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	daily_routine = rtn_start_4571;
};

func void rtn_start_4571()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"LOA_ORKGEBIET_TEMPEL_WP_40");
	TA_Stand_ArmsCrossed(23,0,8,0,"LOA_ORKGEBIET_TEMPEL_WP_40");
};

instance DMT_4572_Trazege(Npc_Default)
{
	name[0] = "Эгезарт";
	guild = GIL_DMT;
	id = 4572;
	voice = 19;
	flags = NPC_FLAG_IMMORTAL;
	aivar[94] = NPC_EPIC;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_4572;
};

func void Rtn_Start_4572()
{
	TA_Circle(8,0,23,0,"RITUAL_ROOM_08");
	TA_Circle(23,0,8,0,"RITUAL_ROOM_08");
};

instance KDW_4573_Oddler(Npc_Default)
{
	name[0] = "Оддлер";
	guild = GIL_KDW;
	id = 4573;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_Gender] = MALE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_UNICORN_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_UNICORN",DEFAULT,DEFAULT,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_4573;
};

func void Rtn_Start_4573()
{
	TA_Study_WP(8,0,10,0,"LOA_WUESTE_OFFROAD_36_01");
	TA_Saw(10,0,12,0,"LOA_WUESTE_OFFROAD_36_01_98");
	TA_Study_WP(12,0,14,0,"LOA_WUESTE_OFFROAD_36_01");
	TA_Sit_Campfire(14,0,16,0,"LOA_WUESTE_OFFROAD_36_01_99");
	TA_Saw(16,0,18,0,"LOA_WUESTE_OFFROAD_36_01_98");
	TA_Study_WP(18,0,20,0,"LOA_WUESTE_OFFROAD_36_01");
	TA_Sit_Campfire(20,0,8,0,"LOA_WUESTE_OFFROAD_36_01_99");
};
