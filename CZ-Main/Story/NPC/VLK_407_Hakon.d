
instance VLK_407_Hakon(Npc_Default)
{
	name[0] = "Hakon";
	guild = GIL_VLK;
	id = 407;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart20,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_407;
};


func void Rtn_Start_407()
{
	TA_Stand_TraderCity(6,0,20,0,"NW_CITY_HAKON");
	TA_Sleep(20,0,6,0,"NW_CITY_HOTEL_BED_04");
};

