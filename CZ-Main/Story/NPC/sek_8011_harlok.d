
instance SEK_8011_HARLOK(Npc_Default)
{
	name[0] = "Harlok";
	guild = GIL_SEK;
	id = 8011;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_HARLOK,BodyTex_N,itar_sekbed);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_8011;
};


func void rtn_start_8011()
{
	TA_Smalltalk(9,0,22,0,"NW_PSICAMP_HARLOK");
	TA_Sleep(22,0,9,0,"NW_PSICAMP_SLEEP_01");
};

func void rtn_campon_8011()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_15");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_15");
};

func void rtn_inbattle_8011()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8723");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8723");
};

