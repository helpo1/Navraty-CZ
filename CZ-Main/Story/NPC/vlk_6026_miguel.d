
instance VLK_6026_MIGUEL(Npc_Default)
{
	name[0] = "Miguel";
	guild = GIL_VLK;
	id = 6026;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Nagelknueppel);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_OldMan_Gravo,BodyTex_P,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_6026;
};


func void rtn_start_6026()
{
	TA_Stand_Drinking(5,30,8,0,"NW_CITY_BEER_04");
	TA_Stand_Eating(8,0,10,0,"NW_CITY_MERCHANT_TRADE_04");
	TA_Potion_Alchemy(10,0,12,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Stand_Drinking(12,0,17,0,"NW_CITY_BEER_04");
	TA_Read_Bookstand(17,0,18,20,"NW_CITY_BOOK_VELAX");
	TA_Stand_Drinking(18,20,22,20,"NW_CITY_BEER_04");
	TA_Sit_Chair(20,20,5,30,"NW_CITY_TAVERN_IN_08");
};

