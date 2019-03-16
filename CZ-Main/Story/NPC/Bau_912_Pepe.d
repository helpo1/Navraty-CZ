
instance Bau_912_Pepe(Npc_Default)
{
	name[0] = "Pepe";
	guild = GIL_BAU;
	id = 912;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_scythe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Markus_Kark,BodyTex_N,ITAR_Bau_L_02);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_912;
};

func void Rtn_Start_912()
{
	TA_Stand_Eating(8,0,10,0,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_Guarding(10,0,12,0,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_ArmsCrossed(12,0,18,0,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_Drinking(18,0,21,0,"NW_BIGFARM_SHEEP2_02");
	TA_Sit_Bench(21,0,8,0,"NW_BIGFARM_HOUSE_OUT_05_THIEF");
};

func void rtn_comedeath_912()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_brokenleg_912()
{
	TA_Sit_Campfire(8,0,22,0,"NW_BIGFARM_SHEEP2_02");
	TA_Sit_Campfire(22,0,8,0,"NW_BIGFARM_SHEEP2_02");
};

