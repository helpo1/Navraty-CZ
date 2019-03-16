
instance BAU_987_SNIPES(Npc_Default)
{
	name[0] = "Snipes";
	guild = GIL_BAU;
	id = 987;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",104,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_987;
};

func void rtn_start_987()
{
	TA_Rake_FP(8,0,12,0,"NW_FARM1_FIELD_05");
	TA_Rake_FP(12,0,15,0,"NW_FARM1_FIELD_04");
	TA_Rake_FP(15,0,18,0,"NW_FARM1_FIELD_05");
	TA_Rake_FP(18,0,22,0,"NW_FARM1_FIELD_04");
	TA_Sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

func void Rtn_BugsThere_987()
{
	TA_Stand_Drinking(8,0,22,0,"NW_FARM1_OUT_01");
	TA_Sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

func void rtn_getnuggets_987()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_IN_06");
	TA_Stand_Eating(22,0,8,0,"NW_TAVERNE_IN_06");
};

func void rtn_intower_987()
{
	TA_Stand_Eating(8,0,10,0,"NW_CASTLEMINE_HUT_03");
	TA_Sit_Campfire(10,0,12,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
	TA_Pick_Ore(12,0,16,0,"NW_CASTLEMINE_04_IRON");
	TA_Repair_Hut(16,0,20,0,"NW_CASTLEMINE_TOWER_REP_HUT");
	TA_Sit_Campfire(20,0,8,0,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
};
