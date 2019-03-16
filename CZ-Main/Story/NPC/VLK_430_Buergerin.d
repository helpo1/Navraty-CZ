
instance VLK_430_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 430;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_Lilo,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_430;
};


func void Rtn_Start_430()
{
	TA_Smalltalk(5,7,22,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Smalltalk(22,7,0,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Sit_Bench(0,7,5,7,"NW_CITY_HABOUR_BENCH_01");
};

