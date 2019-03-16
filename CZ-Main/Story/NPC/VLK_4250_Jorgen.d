
instance VLK_4250_Jorgen(Npc_Default)
{
	name[0] = "Jorgen";
	guild = GIL_NONE;
	id = 4250;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Tough_Skip,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_4250;
};


func void Rtn_Start_4250()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_MONASTERY_BRIDGE_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_MONASTERY_BRIDGE_01");
};

func void Rtn_Kloster_4250()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_MONASTERY_PLACE_06");
	TA_Sleep(20,0,8,0,"NW_MONASTERY_NOVICE04_06");
};

func void Rtn_RausAusKloster_4250()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_BIGFARM_KITCHEN_OUT_06");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_BIGFARM_KITCHEN_OUT_06");
};

func void Rtn_WaitForShipCaptain_4250()
{
	TA_Sit_Bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	TA_Sit_Bench(20,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void Rtn_AllOnBoard_4250()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_tot_4250()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_4250()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_CREW_06");
	TA_Stand_Guarding(22,0,8,0,"SHIP_CREW_06");
};

func void rtn_killhim_4250()
{
	TA_Stand_WP(8,0,20,0,"NW_CITY_WAY_TO_SHIP_06");
	TA_Stand_WP(20,0,8,0,"NW_CITY_WAY_TO_SHIP_06");
};

