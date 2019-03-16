
instance VLK_470_Sarah(Npc_Default)
{
	name[0] = "Сара";
	guild = GIL_VLK;
	id = 470;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_Blondie,BodyTexBabe_N,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_470;
};


func void Rtn_Start_470()
{
	TA_Stand_ArmsCrossed(5,15,20,15,"NW_CITY_SARAH");
	TA_Sleep(20,15,5,15,"NW_CITY_HOTEL_BED_08");
};

func void Rtn_Knast_470()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void Rtn_Tot_470()
{
	TA_Stand_ArmsCrossed(5,15,20,15,"TOT");
	TA_Sleep(20,15,5,15,"TOT");
};

func void rtn_intavern_470()
{
	TA_Sit_Bench(8,0,20,0,"NW_TAVERNE_IN_10");
	TA_Sit_Bench(20,0,8,0,"NW_TAVERNE_IN_10");
};

func void rtn_killed_470()
{
	TA_Stand_WP(8,0,20,0,"NW_SARA_KILLED");
	TA_Stand_WP(20,0,8,0,"NW_SARA_KILLED");
};

func void rtn_trade_470()
{
	TA_Stand_ArmsCrossed(5,15,20,15,"NW_CITY_UPTOWN_PATH_SARAH_02");
	TA_Sleep(20,15,5,15,"NW_CITY_HOTEL_BED_08");
};

