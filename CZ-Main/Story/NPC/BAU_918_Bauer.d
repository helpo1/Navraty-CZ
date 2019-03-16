
instance BAU_918_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 918;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal17,BodyTex_N,ITAR_Bau_L_01);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_918;
};


func void Rtn_Start_918()
{
	TA_Smalltalk(8,5,22,5,"NW_BIGFARM_KITCHEN_09");
	TA_Sleep(22,5,8,5,"NW_BIGFARM_STABLE_04_TEMP_01");
};

func void rtn_comedeath_918()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

