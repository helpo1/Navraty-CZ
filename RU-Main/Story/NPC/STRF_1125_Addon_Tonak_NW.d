
instance STRF_1125_Addon_Tonak_NW(Npc_Default)
{
	name[0] = "Тонак";
	guild = GIL_OUT;
	id = 1125;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal01,BodyTex_B,ITAR_Bau_L_02);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1125;
};


func void Rtn_Start_1125()
{
	TA_Rake_FP(0,0,12,0,"NW_FARM2_FIELD_TANOK");
	TA_Rake_FP(12,0,0,0,"NW_FARM2_FIELD_TANOK");
};

func void rtn_hideincave_1125()
{
	TA_Stand_WP(8,0,22,0,"NW_FOREST_CAVE1_IN_05");
	TA_Stand_WP(22,0,8,0,"NW_FOREST_CAVE1_IN_05");
};