
instance BAU_907_Wasili(Npc_Default)
{
	name[0] = "Wasili";
	guild = GIL_BAU;
	id = 907;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart02,BodyTex_N,ITAR_Bau_M_Ext);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_907;
};


func void Rtn_Start_907()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_HOUSE_16");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_HOUSE_16");
};

func void rtn_comedeath_907()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

