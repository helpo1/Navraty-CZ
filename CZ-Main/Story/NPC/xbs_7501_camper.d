
instance XBS_7501_CAMPER(Npc_Default)
{
	name[0] = "Isidro";
	guild = GIL_OUT;
	id = 7501;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_XBSMAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",179,BodyTex_N,itar_slp_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_7501;
};


func void rtn_start_7501()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"WP_COAST_WAY05");
	TA_Stand_ArmsCrossed(23,0,8,0,"WP_COAST_WAY05");
};

func void rtn_guidetocamp_7501()
{
	TA_Guide_Player(8,0,23,0,"WP_COAST_BASE_04");
	TA_Guide_Player(23,0,8,0,"WP_COAST_BASE_04");
};

func void rtn_stayincamp_7501()
{
	TA_Stand_Eating(6,50,7,30,"WP_COAST_BASE_23");
	TA_Sit_Chair(7,30,9,0,"WP_COAST_BASE_23");
	TA_Stand_ArmsCrossed(9,0,13,30,"WP_COAST_BASE_23");
	TA_Stand_Eating(13,30,14,0,"WP_COAST_BASE_23");
	TA_Stand_ArmsCrossed(14,0,17,20,"WP_COAST_BASE_23");
	TA_Sit_Campfire(17,20,22,0,"WP_COAST_BASE_20");
	TA_Sleep(22,0,6,50,"WP_COAST_BASE_15");
};

