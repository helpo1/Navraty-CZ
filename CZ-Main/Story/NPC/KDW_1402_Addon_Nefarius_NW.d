
instance KDW_1402_Addon_Nefarius_NW(Npc_Default)
{
	name[0] = "Nefarius";
	guild = GIL_KDW;
	id = 1402;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_NormalBart_Nefarius,BodyTex_P,ITAR_KDW_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_1402;
};


func void Rtn_Start_1402()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_09");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_09");
};

func void Rtn_Ringritual_1402()
{
	TA_Circle(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
	TA_Circle(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
};

func void Rtn_PreRingritual_1402()
{
	TA_Stand_WP(8,0,20,0,"NW_TROLLAREA_PORTALTEMPEL_42");
	TA_Stand_WP(20,0,8,0,"NW_TROLLAREA_PORTALTEMPEL_42");
};

func void Rtn_OpenPortal_1402()
{
	TA_Study_WP(8,0,20,0,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
	TA_Study_WP(20,0,8,0,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
};

func void Rtn_TOT_1402()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"TOT");
	TA_Stand_ArmsCrossed(20,0,8,0,"TOT");
};

func void Rtn_TOTNW_1402()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"TOT_NW");
	TA_Stand_ArmsCrossed(20,0,8,0,"TOT_NW");
};

func void rtn_campon_1402()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDW_03");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDW_03");
};

func void rtn_inbattle_1402()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8690");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8690");
};

func void rtn_monastery_1402()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_MONASTERY_WTMG_03");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_MONASTERY_WTMG_03");
};

