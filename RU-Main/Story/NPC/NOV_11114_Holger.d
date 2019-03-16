
instance NOV_11114_HOLGER(Npc_Default)
{
	name[0] = "Хольгер";
	guild = GIL_NOV;
	id = 11114;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	aivar[AIV_MM_RestStart] = TRUE;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	attribute[ATR_HITPOINTS] = 400;
	daily_routine = rtn_start_11114;
};


func void rtn_start_11114()
{
	TA_Rake_FP(8,0,20,0,"NW_MONASTERY_PLACE_HOLGER");
	TA_Pray_Innos_FP(20,0,8,0,"NW_MONASTERY_CHURCH_03");
};

func void rtn_smoke_11114()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_PATH_HABOUR_08_B");
	TA_Smoke_Joint(20,0,8,0,"NW_CITY_PATH_HABOUR_08_B");
};

func void rtn_teaching_11114()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_04");
	TA_Pray_Innos_FP(23,0,8,0,"NW_MONASTERY_CHURCH_03");
};

