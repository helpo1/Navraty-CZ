
instance KDW_14010_Addon_Cronos_ADW(Npc_Default)
{
	name[0] = "Cronos";
	guild = GIL_KDW;
	id = 14010;
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
	daily_routine = Rtn_Start_14010;
};


func void Rtn_Start_14010()
{
	TA_Study_WP(6,35,7,35,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP(7,35,8,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP(8,35,9,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP(9,35,10,10,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP(10,10,11,15,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP(11,15,12,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP(12,35,13,35,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP(13,35,14,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP(14,35,15,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP(15,35,16,10,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP(16,10,17,15,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP(17,15,18,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP(18,35,19,35,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP(19,35,20,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP(20,35,21,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP(21,35,22,0,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Sit_Chair(22,0,6,35,"ADW_ENTRANCE_BUILDING2_03");
};

func void rtn_orcinvasion_14010()
{
	TA_Guard_Passage(8,25,21,35,"ADW_PORTALTEMPEL_03");
	TA_Guard_Passage(21,35,8,25,"ADW_PORTALTEMPEL_03");
};

func void rtn_waterritual_14010()
{
	ta_waterritual(8,0,20,0,"ADW_ADANOSTEMPEL_RAVEN_08");
	ta_waterritual(20,0,8,0,"ADW_ADANOSTEMPEL_RAVEN_08");
};

func void rtn_waittempel_14010()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"ADW_ADANOSTEMPEL_WM_03");
	TA_Stand_ArmsCrossed(20,0,8,0,"ADW_ADANOSTEMPEL_WM_03");
};

func void rtn_tot_14010()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

