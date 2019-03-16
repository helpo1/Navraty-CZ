
instance VLK_471_Edda(Npc_Default)
{
	name[0] = "Edda";
	guild = GIL_VLK;
	id = 471;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	aivar[AIV_Gender] = FEMALE;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",7,0,"SRN_HEAD_HAIR4",3,0,ITAR_VlkBabe_M_New); //prototip Chani
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_471;
};


func void Rtn_Start_471()
{
	TA_Cook_Cauldron(8,0,13,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Sit_Bench(13,0,15,0,"NW_CITY_HABOUR_BENCH_01");
	TA_Cook_Cauldron(15,0,20,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Sit_Bench(20,0,22,0,"NW_CITY_HABOUR_BENCH_01");
	TA_Sleep(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_HUT_06_BED_02");
};

func void rtn_friend_471()
{
	TA_Cook_Cauldron(8,0,13,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Sit_Bench(13,0,15,0,"NW_CITY_HABOUR_BENCH_01");
	TA_Cook_Cauldron(15,0,20,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Sit_Bench(20,0,22,0,"NW_CITY_HABOUR_BENCH_01");
	TA_Sleep(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_HUT_06_BED_02");
};

func void rtn_InTower_471()
{
	TA_Cook_Cauldron(8,0,10,0,"NW_CASTLEMINE_HUT_03_EDDA");
	TA_Cook_Stove(10,0,13,0,"NW_CASTLEMINE_HUT_03_EDDA_01");
	TA_Stand_Sweeping(13,0,15,0,"NW_CASTLEMINE_HUT_10_B");
	TA_Cook_Cauldron(15,0,17,0,"NW_CASTLEMINE_HUT_03_EDDA");
	TA_Cook_Stove(17,0,20,0,"NW_CASTLEMINE_HUT_03_EDDA_01");
	TA_Sit_Throne(20,0,8,0,"NW_CASTLEMINE_HUT_10");
};