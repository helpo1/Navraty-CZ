
instance VLK_444_Jack(Npc_Default)
{
	name[0] = "Jack";
	guild = GIL_VLK;
	id = 444;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_444;
};

func void Rtn_Start_444()
{
	TA_Sit_Bench(8,0,20,0,"NW_CITY_HABOUR_06_C");
	TA_Sleep(20,0,8,0,"NW_CITY_HABOUR_POOR_AREA_HUT_07_01_JACK");
};

func void Rtn_Lighthouse_444()
{
	TA_Stand_Guarding(8,0,20,0,"NW_LIGHTHOUSE_IN_16");
	TA_Sit_Chair(20,0,8,0,"NW_LIGHTHOUSE_IN_02");
};

func void Rtn_LighthouseSmoke_444()
{
	TA_Smoke_Pipe(8,0,20,0,"NW_LIGHTHOUSE_IN_16");
	TA_Sit_Chair(20,0,8,0,"NW_LIGHTHOUSE_IN_02");
};

func void Rtn_WaitForShipCaptain_444()
{
	TA_Sit_Bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	TA_Sit_Bench(0,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void Rtn_AllOnBoard_444()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_tot_444()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_444()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_CREW_06");
	TA_Stand_Guarding(22,0,8,0,"SHIP_CREW_06");
};

func void rtn_rausauskloster_444()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_BIGFARM_KITCHEN_OUT_06");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_BIGFARM_KITCHEN_OUT_06");
};

func void rtn_killhim_444()
{
	TA_Stand_WP(8,0,20,0,"NW_CITY_HABOUR_06_C");
	TA_Stand_WP(20,0,8,0,"NW_CITY_HABOUR_06_C");
};

func void Rtn_MeetLH_444()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_JACK_LH_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_JACK_LH_01");
};

func void Rtn_FollowLH_444()
{
	TA_Follow_Player(8,0,20,0,"NW_JACK_LH_01");
	TA_Follow_Player(20,0,8,0,"NW_JACK_LH_01");
};

func void Rtn_JackTalk_444()
{
	TA_Smalltalk(8,0,22,0,"NW_SOUL_LH_02");
	TA_Smalltalk(22,0,8,0,"NW_SOUL_LH_02");
};

func void Rtn_JackFight_444()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_SOUL_LH_01");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_SOUL_LH_01");
};