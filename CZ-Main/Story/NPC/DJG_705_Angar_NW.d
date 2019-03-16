
instance DJG_705_Angar_NW(Npc_Default)
{
	name[0] = "Angar";
	guild = GIL_DJG;
	id = 7050;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[93] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ANGAR_SCHWERT);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_CorAngar,BodyTex_B,ITAR_CorAngar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_7050;
};


func void Rtn_Start_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_PSICAMP_ANGAR");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_PSICAMP_ANGAR");
};

func void Rtn_WaitForShip_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_WAITFOR_SHIP_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_WAITFOR_SHIP_03");
};

func void Rtn_Ship_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_CREW_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"SHIP_CREW_03");
};

func void rtn_psicamp_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_PSICAMP_ANGAR");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_PSICAMP_ANGAR");
};

func void rtn_tot_7050()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_7050()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_09");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_09");
};

func void rtn_capturethrbattle_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITY_HABOUR_KASERN_NAGUR");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITY_HABOUR_KASERN_NAGUR");
};

func void rtn_campon_7050()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_SOVET_ANGAR");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_ANGAR");
};

func void rtn_inbattle_7050()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_ANGAR");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_ANGAR");
};

func void rtn_fleefrombattle_7050()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_follow_7050()
{
	TA_Follow_Player(5,0,20,0,"BIGFARM");
	TA_Follow_Player(20,0,5,0,"BIGFARM");
};

