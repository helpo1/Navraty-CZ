
instance BAU_911_Elena(Npc_Default)
{
	name[0] = "Elena";
	guild = GIL_BAU;
	id = 911;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_GreyCloth,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_911;
};

func void Rtn_Start_911()
{
	TA_Stand_ArmsCrossed(7,30,13,30,"NW_BIGFARM_STABLE_OUT_04");
	TA_Smoke_Joint(13,30,22,0,"NW_BIGFARM_CAMPON_58");
	TA_Sit_Throne(22,0,7,30,"NW_BIGFARM_HOUSE_UP1_SESSEL");
};

func void rtn_StartPass_911()
{
	TA_Sit_Throne(8,0,11,45,"NW_BIGFARM_HOUSE_UP1_SESSEL");
	TA_Pick_FP(11,45,13,0,"NW_CRYPT_03");
	TA_Pick_FP(13,0,13,30,"NW_CRYPT_05");
	TA_Pick_FP(13,30,14,0,"NW_CRYPT_02");
	TA_Sit_Throne(14,0,22,0,"NW_BIGFARM_HOUSE_UP1_SESSEL");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP1_04");
};

func void rtn_comedeath_911()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

