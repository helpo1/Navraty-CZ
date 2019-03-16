
instance KDF_505_Marduk(Npc_Default)
{
	name[0] = "Marduk";
	guild = GIL_KDF;
	id = 505;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_OldMan_Gravo,BodyTex_P,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	daily_routine = Rtn_Start_505;
};


func void Rtn_Start_505()
{
	TA_Stand_Guarding(8,0,12,0,"NW_MONASTERY_CHAPELL_01");
	TA_Preach_Marduk(12,0,17,0,"NW_MONASTERY_CORRIDOR_03");
	TA_Study_WP(17,0,22,0,"NW_MONASTERY_CHAPELL_01");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_MAGE01_BED_01");
};

func void rtn_inbattle_505()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_06");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_06");
};

func void rtn_campon_505()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_05");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_05");
};

