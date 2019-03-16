
instance BDT_1062_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1062;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_NormalBart12,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = Rtn_Start_1062;
};


func void Rtn_Start_1062()
{
	TA_Sit_Campfire(0,0,12,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
	TA_Sit_Campfire(12,0,0,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
};

instance BDT_10620_Bandit_L(Npc_Default)
{
	name[0] = "Крикс 'Бритва', главарь бандитов";
	guild = GIL_BDT;
	id = 10620;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert4);
	EquipItem(self,ItRw_BDT_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_NormalBart12,BodyTex_N,ITAR_BDT_W);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	CreateInvItems(self,ItWr_DexterOrder,1);
	daily_routine = Rtn_Start_10620;
};

func void Rtn_Start_10620()
{
	TA_Sit_Campfire(0,0,12,0,"NW_FARM1_BANDITS_CAVE_07");
	TA_Sit_Campfire(12,0,0,0,"NW_FARM1_BANDITS_CAVE_07");
};

instance BDT_10621_Bandit_L(Npc_Default)
{
	name[0] = "Барт 'Коротышка', главарь бандитов";
	guild = GIL_BDT;
	id = 10621;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert3);
	EquipItem(self,ItRw_BDT_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_OldMan_Gravo,BodyTex_P,ITAR_BDT_W);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10621;
};

func void Rtn_Start_10621()
{
	TA_Sit_Campfire(0,0,12,0,"NW_FOREST_CAVE1_IN_04");
	TA_Sit_Campfire(12,0,0,0,"NW_FOREST_CAVE1_IN_04");
};

instance BDT_10622_Bandit_L(Npc_Default)
{
	name[0] = "Скирон 'Мясник', главарь бандитов";
	guild = GIL_BDT;
	id = 10622;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert2);
	EquipItem(self,ItRw_BDT_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal01,BodyTex_P,ITAR_BDT_W);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10622;
};

func void Rtn_Start_10622()
{
	TA_Sit_Campfire(0,0,12,0,"NW_FARM4_WOOD_RANGERBANDITS_03");
	TA_Sit_Campfire(12,0,0,0,"NW_FARM4_WOOD_RANGERBANDITS_03");
};

instance BDT_10623_Bandit_L(Npc_Default)
{
	name[0] = "Рокс 'Шустрый', главарь бандитов";
	guild = GIL_BDT;
	id = 10623;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert1);
	EquipItem(self,ItRw_BDT_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ToughBart01,BodyTex_N,ITAR_BDT_W);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10623;
};

func void Rtn_Start_10623()
{
	TA_Stand_Guarding(0,0,12,0,"NW_TROLLAREA_PATH_51_94");
	TA_Stand_Guarding(12,0,0,0,"NW_TROLLAREA_PATH_51_94");
};