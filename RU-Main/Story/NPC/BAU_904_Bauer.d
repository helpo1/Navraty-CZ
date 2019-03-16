
instance BAU_904_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 904;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal17,BodyTex_N,ITAR_Bau_L_01);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_904;
};


func void Rtn_Start_904()
{
	TA_Saw(9,0,12,0,"NW_BIGFARM_KITCHEN_OUT_01");
	TA_Wood_Choop(12,0,20,0,"NW_BIGFARM_KITCHEN_OUT_CHOOP_01");
	TA_Sit_Chair(20,0,9,0,"NW_BIGFARM_KITCHEN_09");
};

func void rtn_comedeath_904()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

