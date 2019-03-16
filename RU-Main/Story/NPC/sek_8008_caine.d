
instance SEK_8008_CAINE(Npc_Default)
{
	name[0] = "Кайн";
	guild = GIL_SEK;
	id = 8008;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Streitaxt1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_CAINE,BodyTex_N,itar_slp_l);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8008;
};


func void rtn_start_8008()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"NW_PSICAMP_KAIN");
	TA_Sleep(21,0,8,0,"NW_PSICAMP_SLEEP_02");
};

func void rtn_campon_8008()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_13");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_13");
};

func void rtn_inbattle_8008()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8697");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8697");
};