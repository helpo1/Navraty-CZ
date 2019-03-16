
instance BDT_1060_Dexter(Npc_Default)
{
	name[0] = "Декстер, главарь бандитов";
	guild = GIL_BDT;
	id = 1060;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert4);
	B_CreateAmbientInv(self);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	CreateInvItems(self,ItKe_Dexter,1);
	CreateInvItems(self,ItWr_RavensKidnapperMission_Addon,1);
	CreateInvItems(self,ItMi_Opal,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dexter,BodyTex_N,ITAR_BDT_V_DEX);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1060;
};


func void Rtn_Start_1060()
{
	TA_Study_WP(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	TA_Study_WP(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

func void Rtn_TOT_1060()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};
//-------------------лагерь Нестора-------------------------------------

instance BDT_1460_Nestor(Npc_Default)
{
	name[0] = "Нестор 'Ганибал', главарь разбойников";
	guild = GIL_BDT;
	id = 1460;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Rubinklinge);
	B_CreateAmbientInv(self);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	CreateInvItems(self,ItKe_HanibalKey,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Silas,BodyTex_N,ITAR_BDT_V);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1460;
};

func void Rtn_Start_1460()
{
	TA_Study_WP(0,0,12,0,"X_SOUTHBEACH_BAN_HANIBAL");
	TA_Study_WP(12,0,0,0,"X_SOUTHBEACH_BAN_HANIBAL");
};

func void Rtn_TOT_1460()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1461_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1461;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Schwert2);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Homer,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_1461;
};

func void Rtn_Start_1461()
{
	TA_Stand_Guarding(0,0,12,0,"X_SOUTHBEACH_BAN_07");
	TA_Stand_Guarding(12,0,0,0,"X_SOUTHBEACH_BAN_07");
};

func void Rtn_TOT_1461()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance Bdt_1462_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1462;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Homer,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = RTN_Start_1462;
};

func void RTN_Start_1462()
{
	TA_Stand_Eating(0,0,12,0,"X_SOUTHBEACH_BAN_06");
	TA_Stand_Eating(12,0,0,0,"X_SOUTHBEACH_BAN_06");
};

func void Rtn_TOT_1462()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1463_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1463;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_NormalBart01,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1463;
};

func void Rtn_Start_1463()
{
	TA_Sit_Campfire(2,0,10,0,"X_SOUTHBEACH_BAN_06_01");
	TA_Sit_Campfire(10,0,2,0,"X_SOUTHBEACH_BAN_06_01");
};

func void Rtn_TOT_1463()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1464_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1464;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Schwert4);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal03,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1464;
};

func void Rtn_Start_1464()
{
	TA_Sit_Campfire(2,0,10,0,"X_SOUTHBEACH_BAN_06_02");
	TA_Sit_Campfire(10,0,2,0,"X_SOUTHBEACH_BAN_06_02");
};

func void Rtn_TOT_1464()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1465_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1465;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Schwert3);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Bartholo,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1465;
};

func void Rtn_Start_1465()
{
	TA_Smalltalk(8,0,23,0,"X_SOUTHBEACH_BAN_04_01");
	TA_Smalltalk(23,0,8,0,"X_SOUTHBEACH_BAN_04_01");
};

func void Rtn_TOT_1465()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1466_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1466;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	attribute[ATR_REGENERATEMANA] = 1;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough02,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = Rtn_Start_1466;
};

func void Rtn_Start_1466()
{
	TA_Smalltalk(8,0,23,0,"X_SOUTHBEACH_BAN_04_02");
	TA_Smalltalk(23,0,8,0,"X_SOUTHBEACH_BAN_04_02");
};

func void Rtn_TOT_1466()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1467_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1467;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_P_NormalBart01,BodyTex_P,itar_bdt_f);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1467;
};

func void Rtn_Start_1467()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"X_SOUTHBEACH_BAN_01_01");
	TA_Stand_ArmsCrossed(12,0,0,0,"X_SOUTHBEACH_BAN_01_01");
};

func void Rtn_TOT_1467()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};

instance BDT_1468_Bandit_Nestor(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1468;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert3);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal01,BodyTex_B,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1468;
};

func void Rtn_Start_1468()
{
	TA_Stand_Guarding(0,0,12,0,"X_SOUTHBEACH_BAN_01_02");
	TA_Stand_Guarding(12,0,0,0,"X_SOUTHBEACH_BAN_01_02");
};

func void Rtn_TOT_1468()
{
	TA_Stand_WP(0,0,12,0,"TOT");
	TA_Stand_WP(12,0,0,0,"TOT");
};