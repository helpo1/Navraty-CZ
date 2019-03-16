
instance SEK_8012_TALAS(Npc_Default)
{
	name[0] = "Талас";
	guild = GIL_SEK;
	id = 8012;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",FACE_N_TALAS,BodyTex_N,itar_slp_ul);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_8012;
};


func void rtn_start_8012()
{
	TA_Stand_ArmsCrossed(9,0,20,0,"NW_PSICAMP_TALAS");
	TA_Sit_Bench(20,0,9,0,"NW_PSICAMP_TALAS_SIT");
};

func void rtn_campon_8012()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_16");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_16");
};

func void rtn_inbattle_8012()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8621");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8621");
};

