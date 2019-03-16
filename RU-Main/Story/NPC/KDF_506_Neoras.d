
instance KDF_506_Neoras(Npc_Default)
{
	name[0] = "Неорас";
	guild = GIL_KDF;
	id = 506;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_NormalBart_Cronos,BodyTex_P,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	bodyStateInterruptableOverride = TRUE;
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_506;
};

func void Rtn_Start_506()
{
	TA_Potion_Alchemy(8,0,13,0,"NW_MONASTERY_ALCHEMY_01_NEOR_03");
	TA_Read_Bookstand(13,0,18,0,"NW_MONASTERY_ALCHEMY_01_NEOR_01");
	TA_Sit_Throne(18,0,22,0,"NW_MONASTERY_ALCHEMY_01_NEOR_02");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_ALCHEMY_01_NEOR_02");
};

func void rtn_inbattle_506()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_07");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_07");
};

func void rtn_campon_506()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_06");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_06");
};

