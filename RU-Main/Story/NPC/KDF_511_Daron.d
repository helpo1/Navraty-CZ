
instance KDF_511_Daron(Npc_Default)
{
	name[0] = "Дарон";
	guild = GIL_KDF;
	id = 511;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	aivar[AIV_EnemyOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Mordrag,BodyTex_N,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_EnemyOverride] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMw_Stabkeule);
	daily_routine = Rtn_Start_511;
};


func void Rtn_Start_511()
{
	TA_Stand_Guarding(7,35,11,35,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Stand_Eating(11,35,12,5,"NW_CITY_MERCHANT_PATH_28_F");
	TA_Stand_Guarding(12,5,12,35,"MARKT");
	TA_Stand_Drinking(12,35,13,5,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Eating(13,5,13,25,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_Guarding(13,25,13,55,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_Guarding(13,55,18,5,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Stand_Drinking(18,5,19,5,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Guarding(19,5,20,5,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Sit_Throne(20,5,1,5,"NW_CITY_BED_ZURIS");
	TA_Sleep(1,5,7,35,"NW_CITY_BED_DARON");
};

func void rtn_orcatcbegan_511()
{
	TA_Stand_Guarding(6,55,20,30,"NW_MONASTERY_CHURCH_DARON");
	TA_Stand_Guarding(20,30,6,55,"NW_MONASTERY_CHURCH_DARON");
};

func void rtn_inbattle_511()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_12");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_12");
};

func void rtn_campon_511()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_11");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_11");
};

