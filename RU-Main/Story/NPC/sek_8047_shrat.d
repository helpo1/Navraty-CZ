
instance SEK_8047_SHRAT(Npc_Default)
{
	name[0] = "Шрэт";
	guild = GIL_SEK;
	id = 8047;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Spicker);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_SEKTANT_5,BodyTex_N,itar_slp_l);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_8047;
};


func void rtn_start_8047()
{
	TA_Stand_Eating(8,0,21,0,"NW_FOREST_PATH_PSIGROUP3_01");
	TA_Stand_ArmsCrossed(21,0,8,0,"NW_FOREST_PATH_PSIGROUP3_01");
};

