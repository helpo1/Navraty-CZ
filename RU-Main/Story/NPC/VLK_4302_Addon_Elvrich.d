
instance VLK_4302_Addon_Elvrich(Npc_Default)
{
	name[0] = "Элврих";
	guild = GIL_VLK;
	id = 4302;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_MM_RestStart] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_B_Normal01,BodyTex_B,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4302;
};


func void Rtn_Start_4302()
{
	TA_Sit_Campfire(8,0,23,0,"NW_BIGMILL_FARM3_RANGERBANDITS_ELVRICH");
	TA_Sit_Campfire(23,0,8,0,"NW_BIGMILL_FARM3_RANGERBANDITS_ELVRICH");
};

func void Rtn_BackInTheCity_4302()
{
	TA_Repair_Hut(7,0,9,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw(9,0,13,5,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Repair_Hut(13,5,14,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw(14,0,16,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Repair_Hut(16,0,17,5,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Repair_Hut(17,5,18,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Repair_Hut(18,0,19,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw(19,0,20,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Sit_Bench(20,0,7,0,"NW_CITY_MERCHANT_HUT_01_FRONT");
};

func void rtn_gomarry_4302()
{
	TA_Smalltalk(8,0,18,0,"NW_CITY_GRITTA_GOMARRY_02");
	TA_Smalltalk(18,0,8,0,"NW_CITY_GRITTA_GOMARRY_02");
};

