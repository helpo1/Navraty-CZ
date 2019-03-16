
instance Pal_216_Cedric(Npc_Default)
{
	name[0] = "Седрик";
	guild = GIL_PAL;
	id = 216;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_REGENERATEMANA] = 150;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItAr_Shield_07_Cedrik);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,2);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = Rtn_Start_216;
};


func void Rtn_Start_216()
{
	TA_Stand_ArmsCrossed(7,0,19,0,"NW_CITY_TRAIN_01");
	TA_Sleep(19,0,7,0,"NW_CITY_LEOMAR_BED_03");
};

func void rtn_tot_216()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_campon_216()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_64");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_64");
};

func void rtn_gotocarl_216()
{
	TA_Practice_Sword(7,0,15,0,"NW_CITY_TRAIN_01");
	TA_Stand_Guarding(15,0,19,0,"NW_CITY_CARLWAIT_01");
	TA_Sleep(19,0,7,0,"NW_CITY_LEOMAR_BED_03");
};

func void rtn_inbattle_216()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8734");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8734");
};

