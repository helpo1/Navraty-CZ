
instance TPL_8045_HANIS(Npc_Default)
{
	name[0] = "Гор Ханис";
	guild = GIL_TPL;
	id = 8045;
	voice = 8;
	flags = 0;
	aivar[93] = TRUE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_TEMPLER_1,BodyTex_N,itar_tpl_l);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8045;
};


func void rtn_start_8045()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FOREST_PATH_PSIGROUP1_01");
	TA_Cook_Campfire(23,0,8,0,"NW_FOREST_PATH_PSIGROUP1_01_N");
};

func void rtn_campon_8045()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_00");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_00");
};

func void rtn_death_8045()
{
	TA_Sit_Campfire(8,0,23,0,"NW_FOREST_PATH_PSIGROUP1_01_DEATH");
	TA_Sit_Campfire(23,0,8,0,"NW_FOREST_PATH_PSIGROUP1_01_DEATH");
};

func void rtn_inbattle_8045()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8678");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8678");
};

