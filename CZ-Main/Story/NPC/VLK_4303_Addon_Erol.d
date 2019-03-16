
instance VLK_4303_Addon_Erol(Npc_Default)
{
	name[0] = "Erol";
	guild = GIL_BAU;
	id = 4303;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	CreateInvItems(self,ItPo_Health_01,3);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Corristo,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_PreStart_4303;
};


func void Rtn_PreStart_4303()
{
	TA_Sit_Bench(8,0,22,0,"NW_TAVERNE_05_SITBEN");
	TA_Sit_Bench(22,0,8,0,"NW_TAVERNE_05_SITBEN");
};

func void Rtn_Start_4303()
{
	TA_RangerMeeting(8,0,22,0,"NW_BIGFARM_HUT_02");
	TA_RangerMeeting(22,0,8,0,"NW_BIGFARM_HUT_02");
};

func void Rtn_Home_4303()
{
	TA_Sit_Chair(8,0,22,0,"NW_BIGFARM_HUT_IN_01");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HUTINSIDE_BED");
};

func void rtn_towerceo_4303()
{
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CASTLEMINE_HUT_01");
	TA_Repair_Hut(10,0,12,0,"NW_CASTLEMINE_TOWER_REP_HUT");
	TA_Stand_Eating(12,0,14,0,"NW_CASTLEMINE_HUT_03_NIK");
	TA_Read_Bookstand(14,0,20,0,"NW_CASTLEMINE_HUT_03_READBOOK");
	TA_Stand_ArmsCrossed(20,0,23,0,"NW_CASTLEMINE_HUT_01");
	TA_Sleep(22,0,8,0,"NW_CASTLEMINE_TOWER_08");
};