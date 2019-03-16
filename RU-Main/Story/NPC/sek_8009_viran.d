
instance SEK_8009_VIRAN(Npc_Default)
{
	name[0] = "Виран";
	guild = GIL_SEK;
	id = 8009;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Kriegskeule);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_VIRAN,BodyTex_N,itar_slp_l);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_8009;
};


func void rtn_start_8009()
{
	TA_Smith_Sharp(8,0,22,0,"NW_PSICAMP_SMITH_SHARP");
	TA_Sit_Bench(22,0,8,0,"NW_PSICAMP_VIRAN_SIT");
};

func void rtn_campon_8009()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_14");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_14");
};

func void rtn_inbattle_8009()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8699");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8699");
};

