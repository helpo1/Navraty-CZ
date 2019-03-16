
instance KDW_1401_Addon_Cronos_NW(Npc_Default)
{
	name[0] = "Cronos";
	guild = GIL_KDW;
	id = 1401;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart_Cronos,BodyTex_P,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_PreStart_1401;
};


func void Rtn_PreStart_1401()
{
	TA_Smalltalk(8,0,20,0,"PORTAL");
	TA_Smalltalk(20,0,8,0,"PORTAL");
};

func void Rtn_Start_1401()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
};

func void Rtn_Ringritual_1401()
{
	TA_Circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
	TA_Circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

func void Rtn_PreRingritual_1401()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

func void Rtn_OpenPortal_1401()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
};

func void Rtn_TOT_1401()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"TOT");
	TA_Stand_ArmsCrossed(20,0,8,0,"TOT");
};

func void Rtn_TOTNW_1401()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"TOT_NW");
	TA_Stand_ArmsCrossed(20,0,8,0,"TOT_NW");
};

func void rtn_campon_1401()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDW_02");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDW_02");
};

func void rtn_inbattle_1401()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8691");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8691");
};

func void rtn_monastery_1401()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_MONASTERY_WTMG_02");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_MONASTERY_WTMG_02");
};

