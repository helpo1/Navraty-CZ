
instance KDW_14050_Addon_Merdarion_ADW(Npc_Default)
{
	name[0] = "Merdarion";
	guild = GIL_KDW;
	id = 14050;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart_Nefarius,BodyTex_P,ITAR_KDW_L_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_14050;
};


func void Rtn_Start_14050()
{
	TA_Study_WP(6,5,7,15,"ADW_ENTRANCE_01");
	TA_Study_WP(7,15,8,25,"ADW_ENTRANCE_02");
	TA_Study_WP(8,25,9,35,"ADW_ENTRANCE_01");
	TA_Study_WP(9,35,10,45,"ADW_ENTRANCE_02");
	TA_Study_WP(10,45,11,55,"ADW_ENTRANCE_01");
	TA_Study_WP(11,55,12,5,"ADW_ENTRANCE_02");
	TA_Study_WP(12,5,13,15,"ADW_ENTRANCE_01");
	TA_Study_WP(13,15,14,25,"ADW_ENTRANCE_02");
	TA_Study_WP(14,25,15,35,"ADW_ENTRANCE_01");
	TA_Study_WP(15,35,16,45,"ADW_ENTRANCE_02");
	TA_Study_WP(16,45,17,55,"ADW_ENTRANCE_01");
	TA_Study_WP(17,55,18,5,"ADW_ENTRANCE_02");
	TA_Study_WP(18,5,19,15,"ADW_ENTRANCE_01");
	TA_Study_WP(19,15,20,25,"ADW_ENTRANCE_02");
	TA_Study_WP(20,25,21,35,"ADW_ENTRANCE_01");
	TA_Study_WP(21,35,22,45,"ADW_ENTRANCE_02");
	TA_Sleep(22,45,6,5,"ADW_ENTRANCE_BUILDING2_05");
};

func void rtn_orcinvasion_14050()
{
	TA_Practice_Magic(8,25,21,35,"ADW_PORTALTEMPEL_03D");
	TA_Practice_Magic(21,35,8,25,"ADW_PORTALTEMPEL_03D");
};

func void rtn_waterritual_14050()
{
	ta_waterritual(8,0,20,0,"ADW_ADANOSTEMPEL_RHADEMES_18");
	ta_waterritual(20,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_18");
};

func void rtn_waittempel_14050()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"ADW_ADANOSTEMPEL_WM_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"ADW_ADANOSTEMPEL_WM_01");
};

func void rtn_tot_14050()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

