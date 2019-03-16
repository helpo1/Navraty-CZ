
instance VLK_435_Nadja(Npc_Default)
{
	name[0] = "Nadja";
	guild = GIL_VLK;
	id = 435;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_MM_RestStart] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"AML.MDS");
	Mdl_SetVisualBody(self,"AML_Body_Naked0",2,0,"Bab_Head_Hair1",4,DEFAULT,-1);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_Gender] = FEMALE;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_435;
};

func void Rtn_Start_435()
{
	TA_Smoke_Joint(5,0,10,0,"NW_PUFF_DANCE_RELAX");
	TA_Sit_Throne(10,0,17,0,"NW_CITY_PUFF_THRONE");
	ta_charlotte_dance(17,0,21,0,"NW_PUFF_DANCE");
	TA_Sit_Throne(21,0,23,0,"NW_CITY_PUFF_THRONE");
	ta_charlotte_dance(23,0,5,0,"NW_PUFF_DANCE");
};

func void Rtn_Dance_435()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_HABOUR_PUFF_NADJA");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_CITY_HABOUR_PUFF_NADJA");
};

func void Rtn_Smoke_435()
{
	TA_Smoke_Joint(5,0,10,0,"NW_PUFF_DANCE_RELAX");
	TA_Sit_Throne(10,0,17,0,"NW_CITY_PUFF_THRONE");
	ta_charlotte_dance(17,0,21,0,"NW_PUFF_DANCE");
	TA_Sit_Throne(21,0,23,0,"NW_CITY_PUFF_THRONE");
	ta_charlotte_dance(23,0,5,0,"NW_PUFF_DANCE");
};

func void Rtn_Tot_435()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};

instance VLK_4350_Priscila(Npc_Default)
{
	name[0] = "Ayri";
	guild = GIL_VLK;
	id = 435;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_MM_RestStart] = TRUE;
	B_CreateAmbientInv(self);
	B_SetAttributesToChapter(self,7);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",Face_N_Normal_Spassvogel,BodyTexBabe_F,ItAr_Priscilla);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	aivar[AIV_Gender] = FEMALE;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_4350;
};

func void Rtn_Start_4350()
{
	TA_Stand_Eating(10,0,13,0,"NW_CITY_TAVERN_IN_04");
	TA_Sit_Bench(13,0,17,0,"NW_PRISCILA");
	TA_Play_Lute(17,0,21,0,"NW_PUFF_DANCE_RELAX");
	TA_Sit_Bench(21,0,21,15,"NW_PRISCILA");
	TA_Play_Lute(21,15,23,0,"NW_PUFF_DANCE");
	TA_Sleep(23,0,10,0,"NW_CITY_HOTEL_BED_07");
};

func void Rtn_Tot_4350()
{
	TA_Stand_Guarding(0,0,12,0,"TOT");
	TA_Stand_Guarding(12,0,0,0,"TOT");
};