
instance KDF_510_Hyglas(Npc_Default)
{
	name[0] = "Hyglas";
	guild = GIL_KDF;
	id = 510;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart09,BodyTex_N,ITAR_KDF_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab01_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_510;
};


func void Rtn_Start_510()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_08");
	TA_Read_Bookstand(23,0,8,0,"NW_MONASTERY_RUNEMAKER_08");
};

func void rtn_inbattle_510()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_11");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_11");
};

func void rtn_campon_510()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_10");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_10");
};

