
instance STRF_1126_Addon_Telbor_NW(Npc_Default)
{
	name[0] = "Telbor";
	guild = GIL_BAU;
	id = 1126;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal01,BodyTex_B,ITAR_Bau_L_02);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1126;
};


func void Rtn_Start_1126()
{
	TA_Rake_FP(0,0,12,0,"NW_FARM2_FIELD_TELBOR");
	TA_Rake_FP(12,0,0,0,"NW_FARM2_FIELD_TELBOR");
};

func void rtn_hideincave_1126()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FOREST_CAVE1_IN_05");
	TA_Stand_Guarding(22,0,8,0,"NW_FOREST_CAVE1_IN_05");
};