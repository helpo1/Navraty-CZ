
instance BAU_942_Randolph(Npc_Default)
{
	name[0] = "Рэндольф";
	guild = GIL_BAU;
	id = 942;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Kharim,BodyTex_B,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_preStart_942;
};


func void Rtn_preStart_942()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM2_FIELD_04_B");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM2_FIELD_04_B");
};

func void Rtn_Start_942()
{
	TA_Pick_FP(5,0,21,0,"NW_FARM2_FIELD_04");
	TA_Stand_Eating(21,0,5,0,"NW_FARM2_OUT_07");
};

func void Rtn_Wettkampf_942()
{
	TA_Stand_Drinking(8,0,22,0,"NW_TAVERNE_RUKHAR");
	TA_Stand_Drinking(22,0,8,0,"NW_TAVERNE_RUKHAR");
};

func void rtn_hideincave_942()
{
	TA_Sit_Campfire(8,0,22,0,"NW_FOREST_CAVE1_IN_04");
	TA_Sit_Campfire(22,0,8,0,"NW_FOREST_CAVE1_IN_04");
};

