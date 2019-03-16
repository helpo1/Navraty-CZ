
instance DJG_705_Angar(Npc_Default)
{
	name[0] = "Angar";
	guild = GIL_DJG;
	id = 705;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[93] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ANGAR_SCHWERT);
	CreateInvItems(self,ItPo_Health_03,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_CorAngar,BodyTex_B,ITAR_CorAngar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_preprestart_705;
};


func void rtn_preprestart_705()
{
	TA_Cook_Pan(8,0,10,0,"WP_COAST_HOUSE_04");
	TA_Stand_Eating(10,0,11,0,"WP_COAST_HOUSE_04");
	TA_Sit_Bench(11,0,16,0,"WP_COAST_HOUSE_03");
	TA_Cook_Pan(16,0,18,0,"WP_COAST_HOUSE_04");
	TA_Stand_Eating(18,0,19,0,"WP_COAST_HOUSE_04");
	TA_Sit_Bench(19,0,23,0,"WP_COAST_HOUSE_03");
	TA_Sleep(23,0,8,0,"WP_COAST_HOUSE_02");
};

func void Rtn_PreStart_705()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_TO_MAGE");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_TO_MAGE");
};

func void Rtn_Start_705()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_DJG_WATCH_STONEHENGE_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_DJG_WATCH_STONEHENGE_01");
};

func void Rtn_Tot_705()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

func void Rtn_Zwischenstop_705()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_PATH_3_13");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_PATH_3_13");
};

func void Rtn_GotoStonehendgeEntrance_705()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_PATH_3_STONES");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_PATH_3_STONES");
};

func void Rtn_LeavingOW_705()
{
	TA_Sit_Campfire(8,0,23,0,"OW_CAVALORN_01");
	TA_Sit_Campfire(23,0,8,0,"OW_CAVALORN_01");
};

func void Rtn_Angriff_705()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_UNDEAD_DUNGEON_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_UNDEAD_DUNGEON_02");
};

func void Rtn_RunToEntrance_705()
{
	TA_RunToWP(8,0,23,0,"OW_PATH_3_STONES");
	TA_RunToWP(23,0,8,0,"OW_PATH_3_STONES");
};



