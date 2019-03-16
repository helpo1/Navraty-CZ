
instance VLK_4301_Addon_Farim(Npc_Default)
{
	name[0] = "Фарим";
	guild = GIL_VLK;
	id = 4301;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_NORMAL;
	CreateInvItems(self,ItMi_Aquamarine,1);
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart08,BodyTex_N,ITAR_POOR);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4301;
};


func void Rtn_Start_4301()
{
	TA_Wash_FP(7,0,8,0,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Repair_Hut(8,0,12,0,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	TA_Stand_Guarding(12,0,16,0,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Repair_Hut(16,0,20,0,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	TA_Stand_Guarding(20,0,22,0,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Sleep(22,0,7,0,"NW_CITY_WAY_TO_SHIP_FISCHER_04");
};

func void rtn_intower_4301()
{
	TA_Stand_Guarding(6,0,10,0,"TOT");
	TA_Stand_Eating(10,0,12,0,"NW_CASTLEMINE_HUT_03_NIK");
	TA_Sit_Campfire(12,0,18,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
	TA_Stand_Guarding(18,0,21,0,"TOT");
	TA_Stand_Eating(21,0,23,0,"NW_CASTLEMINE_HUT_03_NIK");
	TA_Sit_Bench(23,0,6,0,"NW_CASTLEMINE_TOWER_REP_HUT");
};

instance VLK_4991_Fisher(Npc_Default)
{
	name[0] = NAME_Fisher;
	guild = GIL_VLK;
	id = 4991;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Senyan,BodyTex_N,ITAR_POOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	CreateInvItems(self,ItFo_Fish,2);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_4991;
};

func void Rtn_Start_4991()
{
	TA_Repair_Hut(8,0,22,0,"NW_CITY_HABOUR_SAILOR_04");
	TA_Sit_Campfire(22,0,8,0,"NW_CITY_SAILORWAY_05");
};

instance VLK_4992_Fisher(Npc_Default)
{
	name[0] = NAME_Fisher;
	guild = GIL_VLK;
	id = 4992;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ITAR_POOR);
	Mdl_SetModelFatness(self,0);
	CreateInvItems(self,ItMi_Addon_Shell_02,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_4992;
};

func void Rtn_Start_4992()
{
	TA_Pick_FP(7,00,21,0,"NW_CITY_WAY_TO_SHIP_04_TEMP_04");
	TA_Sit_Campfire(21,0,7,0,"NW_CITY_SAILORWAY_06");
};

instance VLK_4993_Fisher(Npc_Default)
{
	name[0] = NAME_Fisher;
	guild = GIL_VLK;
	id = 4993;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItFo_Fish,1);
	EquipItem(self,ItMw_1h_Bau_Mace);
	CreateInvItems(self,ItMi_Addon_Shell_01,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_POOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_4993;
};

func void Rtn_Start_4993()
{
	TA_Stand_ArmsCrossed(9,0,20,0,"NW_CITY_WAY_TO_SHIP_04_TEMP_07");
	TA_Stand_Eating(20,0,9,0,"NW_CITY_SAILORWAY_03");
};