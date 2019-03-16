
instance GUR_8037_CADAR(Npc_Default)
{
	name[0] = "Baal Cadar";
	guild = GIL_GUR;
	id = 8037;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_NORMAL;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_IDOLCADAR,BodyTex_N,itar_gur_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab04_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8037;
};


func void rtn_start_8037()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"NW_PSICAMP_CADAR");
	TA_Sleep(21,0,8,0,"NW_PSICAMP_SLEEP_05");
};

func void rtn_campon_8037()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_GURU_05");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_GURU_05");
};

func void rtn_inbattle_8037()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8682");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8682");
};

