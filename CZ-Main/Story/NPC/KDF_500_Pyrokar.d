
instance KDF_500_Pyrokar(Npc_Default)
{
	name[0] = "Pyrokar";
	guild = GIL_KDF;
	id = 500;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ItAr_KDF_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	Mdl_SetModelFatness(self,0);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab01_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_500;
};

func void Rtn_Start_500()
{
	TA_Sit_Throne(8,0,11,0,"NW_MONASTERY_THRONE_01");
	TA_Read_Bookstand(11,0,16,0,"NW_MONASTERY_CHURCH_BOOK_01");
	TA_Smalltalk(16,0,20,0,"NW_MONASTERY_PLACE_03");
	TA_Sit_Throne(20,0,22,0,"NW_MONASTERY_MAGE01_012_TEMP_02");
	TA_Sleep(22,0,8,0,"NW_MONASTERY_MAGE01_BED_02");
};

func void Rtn_RitualInnosEyeRepair_500()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	TA_Stand_Guarding(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

func void Rtn_MageSpeech_500()
{
	TA_MageSpeech(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	TA_MageSpeech(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

func void Rtn_RitualInnosEye_500()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

func void rtn_ship_500()
{
	TA_Stand_WP(8,0,23,0,"SHIP_IN_13");
	TA_Stand_WP(23,0,8,0,"SHIP_IN_13");
};

func void rtn_inbattle_500()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_01");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_01");
};

func void rtn_fleefrombattle_500()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_searchanswer_500()
{
	TA_Read_Bookstand(8,0,12,0,"NW_KDF_LIBRARY_PYROKAR_01");
	TA_Read_Bookstand(12,0,16,0,"NW_KDF_LIBRARY_PYROKAR_02");
	TA_Read_Bookstand(16,0,20,0,"NW_KDF_LIBRARY_PYROKAR_01");
	TA_Read_Bookstand(20,0,0,0,"NW_KDF_LIBRARY_PYROKAR_02");
	TA_Read_Bookstand(0,0,4,0,"NW_KDF_LIBRARY_PYROKAR_01");
	TA_Read_Bookstand(4,0,8,0,"NW_KDF_LIBRARY_PYROKAR_02");
};

func void rtn_campon_500()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_00");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_00");
};

