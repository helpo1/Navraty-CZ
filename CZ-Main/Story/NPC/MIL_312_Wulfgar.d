
instance MIL_312_Wulfgar(Npc_Default)
{
	name[0] = "Wulfgar";
	guild = GIL_MIL;
	id = 312;
	voice = 4;
	flags = 0;
	aivar[93] = TRUE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart06,BodyTex_N,ITAR_MIL_WULFGAR);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_312;
};


func void Rtn_PreStart_312()
{
	TA_Practice_Sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Stand_ArmsCrossed(6,55,19,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Smalltalk(19,0,21,0,"NW_CITY_HABOUR_KASERN_OFFICE");
	TA_Sit_Throne(21,0,5,0,"NW_CITY_KASERN_BARRACK02_02");

};

func void Rtn_Start_312()
{
	TA_Practice_Sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Stand_ArmsCrossed(6,55,19,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Smalltalk(19,0,21,0,"NW_CITY_HABOUR_KASERN_OFFICE");
	TA_Sit_Throne(21,0,5,0,"NW_CITY_KASERN_BARRACK02_02");
};

func void rtn_tot_312()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_campon_312()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_67");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_67");
};

func void rtn_inbattle_312()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8738");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8738");
};

