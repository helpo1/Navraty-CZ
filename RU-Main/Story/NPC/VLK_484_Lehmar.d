
instance VLK_484_Lehmar(Npc_Default)
{
	name[0] = "Лемар";
	guild = GIL_VLK;
	id = 484;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Whistler,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_484;
};


func void Rtn_Start_484()
{
	TA_Sit_Throne(6,30,12,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Study_WP(12,30,16,30,"NW_CITY_HABOUR_HUT_08_IN_98");
	TA_Sit_Throne(16,30,21,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Sleep(21,30,6,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};

func void rtn_CanKill_484()
{
	TA_Sit_Throne(6,30,12,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Study_WP(12,30,16,30,"NW_CITY_HABOUR_HUT_08_IN_98");
	TA_Sit_Throne(16,30,20,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Sit_Bench(20,30,0,30,"NW_CITY_LEMAR_KILL");
	TA_Sleep(0,30,6,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};

func void rtn_TOT_484()
{
	TA_Stand_WP(6,0,23,0,"TOT");
	TA_Stand_WP(23,0,6,0,"TOT");
};