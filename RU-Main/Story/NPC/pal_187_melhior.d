
instance PAL_187_MELHIOR(Npc_Default)
{
	name[0] = "Мельхиор";
	guild = GIL_NONE;
	id = 187;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal20,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_187;
};


func void rtn_start_187()
{
	TA_Stand_Drinking(8,0,23,0,"NW_CITY_HABOUR_MELHIOR");
	TA_Stand_Drinking(23,0,8,0,"NW_CITY_HABOUR_MELHIOR");
};

func void rtn_gotcha_187()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_HABOUR_KASERN_MELHIOR");
	TA_Stand_WP(23,0,8,0,"NW_CITY_HABOUR_KASERN_MELHIOR");
};

func void rtn_TOT_187()
{
	TA_Stand_WP(8,0,23,0,"TOT");
	TA_Stand_WP(23,0,8,0,"TOT");
};