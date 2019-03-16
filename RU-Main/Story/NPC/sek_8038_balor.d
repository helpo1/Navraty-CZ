
instance SEK_8038_BALOR(Npc_Default)
{
	name[0] = "Балор";
	guild = GIL_SEK;
	id = 8038;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Streitaxt1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_BALOR,BodyTex_P,itar_slp_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_8038;
};


func void rtn_start_8038()
{
	TA_Stand_Eating(9,0,20,0,"NW_PSICAMP_BALOR");
	TA_Potion_Alchemy(20,0,22,0,"NW_PSICAMP_TION");
	TA_Sit_Bench(22,0,9,0,"NW_PSICAMP_BALOR_SIT");
};

func void rtn_campon_8038()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_18");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_18");
};

func void rtn_inbattle_8038()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8719");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8719");
};

