
instance KDF_509_Isgaroth(Npc_Default)
{
	name[0] = "Исгарот";
	guild = GIL_KDF;
	id = 509;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Okyl,BodyTex_N,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_509;
};


func void Rtn_Start_509()
{
	TA_Pray_Innos_FP(6,0,21,0,"NW_MONASTERY_SHRINE_04");
	TA_Sit_Bench(21,0,6,0,"NW_MONASTERY_SHRINE_05");
};

func void rtn_orcatcbegan_509()
{
	TA_Stand_Guarding(6,55,20,30,"NW_MONASTERY_GRASS_03");
	TA_Stand_Guarding(20,30,6,55,"NW_MONASTERY_GRASS_03");
};

func void rtn_inbattle_509()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_10");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_10");
};

func void rtn_campon_509()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_09");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_09");
};

