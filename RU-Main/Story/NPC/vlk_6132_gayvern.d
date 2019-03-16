
instance VLK_6132_GAYVERN(Npc_Default)
{
	name[0] = "Гэйверн";
	guild = GIL_VLK;
	id = 6132;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	aivar[AIV_MM_RestStart] = TRUE;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Silas,BodyTex_B,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_6132;
};


func void rtn_start_6132()
{
	TA_Stand_Guarding(8,0,13,0,"NW_LUTEROHELPER_01");
	TA_Stand_Drinking(13,0,16,0,"NW_LUTEROHELPER_01");
	TA_Play_Lute(16,0,19,0,"NW_LUTEROHELPER_01");
	TA_Stand_Guarding(19,0,22,0,"NW_LUTEROHELPER_01");
	TA_Smoke_Joint(22,0,3,0,"NW_GREYVERN_01");
	TA_Sit_Bench(3,0,8,0,"NW_GREYVERN_02");
};

func void rtn_follow_6132()
{
	TA_Follow_Player(8,0,22,0,"NW_CITY_LUTERO");
	TA_Follow_Player(22,0,8,0,"NW_CITY_LUTERO");
};

func void rtn_backtodrink_6132()
{
	TA_Stand_Guarding(8,0,13,0,"NW_LUTEROHELPER_01");
	TA_Stand_Drinking(13,0,16,0,"NW_LUTEROHELPER_01");
	TA_Play_Lute(16,0,19,0,"NW_LUTEROHELPER_01");
	TA_Stand_Guarding(19,0,22,0,"NW_LUTEROHELPER_01");
	TA_Smoke_Joint(22,0,3,0,"NW_GREYVERN_01");
	TA_Sit_Bench(3,0,8,0,"NW_GREYVERN_02");
};

func void rtn_intower_6132()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CASTLEMINE_03");
	TA_Smoke_Joint(20,0,8,0,"NW_CASTLEMINE_TOWER_NAVIGATION");
};