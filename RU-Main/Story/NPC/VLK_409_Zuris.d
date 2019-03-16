
instance VLK_409_Zuris(Npc_Default)
{
	name[0] = "Зурис";
	guild = GIL_VLK;
	id = 409;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_ImportantGrey,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_409;
};


func void Rtn_Start_409()
{
	TA_Stand_TraderCity(7,30,19,30,"NW_CITY_BALTRAM");
	TA_Sit_Throne(19,30,0,30,"NW_CITY_CHAIR_ZURIS");
	TA_Sleep(0,30,7,30,"NW_CITY_BED_ZURIS");
};

