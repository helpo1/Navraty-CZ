
instance BAU_915_Baeuerin(Npc_Default)
{
	name[0] = NAME_Baeuerin;
	guild = GIL_BAU;
	id = 915;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_VlkBlonde,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_915;
};


func void Rtn_Start_915()
{
	TA_Pick_FP(6,0,22,0,"NW_BIGFARM_FIELD_01");
	TA_Sleep(22,0,6,0,"NW_BIGFARM_STABLE_SLEEP_03");
};

func void rtn_orcwar_915()
{
	TA_Sleep(7,0,22,0,"NW_BIGFARM_STABLE_SLEEP_03");
	TA_Sleep(22,0,7,0,"NW_BIGFARM_STABLE_SLEEP_03");
};

func void rtn_comedeath_915()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

