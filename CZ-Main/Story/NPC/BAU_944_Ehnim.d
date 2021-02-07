/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

ItMi_Moleratlubric_MIS - vytvoření předmětu přesunuto ze 3. do 1. kapitoly

*/



instance BAU_944_Ehnim(Npc_Default)
{
	name[0] = "Ehnim";
	guild = GIL_BAU;
	id = 944;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,1);
	CreateInvItems(self,ItMi_Moleratlubric_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal03,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_944;
};


func void Rtn_Start_944()
{
	TA_Rake_FP(5,0,12,0,"NW_FARM2_FIELD_03");
	TA_Sit_Campfire(12,0,14,0,"NW_FARM2_FIELD_03_B");
	TA_Rake_FP(14,0,21,0,"NW_FARM2_FIELD_03");
	TA_Sit_Campfire(21,0,5,0,"NW_FARM2_OUT_03");
};

func void rtn_hideincave_944()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FOREST_CAVE1_IN_04_B98");
	TA_Stand_Guarding(22,0,8,0,"NW_FOREST_CAVE1_IN_04_B98");
};

