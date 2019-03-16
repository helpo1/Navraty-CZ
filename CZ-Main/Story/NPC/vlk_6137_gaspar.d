
instance VLK_6137_GASPAR(Npc_Default)
{
	name[0] = "Gaspar";
	guild = GIL_VLK;
	id = 6137;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough_Santino,BodyTex_L,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6137;
};


func void rtn_start_6137()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_HANNA");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_HANNA");
};

func void rtn_inprision_6137()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_HANNA_INPRISION");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_HANNA_INPRISION");
};

