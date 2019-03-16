
instance KDF_504_Parlan(Npc_Default)
{
	name[0] = "Parlan";
	guild = GIL_KDF;
	id = 504;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Corristo,BodyTex_N,ITAR_KDF_M_NPC);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	Mdl_SetModelFatness(self,0);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab01_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_504;
};

func void Rtn_Start_504()
{
	TA_Stand_Guarding(8,0,16,0,"NW_MONASTERY_PLACE_03");
	TA_Smalltalk(16,0,20,0,"NW_MONASTERY_PLACE_03");
	TA_Read_Bookstand(20,0,23,0,"NW_MONASTERY_CHURCH_BOOK_01");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_MAGE02_BED_02");
};

func void rtn_inbattle_504()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_KDF_05");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_KDF_05");
};

func void rtn_fleefrombattle_504()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_campon_504()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_KDF_04");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_KDF_04");
};

