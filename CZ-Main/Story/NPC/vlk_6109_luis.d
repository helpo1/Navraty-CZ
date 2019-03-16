
instance VLK_6109_LUIS(Npc_Default)
{
	name[0] = "Luis";
	guild = GIL_NONE;
	id = 6109;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal08,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6109;
};


func void rtn_start_6109()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_LUIS");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_LUIS_2");
};

func void rtn_TOT_6109()
{
	TA_Stand_WP(6,0,23,0,"TOT");
	TA_Stand_WP(23,0,6,0,"TOT");
};