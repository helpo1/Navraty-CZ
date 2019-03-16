
instance VLK_417_Constantino(Npc_Default)
{
	name[0] = "Константино";
	guild = GIL_VLK;
	id = 417;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic.",Face_N_OldBald_Jeremiah,BodyTex_N,itar_alchemy);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_417;
};


func void Rtn_Start_417()
{
	TA_Potion_Alchemy(8,0,13,0,"NW_CITY_ALCHEMY_VELAX");
	TA_Stand_Drinking(13,0,14,0,"NW_CITY_TAVERN_IN_04");
	TA_Sleep(14,0,16,0,"NW_CITY_BED_VELAX");
	TA_Potion_Alchemy(16,0,22,0,"NW_CITY_ALCHEMY_VELAX");
	TA_Sleep(22,0,8,0,"NW_CITY_BED_VELAX");
};

func void rtn_inprision_417()
{
	TA_Stand_WP(8,0,22,0,"NW_CITY_ALHIMIK_INPRISION");
	TA_Stand_WP(22,0,8,0,"NW_CITY_ALHIMIK_INPRISION");
};

