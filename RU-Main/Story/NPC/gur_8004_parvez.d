
instance GUR_8004_PARVEZ(Npc_Default)
{
	name[0] = "Идол Парвез";
	guild = GIL_GUR;
	id = 8004;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_IDOLPARVEZ,BodyTex_N,itar_gur_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_EnemyOverride] = TRUE;
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab04_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8004;
};


func void rtn_start_8004()
{
	TA_Stand_ArmsCrossed(8,0,19,50,"NW_PSICAMP_PARVEZ");
	TA_Smoke_Waterpipe(19,50,0,10,"NW_CITY_RAUCH_02");
	TA_Sit_Chair(0,10,8,0,"NW_PSICAMP_PARVEZ_SIT");
};

func void rtn_joinpsicamp_8004()
{
	TA_Smoke_Waterpipe(8,0,19,0,"NW_CITY_RAUCH_02");
	TA_Sit_Chair(19,0,8,0,"NW_CITY_UPTOWN_HUT_02_IN");
};

func void rtn_psicamp_8004()
{
	TA_Stand_ArmsCrossed(8,0,19,0,"WP_NW_PSICAMP_PATH_03_20");
	TA_Stand_ArmsCrossed(19,0,8,0,"WP_NW_PSICAMP_PATH_03_20");
};

func void rtn_campon_8004()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_GURU_03");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_GURU_03");
};

func void rtn_inbattle_8004()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8684");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8684");
};

