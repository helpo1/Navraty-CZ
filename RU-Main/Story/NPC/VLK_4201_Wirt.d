
instance VLK_4201_Wirt(Npc_Default)
{
	name[0] = "Вирт";
	guild = GIL_VLK;
	id = 4201;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_4201;
};


func void Rtn_Start_4201()
{
	TA_Stand_Guarding(4,35,21,0,"NW_CITY_BEER_02");
	TA_Pee(21,0,21,5,"NW_CITY_KASERN_PLACE_01");
	TA_Stand_Drinking(21,5,4,30,"NW_CITY_BEER_02");
	TA_Pee(4,30,4,35,"NW_CITY_KASERN_PLACE_01");
};

func void Rtn_MilGuard_4201()
{
	TA_Stand_Guarding(8,0,14,0,"NW_CITY_HABOUR_KASERN_WIRT");
	TA_Sit_Bench(14,0,20,0,"NW_CITY_SCATTY");
	TA_Sleep(20,0,8,0,"NW_CITY_BARRACK01_03");
};
