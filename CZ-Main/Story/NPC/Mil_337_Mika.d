
instance Mil_337_Mika(Npc_Default)
{
	name[0] = "Mika";
	guild = GIL_OUT;
	id = 337;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	CreateInvItems(self,ItPo_Health_01,8);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_L_ToughBart_Quentin,BodyTex_L,ITAR_MIL_M_V1);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_337;
};

func void Rtn_Start_337()
{
	TA_Stand_Guarding(8,0,12,0,"NW_CITY_TO_FOREST_01");
	TA_Sit_Bench(12,0,16,0,"NW_CITY_ENTRANCE_BACK");
	TA_Stand_Guarding(16,0,20,0,"NW_CITY_TO_FOREST_01");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_ENTRANCE_BACK");
};

func void Rtn_Akil_337()
{
	TA_RunToWP(6,0,18,0,"NW_FARM2_PATH_03");
	TA_RunToWP(18,0,6,0,"NW_FARM2_PATH_03");
};

func void rtn_follow_337()
{
	TA_Follow_Player(5,0,20,0,"NW_CITY_SMFOREST_03_M");
	TA_Follow_Player(20,0,5,0,"NW_CITY_SMFOREST_03_M");
};

