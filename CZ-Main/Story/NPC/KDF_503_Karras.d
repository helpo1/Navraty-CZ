
instance KDF_503_Karras(Npc_Default)
{
	name[0] = "Karras";
	guild = GIL_KDF;
	id = 503;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab01_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_503;
};


func void Rtn_Start_503()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_02");
};

func void rtn_meetkiller_503()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_SMFOREST_09");
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_SMFOREST_09");
};

func void rtn_inbattle_503()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_04");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_04");
};

func void rtn_campon_503()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_03");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_03");
};

